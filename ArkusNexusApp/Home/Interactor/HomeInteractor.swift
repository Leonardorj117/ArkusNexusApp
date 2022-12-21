//
//  HomeInteractor.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 15/12/22.
//  
//

import Foundation
import CoreLocation

class HomeInteractor: HomeInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    private let request = RequestModel()
    private let locationManager = CLLocationManager()
    
    func interactorGetData() {
        //Comunicar ala capa de conexion (ExternalDataManager) que tiene que traer datos.
        self.remoteDatamanager?.callService(requestModel: self.request)
        
    }
}
//MARK: - HomeRemoteDataManagerOutputProtocol

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    
    func externalDataCallBack(places: [PlaceDataModel]) {
        //El interactor debe regresar los datos al presenter.
        print("estoy recibiendo estos datos: \(places)")
    }
    
}
