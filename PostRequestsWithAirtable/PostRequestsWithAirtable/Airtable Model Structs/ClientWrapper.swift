//
//  ClientWrapper.swift
//  PostRequestsWithAirtable
//
//  Created by Angela Garrovillas on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
struct ClientWrapper: Codable {
    init() {
        records = [RecordWrapper(fields: Fields(client: nil))]
    }
    let records: [RecordWrapper]
    static func getClientIds(from jsonData: Data) throws -> ClientWrapper {
        let response = try JSONDecoder().decode(ClientWrapper.self, from: jsonData)
        return response
    }
    
    
    
}

struct RecordWrapper:Codable {
    let fields: Fields
}

struct Fields: Codable {
    let client: [String]?
    private enum CodingKeys: String, CodingKey {
        case client = "Client"
    }
}

func giveAllClients(wrapper: ClientWrapper) -> [String] {
    var clients = [String]()
    for a in wrapper.records {
        if let clientArr = a.fields.client {
            for b in clientArr {
                clients.append(b)
            }
        }
    }
    return clients
}
