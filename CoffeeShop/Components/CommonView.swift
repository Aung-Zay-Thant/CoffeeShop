//
//  CommonView.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import SwiftUI

struct CommonView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var image : String
    var text : String
    var body: some View {
        VStack(alignment: .center){
            Image(image)
                .resizable()
                .scaledToFit()
                .padding(50)
            Text(text)
                .bold()
                .font(.title3)
                .foregroundColor(Color(Assets.lightColor))
                .multilineTextAlignment(.center)
            
            Button(action: {self.mode.wrappedValue.dismiss()}, label: {
                Text("Continue Ordering")
                    .frame(width: 200, height: 45)
                    .background(Color(Assets.lightColor))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding()
                
            })
            Spacer()
        }
        .background(.white)
    }
}

struct EmptyCartView_Previews: PreviewProvider {
    static var previews: some View {
        CommonView(image:Assets.emptyCart,text:"There is no items in cart!")
    }
}
