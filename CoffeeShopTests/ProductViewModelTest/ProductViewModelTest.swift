//
//  ProductViewModelTest.swift
//  CoffeeShopTests
//
//  Created by aung zay on 01/05/2022.
//

import XCTest
@testable import CoffeeShop
class ProductViewModelTest: XCTestCase {
    var productsViewModel : ProductsViewModel!
    var mockProductNetwork : MockProductNetwork!
    var dispatchQueueMock : DispatchQueueMock!
   
    override func setUp(){
        mockProductNetwork = MockProductNetwork()
        dispatchQueueMock = DispatchQueueMock()
        productsViewModel = .init(productNetworkProtocol: mockProductNetwork,mainDispatchQueue: dispatchQueueMock)
    }
    
   func testConstant(){
        XCTAssertEqual(productsViewModel.isLoading, false)
        XCTAssertEqual(productsViewModel.products.count, 0)
    }
    
   func testGetProductSuccess(){
        productsViewModel.getProducts()
       XCTAssertEqual(productsViewModel.products.count, 1)
       XCTAssertEqual(productsViewModel.products[0].name, "Test")
       XCTAssertEqual(productsViewModel.products[0].price, 30)
       XCTAssertEqual(productsViewModel.products[0].imageUrl,"testURL")
    }
    
    func testGetProductFail(){
        mockProductNetwork.requestSuccess = .failure(.unableToComplete)
        productsViewModel.getProducts()
        XCTAssertEqual(productsViewModel.products.count, 0)
        XCTAssertNotNil(productsViewModel.alertItem)
    }
    
}
