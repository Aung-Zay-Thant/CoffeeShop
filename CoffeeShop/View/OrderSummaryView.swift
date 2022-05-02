//
//  OrderSummaryView.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import SwiftUI

struct OrderSummaryView: View {
    @EnvironmentObject var cartHandler : CartHandler
    @EnvironmentObject var orderViewModel : OrderViewModel
    @State var showAlert : Bool = false
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.brown]
    }
    var body: some View {
        ZStack {
            ZStack (alignment: .bottom){
                ScrollView{
                    VStack(alignment: .leading){
                        ForEach(cartHandler.products,id: \.self){
                            product in
                            SummaryProductView(product: product).environmentObject(cartHandler)
                                .listRowBackground(Color.white)
                        }
                        .padding(.horizontal,15)
                    }
                    VStack {
                        HStack{
                            Text("Total")
                            Spacer()
                            Text("\(cartHandler.total.formatted(.number.precision(.fractionLength(2))))")
                        }
                        .foregroundColor(Color(Assets.lightColor))
                        .font(.title3)
                        .padding()
                        TextField("",text:$orderViewModel.address)
                            .placeholder(when: orderViewModel.address.isEmpty) {
                                Text("Delivery Address")
                                    .font(.subheadline)
                                    .foregroundColor(Color(Assets.lightColor))
                            }
                            .foregroundColor(Color(Assets.darkColor))
                            .padding()
                            .frame(height: 40)
                            .background(Color(Assets.lightColor).opacity(0.3).cornerRadius(10))
                            .padding(.horizontal,25)
                    }
                    .background(.white)
                    
                }
                .navigationTitle("Order Summary")
                .background(.white)
                Button(action: {
                    if(orderViewModel.address.isEmpty){
                        showAlert = true
                    }else{
                        orderViewModel.cartHandler = cartHandler
                        orderViewModel.makeOrder()
                    }
                }, label: {
                    Text("Order")
                        .frame(width: 300, height: 50)
                        .background(Color(Assets.mainColor))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding()
                }
                )
                .disabled(orderViewModel.isLoading)
            }
            .alert(item: $orderViewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            .ignoresSafeArea(.keyboard)
            if(orderViewModel.isLoading){
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color(Assets.darkColor)))
                    .scaleEffect(3)
                    .frame(alignment: .center)
            }
            
            
        }
        .alert(isPresented: $showAlert, content: {
            Alert(
                title: Text("You need to provide delivery address.\n😉")
                
                ,
                dismissButton: .default(Text("Ohh"))
            )
        })
    }
}

struct OrderSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSummaryView()
            .environmentObject(CartHandler())
            .environmentObject(OrderViewModel())
    }
}
