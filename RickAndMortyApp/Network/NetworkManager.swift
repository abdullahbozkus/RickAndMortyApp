//
//  NetworkManager.swift
//  RickAndMortyApp
//
//  Created by Abdullah Bozkus on 11.07.2022.
//

import Foundation
import Alamofire
import Apollo

final class NetworkManager {
    
    static let shared: NetworkManager = {
        let instance = NetworkManager()
        return instance
    }()
    
    lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    
    let reachabilityManager = NetworkReachabilityManager()?.isReachable
    
    func isConnectedToInternet() -> Bool {
        return reachabilityManager ?? false
    }
    
}
