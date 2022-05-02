//
//  ProductNetwork.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import Foundation

class ProductNetwork: NSObject ,ProductNetworkProtocol{
    static let baseURL          = "https://c8d92d0a-6233-4ef7-a229-5a91deb91ea1.mock.pstmn.io/"
    private let productURL    = baseURL + "products"
    
    
    
    func decodeJson(data : Data)throws ->[Product]{
        let decoder = JSONDecoder()
        let decodedResponse = try? decoder.decode([Product].self, from: data)
        return decodedResponse!
    }
    
    func getProducts(completed: @escaping (Result<[Product], NetworkError>) -> Void) {
        guard let url = URL(string: productURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decodedData = try self.decodeJson(data: data)
                completed(.success(decodedData))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
