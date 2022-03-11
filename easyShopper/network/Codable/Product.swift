//
//  Producf.swift
//  easyShopper
//
//  Created by Oscar Navidad on 9/3/22.
//

import Foundation

struct ProductsValue: Codable {
    let barcode, productsDescription, id: String
    let imageURL: String
    let name: String
    let retailPrice: Int
    let costPrice: Int?

    enum CodingKeys: String, CodingKey {
        case barcode
        case productsDescription = "description"
        case id
        case imageURL = "image_url"
        case name
        case retailPrice = "retail_price"
        case costPrice = "cost_price"
    }
}

struct ProductRepresentable: Codable, Hashable {
    let barcode, id: String
    let imageURL: String
    let name: String
    let costPrice: Int
    let productsDescription: String
}

typealias Products = [String: ProductsValue]
