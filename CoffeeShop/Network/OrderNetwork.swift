//
//  OrderNetwork.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import Foundation

class OrderNetwork: NSObject , OrderNetworkProtocol{
    static let baseURL          = "https://c8d92d0a-6233-4ef7-a229-5a91deb91ea1.mock.pstmn.io/"
    private let orderURL    = baseURL + "order"
    
    
    func encodeJson(products:[Product])-> String{
        let products = try? JSONEncoder().encode(products)
        return String(data: products!, encoding: .utf8)!
    }
    
    func makeOrder(address : String , cartHandler : CartHandler, completed: @escaping (Result<Void, NetworkError>) -> Void) {
        guard let url = URL(string: orderURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body : [String:Any] = [
            "products" : encodeJson(products: cartHandler.products),
            "delivery_address" : address
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse,
                    response.statusCode == 201 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard data != nil else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                completed(.success(()))
            }
        }
        task.resume()
    }
}
