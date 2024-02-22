//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Jeann Luiz on 22/02/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: AppetizerModel
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        
        VStack {
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    VStack {
                        Text("Calories")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.calories)")
                            .foregroundStyle(.secondary)                            
                    }
                    
                    VStack {
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        
                        Text("\(appetizer.carbs)")
                            .foregroundStyle(.secondary)
                    }
                    
                    VStack {
                        Text("Protein")
                            .bold()
                            .font(.caption)
//                            .italic() //iOS 16 or newer
                        
                        Text("\(appetizer.protein)")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(.top)
            
            Spacer()
            
            Button {
                print("Buy item")
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to order")
                    .font(.title2)
                    .frame(width: 260, height: 50)
//                    .fontWeight(.semibold) //iOS 16 or newer
                    .foregroundStyle(.white)
                    .background(Color.brandPrimary)
                    .cornerRadius(10)
            }
            .padding(.bottom)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay( 
            Button {
                isShowingDetail = false
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .opacity(0.8)
                    
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                }
            }
            .padding()
        ,alignment: .topTrailing)
        
        
        
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(false))
}
