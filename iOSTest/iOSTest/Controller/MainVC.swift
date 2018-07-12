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
    @IBOutlet weak var tableView: UITableView!
    
    var itemsInSections: Array<Array<String>> = [["Arm", "Chest", "Back", "Core"], ["Legs", "Gluts"], ["Running", "Walking", "Bike", "Jump Rope"]]
    var sections: Array<String> = ["Upper Body", "Lower Body", "Cardio"]
    
    // Variables
    var storyboards = [Storyboard]()
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.append("Zero")
        data.append("One")
        data.append("Two")
        data.append("Three")
        data.append("Four")
        data.append("Five")
        data.append("Six")
        data.append("Seven")
        data.append("Eight")
        data.append("Nine")
        
        
        
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
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    // numberOfSections return the total number if sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsInSections[section].count //data.count
    }
    
    //https://bruno.ph/blog/articles/swift-tutorial-mytodo/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else { return UITableViewCell() }
        //let title = data[indexPath.row]
        let title = self.itemsInSections[indexPath.section][indexPath.row]
        cell.configureCell(title: title)
        
        //cell.accessoryType = UITableViewCellAccessoryType.detailButton
        return cell
    }
}









