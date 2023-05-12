//
//  ViewController.swift
//  Im Rich
//
//  Created by Minh Tan Vu on 09/05/2023.
//

import UIKit

class IAmRichVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "I Am Rich"
        imageView.layer.opacity = 0
        label.frame.origin.y = self.view.frame.maxY + 50
//        var count = 0
        
        UIView.animate(withDuration: 5) {
            self.imageView.layer.opacity = 1
            self.label.frame.origin.y = self.view.frame.maxY - 300
        }
        
//
//        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//            self.imageView.layer.opacity += 0.02
//            self.label.frame.origin.y -= 3
//            count += 1
//            if count == 50 {
//                timer.invalidate()
//            }
//        }
    }
}

