//
// Created by Andre Silva on 2019-08-03.
//

import Foundation
import Vapor

final class SSEController: RouteCollection {

    func boot(router: Router) throws {
        let sseRoutes = router.grouped("s3pa")
        sseRoutes.get("sse", String.parameter, use: listen)
    }

    public func listen(_ req: Request) throws -> Response {

        let response = req.makeResponse()
        let stream = HTTPChunkedStream(on: req)
        let bbAllocator: ByteBufferAllocator = (req.http.channel?.allocator != nil) ? req.http.channel!.allocator : ByteBufferAllocator()

        response.http.headers.add(name: "Content-Type", value: "text/event-stream")
        response.http.body = HTTPBody(chunked: stream)

        var msg = "event:update\n"
        msg += "data:{\"name\":\"Teste\"}\n\n"

        var buffer: ByteBuffer = bbAllocator.buffer(capacity: msg.count)
        buffer.write(string: msg)

//        req.eventLoop.execute {
//            _ = stream.write(.chunk(buffer))
//        }
//
//        req.eventLoop.execute {
//            _ = stream.write(.end)
//        }

        return response
    }

}