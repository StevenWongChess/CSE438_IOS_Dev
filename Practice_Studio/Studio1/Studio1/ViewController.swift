//
//  ViewController.swift
//  Studio1
//
//  Created by Steven Wong on 14/1/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theSlider: UISlider!
    @IBOutlet weak var theImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theImage.alpha = CGFloat(theSlider.value)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func move(_ sender: Any) {
        theImage.alpha = CGFloat(theSlider.value)
    }
    
}

