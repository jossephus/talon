const std = @import("std");
const tolan = @import("tolan");
const c = @cImport({
    @cInclude("stdio.h");
});

export fn run(code: [*]const u8, len: usize) void {
    tolan.runWasm(code[0..len]) catch @panic("Failed to run wasm");
}

pub fn main() void {}

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

export fn sub(a: i32, b: i32) i32 {
    return a - b;
}

extern fn emscripten_cancel_main_loop() void;

export fn stop_game() void {
    emscripten_cancel_main_loop();
}
