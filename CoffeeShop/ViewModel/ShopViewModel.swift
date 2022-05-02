//
//  ShopViewModel.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import Foundation

final class ShopViewModel : ObservableObject{
    
    let openingText = "Opening time  - "
    let closingText = "Closing time  - "
    
    @Published var shop: Shop = Shop(name: "", rating: 0,openingTime: "", closingTime: "")
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    private let shopNetworkProtocol : ShopNetworkProtocol
    private let mainDispatchQueue: DispatchQueueType
    
    init(shopNetworkProtocol : ShopNetworkProtocol = ShopNetwork(),mainDispatchQueue: DispatchQueueType = DispatchQueue.main){
        self.shopNetworkProtocol = shopNetworkProtocol
        self.mainDispatchQueue = mainDispatchQueue
    }
    
    func getShopInfo() {
        isLoading = true
        shopNetworkProtocol.getShopInfo { [self] result in
            mainDispatchQueue.async {
                self.isLoading = false
                
                switch result {
                case .success(let shop):
                    self.shop = shop
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
