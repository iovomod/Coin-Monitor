//
//  ViewController.swift
//  Coin Monitor
//
//  Created by iovomod on 05/07/2017.
//  Copyright © 2017 Semerikov Sergey. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let userServices = UserServices()
    var coins: [String] = ["BTC", "ETH", "DASH", "ZEC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        showUsers()
//        print("New Data")
//        userServices.downloadUsers {[weak self] in
//            self?.showUsers()
//        }
    }
    
    func showUsers() {
        let companyes = userServices.getCompanyes()
        
        for company in companyes {
            for user in company.arrayUser {
                print("Company: \(company.name), UserName: \(user.surename)")
            }
        }
    }
    
    //MARK: - UITableView
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = coins[indexPath.row]
        return cell
    }
}

 
