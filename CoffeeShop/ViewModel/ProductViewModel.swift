//
//  ProductViewModel.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import Foundation

final class ProductsViewModel : ObservableObject{
    
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    private let productNetworkProtocol : ProductNetworkProtocol
    private let mainDispatchQueue: DispatchQueueType
    
    
    init(productNetworkProtocol : ProductNetworkProtocol = ProductNetwork(),mainDispatchQueue: DispatchQueueType = DispatchQueue.main){
        self.productNetworkProtocol = productNetworkProtocol
        self.mainDispatchQueue = mainDispatchQueue
    }
    
    func getProducts() {
        isLoading = true
        productNetworkProtocol.getProducts{ [self] result in
            mainDispatchQueue.async {
                self.isLoading = false
                switch result {
                case .success(let product):
                    self.products = product
                    
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
