//
//  ViewController.swift
//  iOSTest
//
//  Created by Chuck Perdue on 7/2/18.
//  Copyright © 2018 SycloneFX LLC. All rights reserved.
//

import UIKit


class MainVC: UIViewController {

    // Outlets
    @IBOutlet weak var versionLbl: UILabel!
    @IBOutlet var buildVersionLbl: UILabel!
    
    // Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        versionLbl.text = APP_VERSION
        buildVersionLbl.text = BUILD_VERSION
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

