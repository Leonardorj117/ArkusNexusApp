//
//  HomeRemoteDataManager.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 15/12/22.
//  
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {

    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    var placesCollection = [PlaceDataModel]()
    
    func callService(requestModel:RequestModel) {
        //Llamar al servico y obtenr datos.
        let serviceURL = requestModel.getURL()
        
        guard let url = URL(string: serviceURL)else{
            print("error: Invalid URL.")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = requestModel.httpMethod.rawValue
        
        let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil{
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("error: Invalid response")
                return
            }
            
            if httpResponse.statusCode > 299{
                print("error: httpResponse (\(httpResponse)")
            }
            if httpResponse.statusCode == 200{
                guard let safeData = data else {return}
                do{
                    let decodeData = try JSONDecoder().decode([PlaceDataModel].self, from: safeData)
                    self.placesCollection = decodeData
                    self.remoteRequestHandler?.externalDataCallBack(places: self.placesCollection)
                }catch{
                    
                }
                
            }
        }
        session.resume()
        
        
    }
}
