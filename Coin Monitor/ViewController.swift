//
//  ViewController.swift
//  Coin Monitor
//
//  Created by iovomod on 05/07/2017.
//  Copyright © 2017 Semerikov Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let userServices = UserServices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showUsers()
        print("New Data")
        userServices.downloadUsers {[weak self] in
            self?.showUsers()
        }

        
    }
    
    
    func showUsers() {
        let companyes = userServices.getCompanyes()
        
        for company in companyes {
            for user in company.arrayUser {
                print("Company: \(company.name), UserName: \(user.surename)")
            }
        }
    }
}

 
