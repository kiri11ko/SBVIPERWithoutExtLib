//
//  AlertService.swift
//  CleanSwiftFamilyDoctor
//
//  Created by Кирилл Лукьянов on 09.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import UIKit

enum AlertsTitle: String {
    case error = "Error"
    case warning = "Warning"
    case success = "Success"
}

class AlertsService {

    func showAlert(title: AlertsTitle, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title.rawValue, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        return alert
    }

}

extension UIAlertController {

    func show() {
        guard let topViewController = UIApplication.topViewController() else { return }
        present(topViewController, animated: true, completion: nil)
    }

}
