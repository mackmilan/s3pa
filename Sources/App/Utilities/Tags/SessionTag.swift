//
// Created by Andre Silva on 2019-08-05.
//

import Foundation
import Vapor

final class SessionTag: TagRenderer {

    func render(tag: TagContext) throws -> EventLoopFuture<TemplateData> {
        return tag.container.future(.string(""))
    }

}