//
//  OrderViewModelTest.swift
//  CoffeeShopTests
//
//  Created by aung zay on 01/05/2022.
//

import XCTest
@testable import CoffeeShop

class OrderViewModelTest: XCTestCase {
    
    var orderViewModel : OrderViewModel!
    var mockOrderNetwork : MockOrderNetwork!
    var dispatchQueueMock : DispatchQueueMock!
    var cartHandler : CartHandler!

    override func setUp(){
        mockOrderNetwork = MockOrderNetwork()
        dispatchQueueMock = DispatchQueueMock()
        orderViewModel = .init(orderNetworkProtocol: mockOrderNetwork,mainDispatchQueue: dispatchQueueMock)
    }
    
    func testConstant(){
        XCTAssertEqual(orderViewModel.isLoading, false)
        XCTAssertEqual(orderViewModel.isSuccess, false)
        XCTAssertEqual(orderViewModel.address, "")
        XCTAssertNil(orderViewModel.alertItem)
        
    }

    func testMakeOrderSuccess(){
        mockOrderNetwork.orderSuccess = .success(())
        orderViewModel.makeOrder()
        XCTAssertFalse(orderViewModel.isLoading)
        XCTAssertTrue(orderViewModel.isSuccess)
    }
    
    func testMakeOrderFail(){
        mockOrderNetwork.orderSuccess = .failure(NetworkError.invalidData)
        orderViewModel.makeOrder()
        XCTAssertFalse(orderViewModel.isLoading)
        XCTAssertFalse(orderViewModel.isSuccess)
        XCTAssertNotNil(orderViewModel.alertItem)
    }
}
