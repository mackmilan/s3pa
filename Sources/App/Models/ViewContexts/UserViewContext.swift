//
// Created by Andre Silva on 2019-08-06.
//

import Vapor

class UserViewContext: BaseViewContext {

    required init(session: Session, dataModel: BaseDataModel) {
        super.init(session: session, dataModel: dataModel)
    }

    required init(from decoder: Decoder) {
        super.init(from: decoder)
    }

}

class UserDataModel: BaseDataModel {

    var nome: String = ""
    var email: String = ""
    var password: String = ""

    required init() {
        super.init()
    }

    required init(from decoder: Decoder) {
        super.init(from: decoder)
    }

    init(nome: String, email: String, password: String) {
        super.init()

        self.nome = nome
        self.email = email
        self.password = password
    }

}