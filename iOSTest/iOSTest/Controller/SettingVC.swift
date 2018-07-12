//
//  SettingVC.swift
//  iOSTest
//
//  Created by Chuck Perdue on 7/11/18.
//  Copyright © 2018 SycloneFX LLC. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    // Outlets
    @IBOutlet weak var versionLbl: UILabel!
    @IBOutlet weak var buildLbl: UILabel!
    
    // Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        versionLbl.text = APP_VERSION
        buildLbl.text = BUILD_VERSION
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
