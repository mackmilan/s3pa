//
// Created by Andre Silva on 2019-08-06.
//

import Foundation
import Vapor

final class UUIDTag: TagRenderer {

    func render(tag: TagContext) throws -> EventLoopFuture<TemplateData> {
        return tag.container.future(.string(UUID().uuidString))
    }

}