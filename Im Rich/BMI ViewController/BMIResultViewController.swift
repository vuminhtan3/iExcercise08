//
//  BMIResultViewController.swift
//  Im Rich
//
//  Created by Minh Tan Vu on 11/05/2023.
//

import UIKit

class BMIResultViewController: UIViewController {
    
    var result: String!
    var bmiValue: String!
    var advice: String!
    var color: UIColor!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var bmiIndex: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    
    override func viewDidLoad() {
        resultLabel.text = result
        bmiIndex.text = bmiValue
        adviceLabel.text = advice
        resultLabel.textColor = color
        bmiIndex.textColor = color
        resultView.layer.cornerRadius = 10
        resultView.clipsToBounds = true
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
