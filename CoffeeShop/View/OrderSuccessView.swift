//
//  OrderSuccessView.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import SwiftUI

struct OrderSuccessView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        VStack(alignment: .center){
            Image("order_success")
                .resizable()
                .scaledToFit()
                .padding(50)
            Text("Yayy it's nice order!\nIt will arrive soon.")
                .bold()
                .font(.title3)
                .foregroundColor(Color("lightColor"))
                .multilineTextAlignment(.center)
            
            Button(action: {self.mode.wrappedValue.dismiss()}, label: {
                Text("Go Order")
                    .frame(width: 200, height: 45)
                    .background(Color("lightColor"))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding()
                
            })
            Spacer()
        }
        .background(.white)
    }
}

struct OrderSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSuccessView()
    }
}
