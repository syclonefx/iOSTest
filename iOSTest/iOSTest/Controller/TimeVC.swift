//
//  TimeVC.swift
//  iOSTest
//
//  Created by Chuck Perdue on 7/13/18.
//  Copyright © 2018 SycloneFX LLC. All rights reserved.
//

import UIKit


class TimeVC: UIViewController {

    // Outlets
    @IBOutlet weak var homeTimeLbl: UILabel!
    @IBOutlet weak var awayTimeLbl: UILabel!
    
    
    // Variables
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 15,
                                     target: self,
                                     selector: #selector(self.updateTimes(_:)),
                                     userInfo: nil,
                                     repeats: true)
        //updateTimes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func updateTimes(_ timer: AnyObject){
        let tc = Time()
        let now = Date()
        print(tc.epochTime(date: now))
        
        let dateFormatter : DateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.dateFormat = "M/dd/yy, h:mm:ss a"
        //dateFormatter.dateStyle = .short
        //dateFormatter.timeStyle = .short
        var dateString = dateFormatter.string(from: now)
        
        let myHome = ((NSTimeZone(name: "America/New_York")?.secondsFromGMT)! / 3600)
        let away = ((NSTimeZone(name: "Asia/Manila")?.secondsFromGMT)! / 3600)
        let gmt = now.add(hours: -myHome)
        //let interval = date.timeIntervalSince1970
        homeTimeLbl.text = dateString
        dateString = dateFormatter.string(from: gmt.add(hours: away))
        awayTimeLbl.text = dateString
    }

}

