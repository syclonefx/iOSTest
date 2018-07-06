//
//  ViewController.swift
//  iOSTest
//
//  Created by Chuck Perdue on 7/2/18.
//  Copyright © 2018 SycloneFX LLC. All rights reserved.
//

import UIKit
import GRDB

class MainVC: UIViewController {

    // Outlets
    @IBOutlet weak var versionLbl: UILabel!
    @IBOutlet var buildVersionLbl: UILabel!
    
    // Variables
    var storyboards = [Storyboard]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        versionLbl.text = APP_VERSION
        buildVersionLbl.text = BUILD_VERSION
        do {
            try dbQueue.read{ db in
                storyboards = try Storyboard.fetchAll(db)
                if(storyboards.count > 0){
                    storyboards.forEach { storyboard in
                        print("ID: \(storyboard.id!)");
                        print(storyboard.name);
                        print(storyboard.identifier);
                        print(storyboard.position);
                        print(storyboard.isActive);
                    }
                }
                print(storyboards.count)
            }
        } catch {
            print("error")
        }
        
        
        let appModel = AppModel()
        appModel.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

