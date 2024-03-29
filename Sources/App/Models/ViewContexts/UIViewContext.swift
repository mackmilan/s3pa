//
// Created by Andre Silva on 2019-08-05.
//

import Foundation
import Vapor

class UIViewContext: BaseViewContext {

    required init(session: Session, dataModel: BaseDataModel) {
        super.init(session: session, dataModel: dataModel)
    }

    required init(from decoder: Decoder) {
        super.init(from: decoder)
    }
}

class UIDataModel: BaseDataModel {

    var nome: String = ""
    var email: String = ""
    var password: String = ""

    required init() {
        super.init()
    }

    required init(from decoder: Decoder) {
        super.init(from: decoder)
    }

}