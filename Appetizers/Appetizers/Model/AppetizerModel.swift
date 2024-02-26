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
    static let sampleAppetizer1 = AppetizerModel(id: 1, protein: 10, imageURL: "", name: "Yaksoba 1",
                                                description: "This is a very tasty Yaksoba lorem lorem ipsum lorem with onions lorem ipsum.", price: 10.00,
                                                calories: 99, carbs: 44)
    
    static let sampleAppetizer2 = AppetizerModel(id: 2, protein: 10, imageURL: "", name: "Yaksoba 2",
                                                description: "This is a very tasty Yaksoba lorem lorem ipsum lorem with onions lorem ipsum.", price: 22.00,
                                                calories: 99, carbs: 44)
    
    static let sampleAppetizer3 = AppetizerModel(id: 3, protein: 10, imageURL: "", name: "Yaksoba 2",
                                                description: "This is a very tasty Yaksoba lorem lorem ipsum lorem with onions lorem ipsum.", price: 33.00,
                                                calories: 99, carbs: 44)
    
    static let sampleAppetizer4 = AppetizerModel(id: 4, protein: 10, imageURL: "", name: "Yaksoba 4",
                                                description: "This is a very tasty Yaksoba lorem lorem ipsum lorem with onions lorem ipsum.", price: 44.44,
                                                calories: 50, carbs: 44)
        
    static let sampleAppetizerList: [AppetizerModel] = [sampleAppetizer1, sampleAppetizer2, sampleAppetizer3, sampleAppetizer4]
    static let orderItems: [AppetizerModel] = [sampleAppetizer1, sampleAppetizer2, sampleAppetizer3, sampleAppetizer4]
}
