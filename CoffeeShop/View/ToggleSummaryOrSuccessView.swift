//
//  ToggleSummaryOrSuccessView.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import SwiftUI

struct ToggleSummaryOrSuccessView: View {
    
    @EnvironmentObject var cartHandler : CartHandler
    @StateObject private var orderViewModel = OrderViewModel()
    var body: some View {
        if(orderViewModel.isSuccess){
            CommonView(image: Assets.orderSuccess, text: "Yayy it's nice order!\nIt will arrive soon.")
        }else{
            if(cartHandler.products.count < 1){
                CommonView(image: Assets.emptyCart, text: "There is no items in cart!")
            }else{
                OrderSummaryView()
                    .environmentObject(cartHandler)
                    .environmentObject(orderViewModel)
            }
        }
    }
}

struct ToggleSummaryOrSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleSummaryOrSuccessView().environmentObject(CartHandler())
    }
}
