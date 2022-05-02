//
//  DispathQueueExtention.swift
//  CoffeeShop
//
//  Created by aung zay on 01/05/2022.
//

import Foundation

extension DispatchQueue: DispatchQueueType {
    func async(execute work: @escaping @convention(block) () -> Void) {
        async(group: nil, qos: .unspecified, flags: [], execute: work)
    }
}
