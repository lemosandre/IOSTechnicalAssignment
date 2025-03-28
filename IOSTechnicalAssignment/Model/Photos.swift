//
//  Photos.swift
//  IOSTechnicalAssignment
//
//  Created by Andre Lemos on 2025-03-27.
//
import Foundation

// MARK: - Apod
struct Photos: Codable {
    var page: Int = 0
    var perPage: Int = 0
    var photos: [Photo] = []
    var nextPage: String = ""

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case photos
        case nextPage = "next_page"
    }
}

// MARK: - Photo
struct Photo: Codable {
    let id, width, height: Int?
    let url: String?
    let photographer: String?
    let photographerURL: String?
    let photographerID: Int?
    let avgColor: String?
    let src: Src?
    let liked: Bool?
    let alt: String?

    enum CodingKeys: String, CodingKey {
        case id, width, height, url, photographer
        case photographerURL = "photographer_url"
        case photographerID = "photographer_id"
        case avgColor = "avg_color"
        case src, liked, alt
    }
}

// MARK: - Src
struct Src: Codable {
    let original, large2X, large, medium: String?
    let small, portrait, landscape, tiny: String?

    enum CodingKeys: String, CodingKey {
        case original
        case large2X = "large2x"
        case large, medium, small, portrait, landscape, tiny
    }
}
