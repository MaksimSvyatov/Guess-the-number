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
           //print(minNumber, maxNumber)
        }
    

        delegate?.update(minNumber: minNumber, maxNumber: maxNumber)
        
        minSetNumberTextField.text = ""
        maxSetNumberTextField.text = ""
    }
    
     @IBAction func close() {
           dismiss(animated: true, completion: nil)
        }
}



//import UIKit
//
//protocol SendRandomFromNumber {
//    func userDidChooseFromNumber(data: Int)
//}
//
//class SettingsViewController: UIViewController {
//
////    var randomFromNumber = ""
////    let randomToNumber = ""
//    weak var delegate: SendRandomFromNumber
//    //weak var delegate: FirstViewControllerDelegate?
//
//    @IBOutlet weak var randomizeFromTextField: UITextField!
//    @IBOutlet weak var randomizeToTextField: UITextField!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    @IBAction func setRandomFromNumber(_ sender: AnyObject) {
////        if delegate != nil {
//            if let text = randomizeFromTextField.text, let number = Int(text) {
//                let data = number
//                delegate?.userDidChooseFromNumber(data: data)
//                //dismiss(animated: true, completion: nil)
////            }  else {
////                   let alert = UIAlertController(title: "Ошибка", message: "Строка должна содержать число!", preferredStyle: .alert)
////                   let action = UIAlertAction(title: "Ok!", style: .default, handler: nil)
////                   alert.addAction(action)
////                   present(alert, animated: true, completion: nil)
// //             }
//        }
//
//
////         if let text = randomizeFromTextField.text {
////
////          randomFromNumber = text
////            print(randomFromNumber)
////
////          } else {
////              let alert = UIAlertController(title: "Ошибка", message: "Строка должна содержать число!", preferredStyle: .alert)
////              let action = UIAlertAction(title: "Ok!", style: .default, handler: nil)
////              alert.addAction(action)
////              present(alert, animated: true, completion: nil)
////          }
////
////         //delegate?.update(text: randomFromNumber)
//     }
//
//    @IBAction func close() {
//        dismiss(animated: true, completion: nil)
//    }
//
//
//}
