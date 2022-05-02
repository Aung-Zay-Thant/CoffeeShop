//
//  SummaryProductView.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import SwiftUI

struct SummaryProductView: View {
    var product : Product
    @EnvironmentObject var cartHandler : CartHandler
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(
                cornerRadius: 20
            )
            .fill(Color(Assets.lightColor))
            .frame(minWidth: 350, maxWidth: .infinity, minHeight: 120, maxHeight: 120)
            
            HStack(alignment:.center,spacing: 20){
                RemoteImageView(urlString: product.imageUrl)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    .padding()
                VStack(alignment: .leading,spacing: 15){
                    Text(product.name)
                        .bold()
                        .foregroundColor(.white)
                    
                    HStack( spacing: 20){
                        Text("$\(product.price.formatted(.number.precision(.fractionLength(2))))")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Spacer()
                        Button("Remove", action: {cartHandler.removeFromCart(product: product)})
                            .buttonStyle(.bordered)
                            .foregroundColor(.white)
                            .background(Color(Assets.darkColor))
                            .cornerRadius(20)
                            .font(.subheadline)
                    }
                }
            }
            .scaledToFit()
            
        }
    }
}

struct SummaryProductView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryProductView(product: ProductList.products[0]).environmentObject(CartHandler())
    }
}
