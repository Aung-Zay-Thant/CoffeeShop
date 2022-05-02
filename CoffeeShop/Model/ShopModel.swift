//
//  ShopModel.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import Foundation

struct Shop : Decodable{
    let name : String
    let rating : Double
    let openingTime : String
    let closingTime : String
}

