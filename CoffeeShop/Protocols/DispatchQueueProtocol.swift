//
//  DispatchQueueProtocol.swift
//  CoffeeShop
//
//  Created by aung zay on 01/05/2022.
//

import Foundation

protocol DispatchQueueType {
    func async(execute work: @escaping @convention(block) () -> Void)
}
