//
//  HomePresenter.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 08/12/22.
//

import Foundation


protocol HomeViewProtocol:AnyObject{
    func getListPlaces(list:[Any])
}

class HomePresenter{
    var provider:HomeProviderProtocol
    weak var delegate:HomeViewProtocol?
    private var listPLaces:[Any] = []
    
    init(provider: HomeProviderProtocol = HomeProvider(), delegate: HomeViewProtocol) {
        self.provider = provider
        self.delegate = delegate
    }
    
    func getPlaces() async{
        self.listPLaces.removeAll()
        do{
            let places = try await provider.getPlacesData()
            self.listPLaces.append(places)
        }catch{
            print(error)
        }
    }
}
