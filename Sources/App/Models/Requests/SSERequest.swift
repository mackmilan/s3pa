//
// Created by Andre Silva on 2019-08-05.
//

import Vapor

struct SSERequest: PathComponentsRepresentable {

    var uuid: String

    func convertToPathComponents() -> [PathComponent] {
        return []
    }

}