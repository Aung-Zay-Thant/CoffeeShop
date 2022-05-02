//
//  CartButtonView.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import SwiftUI

struct CartButtonView: View {
    @EnvironmentObject var cartHandler : CartHandler
    var cartCount : Int
    var body: some View {
        HStack{
            Text("Today Menu")
                .tracking(2)
                .bold()
                .padding(.horizontal,30)
                .font(.title2)
                .foregroundColor(.white)
            Spacer()
            NavigationLink(
                destination: ToggleSummaryOrSuccessView().environmentObject(cartHandler))
                 {
                Image(systemName: "cart.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .padding(.horizontal,30)
                    .overlay{
                        if(cartCount > 0){
                            Text("\(cartCount)")
                                .foregroundColor(.white)
                                .padding(5)
                                .font(.system(size: 16))
                                .background(.red)
                                .clipShape(Circle())
                                .offset(x: 10, y: -15)  
                        }
                    }
            }
            
        }
    }
}

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView(cartCount: 0).environmentObject(CartHandler())
    }
}
