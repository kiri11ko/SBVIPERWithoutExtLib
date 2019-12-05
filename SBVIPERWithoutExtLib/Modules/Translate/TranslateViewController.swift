//
//  TranslateViewController.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import UIKit

class TranslateViewController: UIViewController, TranslateViewProtocol {

	var presenter: TranslatePresenterProtocol?

    @IBOutlet weak var sourceText: UITextView! {
        didSet {
            sourceText.becomeFirstResponder()
        }
    }
    @IBOutlet weak var translationText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func chooseToLanguage(_ sender: Any) {

        presenter?.changeLanguageModule()

    }
    @IBAction func chooseFromLanguage(_ sender: Any) {
        print(#function)
        presenter?.trasnalteWrod(word: "word")
    }
}
