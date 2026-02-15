const std = @import("std");

pub fn Channel(comptime T: type) type {
    return struct {
        lock: std.Thread.Mutex = .{},
        buffer: []T,
        head: usize = 0,
        tail: usize = 0,
        count: usize = 0,
        writeable: std.Thread.Condition = .{},
        readable: std.Thread.Condition = .{},

        const Self = @This();

        pub fn init(buffer: []T) Self {
            return Self{ .buffer = buffer };
        }

        fn isFull(self: *const Self) bool {
            return self.count == self.buffer.len;
        }

        fn isEmpty(self: *const Self) bool {
            return self.count == 0;
        }

        pub fn put(self: *Self, item: T) void {
            self.lock.lock();
            defer {
                self.lock.unlock();
                self.readable.signal();
            }

            while (self.isFull()) {
                self.writeable.wait(&self.lock);
            }

            self.buffer[self.tail] = item;
            self.tail = (self.tail + 1) % self.buffer.len;
            self.count += 1;
        }

        pub fn tryPut(self: *Self, item: T) !void {
            self.lock.lock();
            defer self.lock.unlock();

            if (self.isFull()) {
                return error.BufferFull;
            }

            self.buffer[self.tail] = item;
            self.tail = (self.tail + 1) % self.buffer.len;
            self.count += 1;

            self.readable.signal();
        }

        pub fn get(self: *Self) T {
            self.lock.lock();
            defer {
                self.lock.unlock();
                self.writeable.signal();
            }

            while (self.isEmpty()) {
                self.readable.wait(&self.lock);
            }

            const item = self.buffer[self.head];
            self.head = (self.head + 1) % self.buffer.len;
            self.count -= 1;
            return item;
        }

        pub fn getOrNull(self: *Self) ?T {
            self.lock.lock();
            defer self.lock.unlock();

            if (self.isEmpty()) {
                self.writeable.signal();
                return null;
            }

            const item = self.buffer[self.head];
            self.head = (self.head + 1) % self.buffer.len;
            self.count -= 1;
            return item;
        }
    };
}
