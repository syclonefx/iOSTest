//
//  CustomCell.swift
//  iOSTest
//
//  Created by Chuck Perdue on 7/10/18.
//  Copyright © 2018 SycloneFX LLC. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var dataLabel: UILabel!
    
    func configureCell(title: String) {
        self.dataLabel.text = title
    }
}
