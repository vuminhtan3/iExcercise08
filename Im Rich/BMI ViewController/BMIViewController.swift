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
    @IBOutlet weak var weightDown: UIButton!
    @IBOutlet weak var weightUp: UIButton!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageDown: UIButton!
    @IBOutlet weak var ageUp: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var ageView: UIView!
    var weight = 50
    var age = 20
    var timer: Timer?
    
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
        
        weightLabel.text = "\(weight) kg"
        weightUp.layer.cornerRadius = weightUp.frame.height/2
        weightUp.clipsToBounds = true
        weightDown.layer.cornerRadius = weightDown.frame.height/2
        weightDown.clipsToBounds = true
        
        ageLabel.text = "\(age)"
        ageUp.layer.cornerRadius = ageUp.frame.height/2
        ageUp.clipsToBounds = true
        ageDown.layer.cornerRadius = ageDown.frame.height/2
        ageDown.clipsToBounds = true
        
        
        heightLabel.text = "\(Int(heightSlider.value)) cm"
        
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
    
    @objc func decreasingWeight() {
        if weight > 10 {
            weight -= 1
            weightLabel.text = "\(weight)"
        }
    }
    @IBAction func weightDownPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                if self.weight > 10 && sender.state == .began{
                    self.weight -= 1
                    self.weightLabel.text = "\(self.weight) kg"
                } else if sender.state == .ended {
                    self.timer?.invalidate()
                }
            })
        } else if sender.state == .ended {
            timer?.invalidate()
        }
    }
    
    @IBAction func weightUpPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                if self.weight < 120 && sender.state == .began{
                    self.weight += 1
                    self.weightLabel.text = "\(self.weight) kg"
                } else if sender.state == .ended {
                    self.timer?.invalidate()
                }
            })
        } else if sender.state == .ended {
            timer?.invalidate()
        }
    }
    
    @IBAction func ageDownPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                if self.age > 1 && sender.state == .began{
                    self.age -= 1
                    self.ageLabel.text = "\(self.age)"
                } else if sender.state == .ended {
                    self.timer?.invalidate()
                }
            })
        } else if sender.state == .ended {
            timer?.invalidate()
        }
    }
    
    @IBAction func ageUpPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                if self.age < 120 && sender.state == .began{
                    self.age += 1
                    self.ageLabel.text = "\(self.age)"
                } else if sender.state == .ended {
                    self.timer?.invalidate()
                }
            })
        } else if sender.state == .ended {
            timer?.invalidate()
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UILongPressGestureRecognizer) {
        //Khởi tạo Storyboard
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //Khởi tạo màn hình kết quả
        let secondVC = mainStoryboard.instantiateViewController(withIdentifier: "SecondVC") as! BMIResultViewController
        secondVC.modalPresentationStyle = .fullScreen
        
        //Tính toán kết quả
        let height = heightSlider.value/100
        let bmiValue: Float = Float(weight)/(height*height)
        
        if bmiValue > 0 && bmiValue < 18.5 {
            secondVC.result = "UNDERWEIGHT"
            secondVC.bmiValue = String(format: "%.1f", bmiValue)
            secondVC.advice = "Too thin! You need to eat more."
            secondVC.color = .systemMint
        } else if bmiValue < 25 {
            secondVC.result = "NORMAL"
            secondVC.bmiValue = String(format: "%.1f", bmiValue)
            secondVC.advice = "Normal! Fit as a fiddle."
            secondVC.color = .green
        } else if bmiValue < 30 {
            secondVC.result = "OVERWEIGHT"
            secondVC.bmiValue = String(format: "%.1f", bmiValue)
            secondVC.advice = "Overweight! You need to exercise more."
            secondVC.color = .orange
        } else if bmiValue < 35 {
            secondVC.result = "OBESITY"
            secondVC.bmiValue = String(format: "%.1f", bmiValue)
            secondVC.advice = "Obesity! You need to eat less piece and exercise more."
            secondVC.color = .red
        } else {
            secondVC.result = "OBESITY"
            secondVC.bmiValue = String(format: "%.1f", bmiValue)
            secondVC.advice = "Dangerous Obesity! You don't eat any more sweet food and exercise hardly."
            secondVC.color = .red
        }
        
        self.present(secondVC, animated: true)
    }
    
    
}
