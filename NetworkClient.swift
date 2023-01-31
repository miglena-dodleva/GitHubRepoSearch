//
//  NetworkClient.swift
//  search2
//
//  Created by Diviana on 4.01.23.


import Foundation


protocol NetworkClient {
    
    func executeRequest( request: URLRequest) async throws -> (data: Data, response: URLResponse)
    
}
