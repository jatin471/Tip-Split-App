//
//  ViewController.swift
//  Tipsy
//
//  Created by Jatin Yadav on 25/01/23.

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var splitValue:Int = 2
    var actualAmount:Double = 0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected=false
        tenPctButton.isSelected=false
        twentyPctButton.isSelected=false
        sender.isSelected=true
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitValue = Int(sender.value)
        splitNumberLabel.text="\(splitValue)"
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let textValue:String = billTextField.text!
        print(textValue)
        let amount:Double = Double(textValue)!
        actualAmount = amount/Double(splitValue)
        if zeroPctButton.isSelected {
            print(actualAmount)
        }
        else if tenPctButton.isSelected{
            print(actualAmount)
        }
        else if twentyPctButton.isSelected{
            print(actualAmount)
        }
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = String(format: "%.2f",actualAmount)
            
            if zeroPctButton.isSelected{
                destinationVC.tip = 0
            }
            else if tenPctButton.isSelected{
                destinationVC.tip = 10
            }
            else if twentyPctButton.isSelected{
                destinationVC.tip = 20
            }
            destinationVC.split = splitValue
            
            
        }
    }
}

