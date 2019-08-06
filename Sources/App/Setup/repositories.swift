//
// Created by Andre Silva on 2019-08-05.
//

import Vapor

public func setupRepositories(services: inout Services, config: inout Config) {

    preferDatabaseRepositories(config: &config)

}

private func preferDatabaseRepositories(config: inout Config) {
}
