//
//  RepositoryBuilder.swift
//  WBooks
//
//  Created by Nacho 2 on 13/05/2020.
//  Copyright © 2020 Wolox. All rights reserved.
//

import Foundation
import Networking

public class RepositoryBuilder {
    static var DefaultNetworkingConfiguration: NetworkingConfiguration {
      var config = NetworkingConfiguration()
      config.domainURL = "swift-training-backend.herokuapp.com"
      return config
    }
    
    static func getDefaultBookRepository() -> BookRepository {
          return BookRepository(configuration: RepositoryBuilder.DefaultNetworkingConfiguration,
                                defaultHeaders: ["Content-Type": "application/json",
                                                 "Accept": "application/json"])
    }

    static func getDefaultUserRepository() -> UserRepository {
          return UserRepository(configuration: RepositoryBuilder.DefaultNetworkingConfiguration,
                                defaultHeaders: ["Content-Type": "application/json",
                                                 "Accept": "application/json"])
    }
}
