//
//  ShopInfoView.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import SwiftUI

struct ShopInfoView: View {
    @EnvironmentObject var shopViewModel : ShopViewModel
    func getTime(time:String) -> String{
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss.SSSZ"
        let formattedTime = timeFormatter.date(from: time) ?? Date.now
        timeFormatter.dateFormat = "hh:mm a"
        return timeFormatter.string(from:formattedTime)
    }
    var body: some View {
        ZStack {
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(shopViewModel.shop.name)
                        .tracking(2)
                        .bold()
                        .font(.title2)
                        .foregroundColor(Color(Assets.mainColor))
                    
                    RatingCupsView(rating: shopViewModel.shop.rating)
                    HStack{
                        Spacer()
                        Text(shopViewModel.openingText)
                            .font(.subheadline)
                            .foregroundColor(Color(Assets.mainColor))
                            .foregroundColor(.secondary)
                        Text(getTime(time: shopViewModel.shop.openingTime))
                            .font(.subheadline)
                    }
                    HStack{
                        Spacer()
                        Text(shopViewModel.closingText)
                            .font(.subheadline)
                            .foregroundColor(Color(Assets.mainColor))
                            .foregroundColor(.secondary)
                        Text(getTime(time: shopViewModel.shop.closingTime))
                            .font(.subheadline)
                    }
                }
                
                .foregroundColor(Color(Assets.mainColor))
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .topLeading
                )
                .padding()
            }
            }
            .alert(item: $shopViewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        .redacted(reason: shopViewModel.isLoading ? .placeholder : [])
        
    }
}

struct ShopInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ShopInfoView().environmentObject(ShopViewModel())
    }
}
