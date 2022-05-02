//
//  ContentView.swift
//  CoffeeShop
//
//  Created by aung zay on 29/04/2022.
//

import SwiftUI

struct ContentView: View {
    init(){
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor.brown
    }
    private let column = [GridItem(.flexible(minimum: 170)),
                          GridItem(.flexible(minimum: 170))
    ]

    @StateObject private var productsViewModel = ProductsViewModel()
    @StateObject private var shopViewModel = ShopViewModel()
    
    @StateObject var cartHandler = CartHandler()
    var body: some View {
        NavigationView{
            VStack{
                ShopInfoView().environmentObject(shopViewModel)
                VStack(alignment: .leading){
                    CartButtonView(cartCount: cartHandler.products.count).environmentObject(cartHandler)
                    if(productsViewModel.isLoading){
                        ScrollView{
                            LazyVGrid(columns: column) {
                                ForEach(0...5,id: \.self){
                                    product in
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color(Assets.lightColor))
                                        .frame(height:250)
                                        .redacted(reason: .placeholder)
                                }
                                .padding()
                            }
                            
                        }
                        
                    }else{
                        ScrollView{
                            LazyVGrid(columns: column) {
                                ForEach(productsViewModel.products,id: \.self){
                                    product in
                                    ProductView(product: product).environmentObject(cartHandler)
                                }
                                .padding()
                            }
                            
                        }
                        
                    }
                }
                .alert(item: $productsViewModel.alertItem) { alertItem in
                    Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
                }
                .padding()
                .frame(
                    minWidth : 0,
                    maxWidth : .infinity,
                    minHeight : 0,
                    maxHeight: .infinity
                )
                .padding(.vertical,30)
                .background(Color(Assets.mainColor))
                .cornorRadius(50, corners: [.topLeft,.topRight])
                .edgesIgnoringSafeArea(.all)
            }
            .navigationBarHidden(true)
            .background(.white)
            .alert(isPresented: $cartHandler.showAlert, content: {
                Alert(
                    title: Text("You already added this one in your cart.\n😉")
                    
                    ,
                    dismissButton: .default(Text("Ohh"))
                )
            })
        }
        .onAppear{
            productsViewModel.getProducts()
            shopViewModel.getShopInfo()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
