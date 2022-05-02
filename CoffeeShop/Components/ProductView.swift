//
//  ProductView.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var cartHandler : CartHandler
    var product : Product
    var body: some View {
        ZStack (alignment: .center){
            RoundedRectangle(
                cornerRadius: 25
            )
            .fill(Color(Assets.lightColor))
            .frame(height:300)
            VStack(alignment: .leading,spacing: 15){
                RemoteImageView(urlString: product.imageUrl)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 150)
                    .cornerRadius(20)
                Text(product.name)
                    .tracking(2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .minimumScaleFactor(0.5)
                HStack{
                    Text("$\(product.price.formatted(.number.precision(.fractionLength(2))))")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Button("Add", action: {cartHandler.addToCart(product: product)})
                        .buttonStyle(.bordered)
                        .foregroundColor(.white)
                        .background(Color(Assets.darkColor))
                        .cornerRadius(20)
                        .font(.subheadline)
                }
                
            }
            .padding()
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: ProductList.products[0]).environmentObject(CartHandler())
    }
}
