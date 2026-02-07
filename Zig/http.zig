const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var client = std.http.Client{ .allocator = allocator };
    defer client.deinit();

    const uri = std.Uri.parse("https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY") catch unreachable;

    var header_buf: [4096]u8 = undefined;
    var req = try client.open(.GET, uri, .{ .server_header_buffer = &header_buf });
    defer req.deinit();

    try req.send();
    try req.wait();

    const body = try req.reader().readAllAlloc(allocator, 1024 * 1024);
    defer allocator.free(body);

    const stdout = std.io.getStdOut().writer();
    try stdout.print("{s}\n", .{body});
}
