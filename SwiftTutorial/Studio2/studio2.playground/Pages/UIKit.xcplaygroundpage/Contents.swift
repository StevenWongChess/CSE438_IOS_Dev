//: ## UIKit
//: Learning Swift is fun, but printing strings to the console isn't all that exciting. Real apps have user interfaces with buttons, text, images, colors, and animations. All of these features are built with the `UIKit` framework.
//:
//: In lab 1, you built a shopping calculator mostly with the storyboard, Xcode's visual layout tool. All elements created in the storyboard can be created and modified in code as well. In this page of the playground, we will be exploring various common user interface elements. If you get stuck, consult the UIKit documentation online or just guess and auto-complete your way to victory.
//:
//: Remember the `Quick Look` icon from the first page of this playground? It will actually render most UIKit elements, so you can see the effects of your code immidiately as you type it.
import UIKit
let sampleView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
sampleView.backgroundColor = UIColor.red
//: ### Core Graphics Basics
//: Create and initialize variables of type `CGPoint` and `CGSize`. Next, create a `CGRect` with the point and size you just created.
let ptr = CGPoint(x: 0, y: 0)
let size = CGSize(width: 50, height: 50)
let rect = CGRect(origin: ptr, size: size)
//: ### Views
//: Create a `UIView` using the `CGRect` you created above, and set the background color of the view to blue. (Use the Quick Look and Show Result buttons to see your view!)
//:
//: ![view](view.png)
let view = UIView(frame: rect)
view.backgroundColor = UIColor.blue
//: ### Subviews
//: Create another view of a different color and size, and add it as a subview to your first view. You should be able to see a colored square inside another colored square.
//:
//: ![subview](subview.png)
let smallFrame = CGRect(x: 0, y: 0, width: 30, height: 30)
let smallView = UIView(frame: smallFrame)
smallView.backgroundColor = UIColor.red
view.addSubview(smallView)
//: ### Colors
//: Create a `UIColor` by specifying your own custom RGB values. Try to create a magenta color. (If you are having trouble finding the right values for magenta, find an online color picker that gives RBG values.)
//:
//: ![color](color.png)
let color = UIColor(red: 1, green: 0, blue: 1, alpha: 0.8)
//: ### Labels
//: Create a `UILabel` and set its text to your name. Set the text color to the magenta color you previously created. Also center the text within its frame.
//:
//: ![label](label.png)
let rec = CGRect(x: 0, y: 0, width: 200, height: 100)
var label = UILabel(frame: rec)
label.text = "Yichao"
label.textColor = color
label.textAlignment = .center
label
//: ### Buttons
//: Create a `UIButton` and set its title to “Press Here” (for the normal control state). Round the corners of the button, and change the background color of the button to a color of your choice.
//:
//: ![button](button.png)
var theButton = UIButton(frame: rec)
theButton.setTitle("Press Here", for: .normal)
theButton.layer.cornerRadius = 30
theButton.backgroundColor = UIColor.green
//: ### Sliders
//: Create a `UISlider` and set the max value to 100 and the min value to -100. Change the color of the circle value indicator to red.
//:
//: ![slider](slider.png)
var theSlider = UISlider(frame: rec)
theSlider.maximumValue = 100
theSlider.minimumValue = -100
theSlider.thumbTintColor = UIColor.red
//: ### Images
//: Create a `UIImage` from a url string. You can use a url from any image you find online. To do this, use the `data` initializer of the `UIImage` object, the `contentsOf` initializer of the `Data` object, and the `string` initializer of the `URL` object. Unwrap optionals as needed.
//:
//: ![image](image.png)
let url = URL(string: "https://wustl.edu/wp-content/uploads/2021/06/Summer21_desktop_D.jpg")
let data = try?Data(contentsOf: url!)
var image = UIImage(data: data!)
//: ### Image Views
//: Create a `UIImageView` and set its image to the image you just created. Set the opacity (alpha) of the image view to 50%.
//:
//: ![imageview](imageview.png)
var imageView = UIImageView(image: image)
imageView.alpha = 0.5
//: ### Subclassing UIKit Objects
//: Create a custom subclass of the `UIView` object. Make every instance of your subclass have a red background color and rounded corners. To do this, you will need to override an existing initializer or create your own and set the modified properties inside.
//:
//: ![subclass](subclass.png)
class sub: UIView{
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.red
        self.layer.cornerRadius = 30
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
var mySub = sub(frame: rec)
//: ### Custom Layout Practice
//: Create the following image using what you’ve learned so far. Try to avoid hardcoding values and duplicating code.
//:
//: ![challenge](challenge.png)
var block = [UIView]()
var txt = [UILabel]()
var sqr = [UIView]()
var bg = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 310))
bg.backgroundColor = UIColor.gray
func create(i: Int, text: String, color: UIColor){
    block.append(UIView(frame: CGRect(x: 50, y: 10 + i * 60, width: 150, height: 50)))
    block[i].backgroundColor = UIColor.white
    bg.addSubview(block[i])
    txt.append(UILabel(frame: CGRect(x: 50, y: 20 + i * 60, width: 70, height: 30)))
    txt[i].text = text
    txt[i].textColor = UIColor.black
    bg.addSubview(txt[i])
    sqr.append(UIView(frame: CGRect(x: 150, y: 20 + i * 60, width: 30, height: 30)))
    sqr[i].backgroundColor = color
    bg.addSubview(sqr[i])
}
var t = ["Red", "Orange", "Yellow", "Green", "Blue"]
var c = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue]
for i in 0...4 {
    create(i:i, text: t[i], color: c[i])
}
bg
//:
//: [Previous](@previous) | [Next](@next)
//:
//: [Welcome](Welcome) - [Variables](Variables) - [Collections](Collections) - [Control Flow](Control%20Flow) - [Optionals](Optionals) - [Functions](Functions) - [Objects](Objects) - [Enums](Enums) - [Closures](Closures) - [Protocols](Protocols) - [Errors](Errors) - [Extensions](Extensions) - UIKit
//: - - -
