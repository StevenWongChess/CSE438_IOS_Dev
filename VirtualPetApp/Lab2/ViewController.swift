//
//  ViewController.swift
//  Lab2
//
//  Created by Steven Wong on 20/9/2021.
//

import UIKit
import AVFoundation
//import HandyUIKit

class ViewController: UIViewController {
    var player = AVAudioPlayer()
    
    @IBOutlet weak var imageArea: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var levelInfo: UILabel!
    @IBOutlet weak var stdout: UILabel!

    @IBOutlet weak var happinessDisplay: DisplayView!
    @IBOutlet weak var playedCount: UILabel!
    @IBOutlet weak var foodDisplay: DisplayView!
    @IBOutlet weak var fedCount: UILabel!
    
    var cat:Pet?
    var dog:Pet?
    var bird:Pet?
    var bunny:Pet?
    var fish:Pet?

    var it:Pet?
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        refresh(false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initVariable()
        it = cat
        refresh(false)
    }
    func initVariable(){
//        print("lala")
        if let pic = UIImage(named: "cat"){
//            print("haha")
            cat = Pet(name: "cat", bgColor: UIColor.blue, picture: pic)
        }
        if let pic = UIImage(named: "dog"){
            dog = Pet(name: "dog", bgColor: UIColor.red, picture: pic)
        }
        if let pic = UIImage(named: "bird"){
            bird = Pet(name: "bird", bgColor: UIColor.yellow, picture: pic)
        }
        if let pic = UIImage(named: "bunny"){
            bunny = Pet(name: "bunny", bgColor: UIColor.green, picture: pic)
        }
        if let pic = UIImage(named: "fish"){
            fish = Pet(name: "fish", bgColor: UIColor.purple, picture: pic)
        }
    }

    func refresh(_ change: Bool){
        if(it != nil){
            var col = it!.bgColor
            if (traitCollection.userInterfaceStyle == .dark){
                print("change\n")
                var h:CGFloat = 0
                var s:CGFloat = 0
                var b:CGFloat = 0
                var a:CGFloat = 0
                col.getHue(&(h), saturation: &(s), brightness: &(b), alpha: &(a))
                col = UIColor(hue: h, saturation: s, brightness: b / 3, alpha: a)
            }
            imageArea.backgroundColor = col
            levelInfo.text = "Level \(it!.level)"
            imageView.image = it!.picture
            stdout.text = it!.stdout
            
            playedCount.text = "played: \(it!.totalPlay)"
            fedCount.text = "fed: \(it!.totalFeed)"

            happinessDisplay.color = col
            foodDisplay.color = col
            if change{
                happinessDisplay.value = CGFloat(it!.happiness) / CGFloat(it!.maxHappiness)
                foodDisplay.value = CGFloat(it!.foodLevel) / CGFloat(it!.maxFood)
            }
            else{
                happinessDisplay.animateValue(to: CGFloat(it!.happiness) / CGFloat(it!.maxHappiness))
                foodDisplay.animateValue(to: CGFloat(it!.foodLevel) / CGFloat(it!.maxFood))
            }
            
            stdout.text = it!.stdout
        }
    }
    
    @IBAction func playFun(_ sender: UIButton) {
        if(it != nil){
            it!.play()
            refresh(false)
        }
    }
        
    @IBAction func feedFun(_ sender: UIButton) {
        if(it != nil){
            enjoy()
            it!.feed()
            refresh(false)
        }
    }

    @IBAction func changeDog(_ sender: UIButton) {
        it = dog
        refresh(true)
    }
    
    @IBAction func changeCat(_ sender: UIButton) {
        it = cat
        refresh(true)
    }
    
    @IBAction func changeBird(_ sender: UIButton) {
        it = bird
        refresh(true)
    }
    
    @IBAction func changeBunny(_ sender: UIButton) {
        it = bunny
        refresh(true)
    }
    
    @IBAction func changeFish(_ sender: UIButton) {
        it = fish
        refresh(true)
    }
    
    func enjoy(){
        let url = Bundle.main.url(forResource: "feed", withExtension: "mp3")!
        do{
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
        }
        catch let error as NSError{ print(error)}
        player.numberOfLoops = 1
        player.prepareToPlay()
        player.play()
    }
}

