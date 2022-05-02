//
//  MockDispatchQueue.swift
//  CoffeeShopTests
//
//  Created by aung zay on 01/05/2022.
//
@testable import CoffeeShop
import Foundation
final class DispatchQueueMock: DispatchQueueType {
    func async(execute work: @escaping @convention(block) () -> Void) {
        work()
    }
}
