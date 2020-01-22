//
//  ViewController.swift
//  EPAM iOS School_practice_1
//
//  Created by Maxim on 22.01.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UITextField!
    override func viewDidLoad() {
    super.viewDidLoad()
        
    }
    
    let targetRandomValue = Int.random(in: 1...100)
    var currentValue = 0
    
    @IBAction func getCurrentValue() {
        currentValue = Int(label.text!)!
        showCheckLabelAlert()
        print(currentValue)
    }
    
func showCheckLabelAlert() {
        let difference = abs(currentValue - targetRandomValue)
        
        if difference == 0 {
            title = "Perfect!"
        } else if currentValue > targetRandomValue {
            title = "Много!"
        } else if currentValue < targetRandomValue {
            title = "Мало!"
        }
        
        
        let alert = UIAlertController(title: title, message: "Я попробую ещё раз!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok!", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

}
