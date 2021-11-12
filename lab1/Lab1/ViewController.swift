//
//  ViewController.swift
//  Lab1
//
//  Created by Steven Wong on 15/9/2021.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var discount: UITextField!
    @IBOutlet weak var tax: UITextField!
    @IBOutlet weak var final_price: UILabel!
    @IBOutlet weak var rmb_amount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func read_price(_ sender: UITextField!) {
        if let txt = sender.text{
            if(Double(txt) != nil && Double(txt)! >= 0.0){
                get_final_price()
            }
            else{
                if(txt != ""){
                    sender.text = ""
                    get_alarm()
                    final_price.text = ""
                }
            }
        }
        else{
            final_price.text = ""
        }
    }
    
    @IBAction func read_discount(_ sender: UITextField!) {
        if let txt = sender.text{
            if(Double(txt) != nil && Double(txt)! >= 0.0 && Double(txt)! <= 100.0){
                get_final_price()
            }
            else{
                if(txt != ""){
                    sender.text = ""
                    get_alarm()
                    final_price.text = ""
                }
            }
        }
        else{
            final_price.text = ""
        }
    }
    


    @IBAction func read_tax(_ sender: UITextField!) {
        if let txt = sender.text{
            if(Double(txt) != nil && Double(txt)! >= 0.0){
                get_final_price()
            }
            else{
                if(txt != ""){
                    sender.text = ""
                    get_alarm()
                    final_price.text = ""
                }
            }
        }
        else{
            final_price.text = ""
        }
    }
    
    func get_final_price(){
        if let p = Double(price.text!), let d = Double(discount.text!), let t = Double(tax.text!){
            let fp = p * (1.0 - d / 100) * (1.0 + t / 100)
            let tmp = "$\(String(format: "%.2f", fp))"
            final_price.text = tmp;
        }
    }
    
    func get_alarm(){
        let al = UIAlertController(title: "Invalid input", message: "just try again", preferredStyle: .alert)
        al.addAction(
            UIAlertAction(title: "Retry", style: UIAlertAction.Style.default, handler: { _ in}
            )
        )
        present(al, animated: true, completion: nil)
        
    }
    var flag = 0;
    @IBAction func startup(_ sender: Any) {
        flag += 1
        var t = final_price.text!
        t.removeFirst()
        if let tmp = Double(t){
            let mm = String(format: "%.2f", tmp * (flag % 2 == 0 ? 6.5 : 100))
            rmb_amount.text = ((flag % 2 == 0 ? "RMB ¥" : ("JPN".localized()) + " ¥") + mm)
        }
    }
    
}

extension String{
    func localized()->String{
        return NSLocalizedString(
            self, tableName: "Localizable", bundle: .main, value: self, comment: self
        )
    }
}

