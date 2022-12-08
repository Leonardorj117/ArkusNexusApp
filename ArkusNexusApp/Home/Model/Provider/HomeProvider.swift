//
//  HomeProvider.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 08/12/22.
//

import Foundation

protocol HomeProviderProtocol{
    func getPlacesData () async throws -> PlaceDataModel
}

class HomeProvider:HomeProviderProtocol{
    func getPlacesData () async throws -> PlaceDataModel{
        let requestModel = RequestModel()
        do{
            let model = try await ServiceLayer.callService(requestModel, PlaceDataModel.self)
            return model
        }catch{
            throw error
        }
    }
}
