//
//  APICaller.swift
//  News App
//
//  Created by Fazli Altun on 4.03.2024.
//

import Foundation

class APICaller {
    func fetchData(completion: @escaping((Result<([Article]?), Error>) -> ())) {
        let url = URL(string: ServiceConstants.serviceEndpoint())
        print(url)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                print("error")
                completion(.failure(error))
            }
            
            if let data = data {
                print("data")
                let result = try? JSONDecoder().decode(News.self, from: data)
                
                if let result = result {
                    print("complete success")
                    completion(.success(result.articles))
                }
            }
        }.resume()
    }
}
