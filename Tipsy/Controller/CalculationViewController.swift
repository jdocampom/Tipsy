//
//  CalculationViewController.swift
//  Tipsy
//
//  Created by Juan Diego Ocampo on 31/10/2029.
//  Copyright © 2020 Juan Diego Ocampo. All rights reserved.
//

import UIKit

class CalculationViewController: UIViewController {
    
// Variables
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
// MARK: IB-Outlets
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
// MARK: Methods
    
    /// viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /// prepareForSegue()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /// If the currently triggered segue is the "goToResults" segue.
        if segue.identifier == "goToResults" {
        /// Get hold of the instance of the destination VC and type cast it to a ResultViewController.
            let destinationVC = segue.destination as! ResultsViewController
        /// Set the destination ResultsViewController's properties.
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
    
// MARK: IB-Actions
    
    /// tipChanged()
    @IBAction func tipChanged(_ sender: UIButton) {
        /// Dismiss the keyboard when the user chooses one of the tip values.
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    /// stepperValueChanged()
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    /// calculateButtonPressed()
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
}
