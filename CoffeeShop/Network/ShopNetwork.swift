//
//  ShopNetwork.swift
//  CoffeeShop
//
//  Created by aung zay on 30/04/2022.
//

import Foundation

class ShopNetwork: NSObject , ShopNetworkProtocol{
    static let baseURL          = "https://c8d92d0a-6233-4ef7-a229-5a91deb91ea1.mock.pstmn.io/"
    private let shopURL    = baseURL + "storeInfo"
    

    func decodeJson(data : Data)throws ->Shop{
        let decoder = JSONDecoder()
        let decodedResponse = try? decoder.decode(Shop.self, from: data)
        return decodedResponse!
    }
    
    func getShopInfo(completed: @escaping (Result<Shop, NetworkError>) -> Void) {
        guard let url = URL(string: shopURL) else {
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
                let decodedResponse = try self.decodeJson(data: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
