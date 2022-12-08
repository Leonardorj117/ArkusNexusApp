//
//  ViewController.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 08/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var presenter = HomePresenter(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task{
           self.presenter.getPlaces
        }
    }


}

//MARK: - HomeViewProtocol

extension HomeViewController:HomeViewProtocol{
    func getListPlaces(list: [Any]) {
        print("list: > ",list)
    }
    
    
}
