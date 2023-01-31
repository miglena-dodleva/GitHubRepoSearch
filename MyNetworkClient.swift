//
//  MyNetworkClient.swift
//  search2
//
//  Created by Diviana on 4.01.23.
//

import Foundation


class MyNetworkClient: NetworkClient {
    
    
    private let session: URLSession
    
    init() {

        let configuration = URLSessionConfiguration.default

//        configuration.httpAdditionalHeaders = ["Accept": "application.json",
//               "Authorization": "Bearer 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"
//
//        ]
        session = URLSession(configuration: configuration)

    }
    
    func executeRequest(request: URLRequest) async throws -> (data: Data, response: URLResponse) {
        
        var requestWithCachePolicy = request
        requestWithCachePolicy.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return try await session.data(for: request)
    }
}

