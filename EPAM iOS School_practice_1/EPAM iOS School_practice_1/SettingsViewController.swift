//
//  SettingsViewController.swift
//  EPAM iOS School_practice_1
//
//  Created by Maxim on 30.01.2020.
//  Copyright © 2020 Maksim Svyatov. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    var minNumber = 1
    var maxNumber = 100
    
    weak var delegate: ViewControllerDelegate?
    
    @IBOutlet weak var minSetNumberTextField: UITextField!
    @IBOutlet weak var maxSetNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveNumberChange(_ sender: Any) {
        
        if let userMinText = minSetNumberTextField.text, let userMinNumber = Int(userMinText), let userMaxText = maxSetNumberTextField.text, let userMaxNumber = Int(userMaxText) {
            minNumber = userMinNumber
            maxNumber = userMaxNumber
            delegate?.update(minNumber: minNumber, maxNumber: maxNumber)
        }
        
        minSetNumberTextField.text = ""
        maxSetNumberTextField.text = ""
        
    }
    
     @IBAction func close() {
           dismiss(animated: true, completion: nil)
        }
}
