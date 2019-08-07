//
// Created by Andre Silva on 2019-08-06.
//

import Foundation
import Vapor

struct UserRequest: RequestModel {

    var nome: String
    var password: String
    var password_retype: String
    var email: String

}
