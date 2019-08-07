//
// Created by Andre Silva on 2019-08-05.
//

import Vapor

class BaseViewContext: Codable {

    var uuid: String
    var context: String
    var dataModel: String

    required init(from decoder: Decoder) {
        self.uuid = ""
        self.context = ""
        self.dataModel = ""
    }

    required init(session: Session, dataModel: BaseDataModel) {
        self.uuid = session["uuid"]!
        self.context = session["context"]!
        self.dataModel = dataModel.encode()
    }
}

class BaseDataModel: Codable {

    required init() {
    }

    required init(from decoder: Decoder) {
    }

    func encode() -> String {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(self)

        return try String(data: data!, encoding: .utf8)!
    }

}