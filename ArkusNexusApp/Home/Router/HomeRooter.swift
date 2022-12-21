//
//  HomeWireFrame.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 15/12/22.
//  
//

import Foundation
import UIKit

class HomeRouter:HomeRouterProtocol {

    class func createHomeModule() -> UIViewController {
        let view = mainStoryboard.instantiateViewController(withIdentifier: "homeView")
        if let viewController = view as? HomeView {
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
            let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
            let wireFrame: HomeRouterProtocol = HomeRouter()
            
            viewController.presenter = presenter
            presenter.view = viewController
            presenter.router = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return view
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeView", bundle: Bundle.main)
    }
    
}
