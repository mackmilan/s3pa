//
// Created by Andre Silva on 2019-08-05.
//

import Foundation
import Vapor

final class PollResponse: Codable {

    var uuid: String
    var context: String

    init(uuid: String, context: String) {
        self.uuid = uuid
        self.context = context
    }

    func encode() -> Data {
        let encoder = JSONEncoder()
        return try! encoder.encode(self)
    }

}