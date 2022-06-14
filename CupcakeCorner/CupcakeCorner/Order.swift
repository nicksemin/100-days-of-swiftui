//
//  Order.swift
//  CupcakeCorner
//
//  Created by Nick Semin on 09.06.2022.
//

import SwiftUI

class Order: ObservableObject, Codable {
    enum CodingKeys:CodingKey {
        case type, quantity, extraFrosting, sprinkles, name, streetAddress, city, zip
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                sprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var sprinkles = false
    
    @Published var name: String = ""
    @Published var streetAddress: String = ""
    @Published var city: String = ""
    @Published var zip: String = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || zip.isEmpty || city.isEmpty
        || name == " " || streetAddress == " " || zip == " " || city == " "{
            return false
        }
        
        return true
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        
        cost += (Double(type) /  2)
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if sprinkles {
            cost += Double(quantity) /  2
        }
        
        return cost
    }
    
    init() {
         
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(sprinkles, forKey: .sprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        sprinkles = try container.decode(Bool.self, forKey: .sprinkles)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        zip = try container.decode(String.self, forKey: .zip)
        city = try container.decode(String.self, forKey: .city)
    }
}
