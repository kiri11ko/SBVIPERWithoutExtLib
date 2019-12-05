//
//  SourceLanguageTableViewCell.swift
//  VIPERSBCoreData
//
//  Created by Кирилл Лукьянов on 18.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import UIKit

class SourceLanguageTableViewCell: UITableViewCell {
    var language: UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addSubview(language)
        language.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            language.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            language.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            language.topAnchor.constraint(equalTo: self.topAnchor),
            language.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
