//
//  CartHandler.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import Foundation

class CartHandler : ObservableObject{
    @Published private(set) var products : [Product] = []
    @Published private(set) var total : Double = 0
    @Published var showAlert : Bool = false
    
    func addToCart(product:Product){
        if(products.contains(where: {$0.self == product})){
            showAlert = true
        }else{
            products.append(product)
            total += product.price
        }
    }
    
    func removeFromCart(product:Product){
        products = products.filter{$0.self != product}
        total -= product.price
    }
    func removeAll(){
        products = []
        total = 0
    }
}
