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
}

struct ClientFieldWrapper: Codable {
    let about: String
    let name: String
    let logo: [LogoWrapper]?
    
    func getLargeImageUrl() -> String {
        if let logo = logo {
            return logo[0].thumbnails.large.url
        }
        return ""
    }
}
struct LogoWrapper: Codable {
    let thumbnails: Thumbnails
}
struct Thumbnails: Codable {
    let large: Large
}
struct Large: Codable {
    let url: String
}
