//
//  HomePresenter.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 15/12/22.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        //COMUNICAR AL INTERACTOR QUE SE NECESITAN TRAER DATOS.
        self.interactor?.interactorGetData()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
