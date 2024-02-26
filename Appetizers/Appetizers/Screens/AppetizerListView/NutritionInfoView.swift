//
//  NutritionInfoView.swift
//  Appetizers
//
//  Created by Jeann Luiz on 22/02/24.
//

import SwiftUI

struct NutritionInfoView: View {
    var title: String
    var value: Int
    
    var body: some View {
        VStack {
            Text(title)
                .bold()
                .font(.caption)
//                .italic() //iOS 16 or newer
            
            Text("\(value)")
                .foregroundStyle(.secondary)
        }
    }
}


#Preview {
    NutritionInfoView(title: "Carbs", value: MockData.sampleAppetizer1.carbs)
}
