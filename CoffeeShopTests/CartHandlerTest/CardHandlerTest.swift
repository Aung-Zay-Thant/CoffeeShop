//
//  CardHandlerTest.swift
//  CoffeeShopTests
//
//  Created by aung zay on 01/05/2022.
//

import XCTest
@testable import CoffeeShop
class CartHandlerTest: XCTestCase {
    
    private var sut :  CartHandler!
    let product = Product(name: "Test", price: 100, imageUrl: "Testing")
    
    override func setUp(){
        sut = CartHandler()
    }
    
    //Checking constants
    func testConstants(){
        XCTAssertEqual(sut.products.count, 0)
        XCTAssertEqual(sut.total, 0)
        XCTAssertEqual(sut.showAlert, false)
    }
    
    //Test addToCart function
    func testAddToCart(){
        sut.addToCart(product: product)
        XCTAssertEqual(sut.products.count, 1)
        XCTAssertEqual(sut.total, 100)
        sut.addToCart(product: product)
        XCTAssertEqual(sut.showAlert, true)
    }
    
    
    //Test removeFromCart function
    func testRemoveFromCart(){
        sut.removeFromCart(product: product)
        XCTAssertEqual(sut.products.count, 0)
    }
    
    //Test removeAll Function
    func testRemoveAll(){
        sut.addToCart(product: product)
        sut.removeAll()
        XCTAssertEqual(sut.products.count, 0)
        XCTAssertEqual(sut.total, 0)
    }
    
}
