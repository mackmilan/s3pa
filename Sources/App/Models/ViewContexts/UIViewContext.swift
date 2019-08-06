//
// Created by Andre Silva on 2019-08-05.
//

import Foundation
import Vapor

struct UIViewContext: BaseViewContext, Codable {

    var uuid: String
    var context: String

}