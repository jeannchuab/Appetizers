//
//  AppetizerModel.swift
//  Appetizers
//
//  Created by Jeann Luiz on 21/02/24.
//

import Foundation

struct AppetizerModel: Decodable, Identifiable {
    let id: Int
    let protein: Int
    let imageURL: String
    let name: String
    let description: String
    let price: Double
    let calories: Int
    let carbs: Int
    
    enum CodingKeys: String, CodingKey {
        case id, protein, imageURL, name, description, price, calories, carbs
    }

    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(Int.self, forKey: .id)
//        protein = try container.decode(Int.self, forKey: .protein)
//        imageURL = try container.decode(URL.self, forKey: .imageURL)
//        name = try container.decode(String.self, forKey: .name)
//        description = try container.decode(String.self, forKey: .description)
//        price = try container.decode(Double.self, forKey: .price)
//        calories = try container.decode(Int.self, forKey: .calories)
//        carbs = try container.decode(Int.self, forKey: .carbs)
//    }
}

extension AppetizerModel {
    static func random() -> AppetizerModel {
        let id = Int.random(in: 1...100)
        let protein = Int.random(in: 0...20)
        let imageURL = "https://example.com/\(UUID().uuidString).jpg"
        let name = ["Asian Flank Steak", "Blackened Shrimp", "Grilled Chicken", "Vegetarian Pasta", "Salmon Salad"].randomElement()!
        let description = "Description of \(name)"
        let price = Double.random(in: 5.99...15.99)
        let calories = Int.random(in: 200...600)
        let carbs = Int.random(in: 0...20)
        return AppetizerModel(id: id, protein: protein, imageURL: imageURL, name: name, description: description, price: price, calories: calories, carbs: carbs)
    }
}

struct AppetizerResponse: Decodable {
    let request: [AppetizerModel]
}

struct MockData {
    static let sampleAppetizer = AppetizerModel(id: 1, protein: 10, imageURL: "", name: "Yaksoba",
                                                description: "This is a very tasty Yaksoba lorem lorem ipsum lorem with onions lorem ipsum.", price: 10.00,
                                                calories: 99, carbs: 44)
    
    static let sampleAppetizerList = [AppetizerModel].init(repeating: MockData.sampleAppetizer, count: 20)    
}
