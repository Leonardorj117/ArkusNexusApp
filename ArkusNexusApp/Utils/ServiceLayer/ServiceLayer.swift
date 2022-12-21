//
//  ServiceLayer.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 08/12/22.
//

import Foundation

@MainActor
class ServiceLayer{
    static func callService<T:Decodable>(_ requestModel: RequestModel,_ modelType: T.Type) async throws -> T{
        let serviceUrl = requestModel.getURL()
        
        guard let url = URL(string: serviceUrl) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = requestModel.httpMethod.rawValue
        
        do{
            let (data,response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else{
                throw NetworkError.httpResponseError
            }
            if httpResponse.statusCode > 299{
                throw NetworkError.statusCodeError
            }
            
            let decoder = JSONDecoder()
            do{
                let decodeData = try decoder.decode(T.self, from: data)
                return decodeData
            }catch{
                throw NetworkError.couldNotDecodeData
            }
            
        }catch{
            throw NetworkError.generic
        }
    }
}
