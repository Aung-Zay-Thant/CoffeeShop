//
//  ProductModel.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import Foundation

struct Product : Decodable , Hashable , Encodable{
    let name: String
    let price: Double
    let imageUrl: String
}

