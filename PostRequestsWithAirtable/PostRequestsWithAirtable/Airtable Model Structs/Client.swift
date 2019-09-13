//
//  Clients.swift
//  PostRequestsWithAirtable
//
//  Created by Angela Garrovillas on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
struct Client: Codable {
    let fields: ClientFieldWrapper
    static func getClients(from jsonData: Data) throws -> Client {
        let response = try JSONDecoder().decode(Client.self, from: jsonData)
        return response
    }
    init() {
        fields = ClientFieldWrapper(about: "", name: "", logo: nil)
    }
}

struct ClientFieldWrapper: Codable {
    let about: String
    let name: String
    let logo: [LogoWrapper]?
    
    private enum CodingKeys: String, CodingKey {
        case about = "About"
        case name = "Name"
        case logo = "Logo"
    }
    
    func getLargeImageUrl() -> String {
        if let logo = logo {
            return logo[0].url
        }
        return ""
    }
}
struct LogoWrapper: Codable {
    let url: String
    let thumbnails: Thumbnails
}
struct Thumbnails: Codable {
    let large: Large
}
struct Large: Codable {
    let url: String
}
