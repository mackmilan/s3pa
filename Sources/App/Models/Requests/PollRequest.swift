//
// Created by Andre Silva on 2019-08-03.
//

import Foundation
import Vapor

struct PollRequest: Content {

    var uuid: String
    var source: String
    var target: String

}