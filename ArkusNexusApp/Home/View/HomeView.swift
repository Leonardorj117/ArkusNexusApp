//
//  ViewController.swift
//  ArkusNexusApp
//
//  Created by Leonardo Rubio on 08/12/22.
//

import UIKit
import Foundation

class HomeView: UIViewController {
    
    //MARK: - Outlets
    
    //TableView
    @IBOutlet weak var tableView:UITableView!
    //Activiti Indicator
    @IBOutlet weak var spinner:UIActivityIndicatorView!
    
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: K.nibCellController, bundle: nil), forCellReuseIdentifier: K.nibCell)
        self.presenter?.viewDidLoad()
    }


}

//MARK: -  UITableViewDataSource

extension HomeView:UITableViewDataSource{
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: K.nibCell) as? PlaceCell else{
            return UITableViewCell()
        }
        return cell
    }
}


//MARK: - UITableViewDelegate
extension HomeView:UITableViewDelegate{
    
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}



