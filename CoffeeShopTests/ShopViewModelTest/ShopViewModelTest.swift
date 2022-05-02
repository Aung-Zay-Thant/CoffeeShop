//
//  ShopViewModelTest.swift
//  CoffeeShopTests
//
//  Created by aung zay on 01/05/2022.
//

import XCTest
@testable import CoffeeShop
class ShopViewModelTest: XCTestCase {
    var shopViewModel : ShopViewModel!
    var mockShopNetwork : MockShopNetwork!
    var dispatchQueueMock : DispatchQueueMock!
   
    override func setUp()  {
        mockShopNetwork = MockShopNetwork()
        dispatchQueueMock = DispatchQueueMock()
        shopViewModel = .init(shopNetworkProtocol: mockShopNetwork,mainDispatchQueue: dispatchQueueMock)
    }

   func testConstant(){
        XCTAssertEqual(false, shopViewModel.isLoading)
        XCTAssertNil(shopViewModel.alertItem)
    }
    
    func testShopInfoSuccess(){
        shopViewModel.getShopInfo()
        XCTAssertEqual(shopViewModel.shop.name, "Shop Name")
        XCTAssertEqual(shopViewModel.shop.rating, 9)
        XCTAssertEqual(shopViewModel.shop.openingTime, "15:01:01.772Z")
        XCTAssertEqual(shopViewModel.shop.closingTime, "19:45:51.365Z")
    }
    
    func testShopInfoFail(){
        mockShopNetwork.requestSuccess = .failure(NetworkError.invalidData)
        shopViewModel.getShopInfo()
        XCTAssertNotNil(shopViewModel.alertItem)
    }
}
