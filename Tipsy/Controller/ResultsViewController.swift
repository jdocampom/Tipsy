//
//  ResultsViewController ViewController.swift
//  Tipsy
//
//  Created by Juan Diego Ocampo on 10/31/20.
//  Copyright © 2020 Diego Ocampo. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
// MARK: Variables
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
// MARK: IB-Outlets

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
// MARK: Methods
    
    /// Tag: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
// MARK: IB-Actions

    /// Tag: recalculateButtonPressed()
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
