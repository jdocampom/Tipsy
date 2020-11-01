//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Juan Diego Ocampo on 31/10/2020.
//  Copyright © 2020 Juan Diego Ocampo. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
// MARK: IB-Outlets
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
// MARK: Variables 
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
// MARK: Methods
    
    /// Tag: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
// MARK: IB-Actions
    
    /// Tag: recalculatePressed()
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
