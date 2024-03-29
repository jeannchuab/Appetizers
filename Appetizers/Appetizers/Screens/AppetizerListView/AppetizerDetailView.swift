//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Jeann Luiz on 22/02/24.
//

import SwiftUI

struct AppetizerDetailView: View {            
    
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    let appetizer: AppetizerModel
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        
        VStack {
            //TODO: Use cache to download the image
            CacheAsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(height: 190)
            .cornerRadius(8)
                        
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfoView(title: "Calories", value: appetizer.calories)
                    NutritionInfoView(title: "Carbs", value: appetizer.carbs)
                    NutritionInfoView(title: "Protein", value: appetizer.protein)
                }
            }
            .padding(.top)
            
            Spacer()
            
            Button {
                orderViewModel.add(appetizer)
                
                withAnimation(.easeInOut) {
                    isShowingDetail = false
                }
            } label: {
//                APButton(price: )
                Text("$\(appetizer.price, specifier: "%.2f") - Add to order")
            }
            .modifier(StandardButtonStyle())            
            .padding(.bottom)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button {
                withAnimation(.easeInOut) {
                    isShowingDetail = false
                }
            } label: {
                XDismissButton()
            }
            .padding()                        
        ,alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer1, isShowingDetail: .constant(false))
}
