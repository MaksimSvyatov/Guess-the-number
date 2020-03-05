//
//  StatisticViewController.swift
//  EPAM iOS School_practice_1
//
//  Created by Maxim on 29.01.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import UIKit

class StatisticViewController: UIViewController {
    
    @IBOutlet weak var gamesLabel: UITextField!
    @IBOutlet weak var textLabel: UILabel!
 
    var gamesValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamesLabel.text = gamesValue
    }
        
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
