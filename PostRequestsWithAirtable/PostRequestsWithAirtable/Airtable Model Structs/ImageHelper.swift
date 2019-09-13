//
//  ImageHelper.swift
//  PostRequestsWithAirtable
//
//  Created by Angela Garrovillas on 9/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation
import UIKit

struct ImageHelper {
    static func getImage(url: String, completionHandler: @escaping (Result<UIImage,AppError>) -> ()) {
        guard let urlFromString = URL(string: url) else {
            completionHandler(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: urlFromString, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                if let image = UIImage(data: data) {
                    completionHandler(.success(image))
                }
            }
        }
    }
}
