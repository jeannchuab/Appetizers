//
//  OrderModel.swift
//  Appetizers
//
//  Created by Jeann Luiz on 26/02/24.
//

import SwiftUI

final class OrderViewModel: ObservableObject {
    
    @Published var appetizers: [AppetizerModel] = []
    
    var totalPrice: Double {
        appetizers.reduce(0) { $0 + $1.price }
    }
    
    func add(_ appetizer: AppetizerModel) {
        self.appetizers.append(appetizer)
    }
        
    func remove(at indexSet: IndexSet) {
        self.appetizers.remove(atOffsets: indexSet)
    }
}


