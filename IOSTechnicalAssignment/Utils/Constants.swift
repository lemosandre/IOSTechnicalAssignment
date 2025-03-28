//
//  Constants.swift
//  IOSTechnicalAssignment
//
//  Created by Andre Lemos on 2025-03-27.
//

import Foundation

struct API {
    static let url = "https://api.pexels.com"
    struct Path {
        static let curatedPhotos = "/v1/curated"
    }
    
    struct DefaultValue {
        static let timeOut = 60.00
        static let notFoundImageURL = "https://cdn1.polaris.com/globalassets/pga/accessories/my20-orv-images/no_image_available6.jpg?v=71397d75&format=webp&height=800"
        static let key = "api_key"
        static let perPage = "per_page"
    }
    
    struct Headers {
        static let applicationJson = "application/json"
        static let contentType = "Content-Type"
        static let authorization = "Authorization"
        static let apiKey = "0rWBGhCRoFiVbbq4duycTLqsvROdrjKqHdGkciUBYdubEU21DoqNC6yY"
    }
}
