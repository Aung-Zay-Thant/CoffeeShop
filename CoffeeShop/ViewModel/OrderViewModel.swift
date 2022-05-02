//
//  OrderViewModel.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import Foundation

final class OrderViewModel : ObservableObject{
    
    @Published var isSuccess: Bool = false
    @Published var isLoading : Bool = false
    @Published var alertItem: AlertItem?
    @Published var address : String = ""
    @Published var cartHandler : CartHandler?
    private let orderNetworkProtocol : OrderNetworkProtocol
    private let mainDispatchQueue: DispatchQueueType
    
    
    init(orderNetworkProtocol : OrderNetworkProtocol = OrderNetwork(),mainDispatchQueue: DispatchQueueType = DispatchQueue.main){
        self.orderNetworkProtocol = orderNetworkProtocol
        self.mainDispatchQueue = mainDispatchQueue
    }
    
    func makeOrder() {
        isLoading = true
        orderNetworkProtocol.makeOrder(address: address,cartHandler: cartHandler ?? CartHandler()){ [self] result in
            mainDispatchQueue.async {
                self.isLoading = false
                switch result {
                case .success():
                    self.isSuccess = true
                    self.cartHandler?.removeAll()
                    
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
