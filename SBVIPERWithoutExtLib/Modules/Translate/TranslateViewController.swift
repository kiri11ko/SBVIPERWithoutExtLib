//
//  TranslateViewController.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import UIKit

class TranslateViewController: UIViewController {
    var presenter: TranslatePresenterProtocol?
    @IBOutlet weak var sourceText: UITextView! {
        didSet {
            sourceText.becomeFirstResponder()
        }
    }
    @IBOutlet weak var translationText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func chooseToLanguage(_ sender: Any) {
        presenter?.changeLanguageModule()
    }
    @IBAction func chooseFromLanguage(_ sender: Any) {
        presenter?.changeLanguageModule()
    }
    @IBAction func translateAction(_ sender: Any) {
        if sourceText.text.count > 3 {
            presenter?.trasnalteWrod(word: sourceText.text)
        } else {
            presenter?.showAlertTextCountError()
        }
    }

}
extension TranslateViewController: TranslateViewProtocol {
    func showAlert(alert: Any) {
        guard let alert = alert as? UIAlertController else {
            return
        }
        present(alert, animated: true)
    }
    func translateresult(wordTranslate: String) {
        translationText.text = wordTranslate
    }
}
