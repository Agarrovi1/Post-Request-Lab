//
//  ClientWrapper.swift
//  PostRequestsWithAirtable
//
//  Created by Angela Garrovillas on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
struct ClientWrapper: Codable {
    let records: [RecordWrapper]
    
}

struct RecordWrapper:Codable {
    let fields: Fields
}

struct Fields: Codable {
    let client: [String?]
    private enum CodingKeys: String, CodingKey {
        case client = "Client"
    }
}

func giveAllClients(arr: [RecordWrapper]) -> [String] {
    var clients = [String]()
    for a in arr {
        for b in a.fields.client {
            if let unwrap = b {
            clients.append(unwrap)
            }
        }
    }
    return clients
}
