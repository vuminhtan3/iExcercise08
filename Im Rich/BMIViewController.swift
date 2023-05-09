//
//  BMIViewController.swift
//  Im Rich
//
//  Created by Minh Tan Vu on 09/05/2023.
//

import UIKit

class BMIViewController: UIViewController {
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightStepper: UIStepper!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageStepper: UIStepper!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var ageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        maleButton.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.27, alpha: 1.00)
        femaleButton.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.27, alpha: 1.00)
        maleButton.layer.cornerRadius = 10
        femaleButton.layer.cornerRadius = 10
        heightView.layer.cornerRadius = 10
        weightView.layer.cornerRadius = 10
        ageView.layer.cornerRadius = 10
        
        weightStepper.value = 50
        ageStepper.value = 20
        heightLabel.text = "\(Int(heightSlider.value)) cm"
        weightLabel.text = "\(Int(weightStepper.value)) kg"
        ageLabel.text = "\(Int(ageStepper.value))"
        
    }
    
    @IBAction func maleButtonPressed(_ sender: UIButton) {
        maleButton.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.23, alpha: 1.00)
        femaleButton.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.27, alpha: 1.00)
    }
    
    @IBAction func femaleButtonPressed(_ sender: UIButton) {
        femaleButton.backgroundColor = UIColor(red: 0.15, green: 0.15, blue: 0.23, alpha: 1.00)
        maleButton.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.27, alpha: 1.00)
    }
    
    @IBAction func heightOnChange(_ sender: UISlider) {
        heightLabel.text = "\(Int(heightSlider.value)) cm"
    }
    
    @IBAction func weightOnChange(_ sender: UIStepper) {
        weightLabel.text = "\(Int(weightStepper.value)) kg"
    }
    
    @IBAction func ageOnChange(_ sender: UIStepper) {
        ageLabel.text = "\(Int(ageStepper.value))"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
    }
    
}
