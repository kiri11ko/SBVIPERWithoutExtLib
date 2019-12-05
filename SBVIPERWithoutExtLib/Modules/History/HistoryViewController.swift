//
//  HistoryViewController.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import UIKit

class HistoryViewController: UIViewController, HistoryViewProtocol {

	var presenter: HistoryPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getHistoryData()
    }
    func refreshHistoryData() {
        
    }

}
