const std = @import("std");

pub fn initWasm(gpa: std.mem.Allocator, path: []const u8) !void {
    const dockerFile = @embedFile("templates/wasm/Dockerfile");
    const dockerComposeFile = @embedFile("templates/wasm/docker-compose.yml");
    const shellHtmlFile = @embedFile("templates/wasm/shell.html");

    const cwd = try std.fs.cwd().openDir(".", .{});
    const dir_name = try cwd.realpathAlloc(gpa, ".");
    defer gpa.free(dir_name);
    const project_name = std.fs.path.basename(dir_name);

    const dockerfile_content = try gpa.dupe(u8, dockerFile);
    defer gpa.free(dockerfile_content);

    const dockerfile_replaced = try std.mem.replaceOwned(
        u8,
        gpa,
        dockerfile_content,
        "{{{ PROJECT_NAME }}}",
        project_name,
    );
    defer gpa.free(dockerfile_replaced);

    const dockerfile_final = try std.mem.replaceOwned(
        u8,
        gpa,
        dockerfile_replaced,
        "{{{ MAIN_FILE }}}",
        path,
    );
    defer gpa.free(dockerfile_final);

    const compose_content = try gpa.dupe(u8, dockerComposeFile);
    defer gpa.free(compose_content);

    const compose_replaced = try std.mem.replaceOwned(
        u8,
        gpa,
        compose_content,
        "{{{ PROJECT_NAME }}}",
        project_name,
    );
    defer gpa.free(compose_replaced);

    var dockerfile_out = try cwd.createFile("Dockerfile", .{ .read = false });
    defer dockerfile_out.close();
    try dockerfile_out.writeAll(dockerfile_final);

    var compose_out = try cwd.createFile("docker-compose.yml", .{ .read = false });
    defer compose_out.close();
    try compose_out.writeAll(compose_replaced);

    var shell_file_out = try cwd.createFile("shell.html", .{ .read = false });
    defer shell_file_out.close();
    try shell_file_out.writeAll(shellHtmlFile);
}

pub fn initExe(gpa: std.mem.Allocator, path: []const u8) !void {
    const dockerFile = @embedFile("templates/exe/Dockerfile");
    const dockerComposeFile = @embedFile("templates/exe/docker-compose.yml");

    const cwd = try std.fs.cwd().openDir(".", .{});
    const dir_name = try cwd.realpathAlloc(gpa, ".");
    defer gpa.free(dir_name);
    const project_name = std.fs.path.basename(dir_name);

    const dockerfile_content = try gpa.dupe(u8, dockerFile);
    defer gpa.free(dockerfile_content);

    const dockerfile_replaced = try std.mem.replaceOwned(
        u8,
        gpa,
        dockerfile_content,
        "{{{ PROJECT_NAME }}}",
        project_name,
    );
    defer gpa.free(dockerfile_replaced);

    const dockerfile_final = try std.mem.replaceOwned(
        u8,
        gpa,
        dockerfile_replaced,
        "{{{ MAIN_FILE }}}",
        path,
    );
    defer gpa.free(dockerfile_final);

    const compose_content = try gpa.dupe(u8, dockerComposeFile);
    defer gpa.free(compose_content);

    const compose_replaced = try std.mem.replaceOwned(
        u8,
        gpa,
        compose_content,
        "{{{ PROJECT_NAME }}}",
        project_name,
    );
    defer gpa.free(compose_replaced);

    var dockerfile_out = try cwd.createFile("Dockerfile", .{ .read = false });
    defer dockerfile_out.close();
    try dockerfile_out.writeAll(dockerfile_final);

    var compose_out = try cwd.createFile("docker-compose.yml", .{ .read = false });
    defer compose_out.close();
    try compose_out.writeAll(compose_replaced);
}
