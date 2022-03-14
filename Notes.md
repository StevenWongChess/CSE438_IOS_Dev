[Bilibili video](https://www.bilibili.com/video/BV1rK4y1G7tG?from=search&seid=4595104298101061070&spm_id_from=333.337.0.0)

[website](https://www.arl.wustl.edu/~todd/cse438/#codelinks)

[swift doc](https://www.swift.org/documentation/)

###### L1: Introduction

macOS 10.15 && Xcode 12.5 && [apple](developer.apple.com)

Stanford CS193p

Outlets = pointer to some object, e.g. slider, label

24"00 => Demo: create => single view app => focus on ViewController.swift => all the semester use iPhone 11 Pro => 34"00 usage of label, button, slider (hold the ctrl key to add outlets/target action)



###### L2: Swift

Using Swift version 5.3

Declaration: let for constant, var for variable 

​		e.g. let Name:Type = Value

(We have type inference, so we can omit Type)

```swift
// Basic swift grammer
for ch in str{
  	print(ch)
}
interpolation: \(var)
array: var arr:[String] = ["apple", "banana", "cherry"]
dictionary: var dict:[String:Int] = ["apple":1, "banana":2, "cherry":3]
set: var s:Set<String> = ["apple", "banana", "cherry"]
		s.count, s.isEmpty, s.insert("duck")
while xxx{
	  dosomething
}
for i in 1...5{ // 1 to 5
		xxx
}
for i in 1..<5{ // 1 to 4
  	xxx
}
func sayhi(name: String = "defaultTom")->(Int, String){
  	print("hi, \(name)")
  	return (0, "apple")
}
function is one kind of closures => see studio 2
let sayhi:()->() = { // we can omit :()->()
  	print("hi")
}
// optionals, see page 16
let num:Int? = dict["melon"] // value or nil
if num != nil{
  	let number = num!
}
=> we can shorthand all this 
if let number = num{
		xxx
}
else{
	  xxx
}
enum Direction{
	case north
  case south
  case east
  case west
}
e.g. var myDirection = Direction.west
myDirection = .east
// we can use enum with switch!
class Person{
  var age = 21
  var description:String{
    get{
      return "you are \(age) years old"
		}
  }
}
e.g. var somePerson = Person()
struct FixedLengthRange{
	var firstValue:Int
  let length:Int
}
e.g. var range = FixedLengthRange(firstValue: 0, length: 3)
// Extensions = add function to class, but cannot override existing ones
extension Double{
  var km:Double {return self * 1000.0}
  var m:Double {return self}
  var cm:Double {return self / 100.0}
}
e.g. let onekm = 1.0.km
```

47"00 Demo: Swift grammer

Alt + variable => documentation

```swift
print(optionString ?? "default")
// cannot double optional && unwrap
```

 

###### L3: MVC and Auto Layout

View Controller = Views + Data + Logic

MVC = Model + View + Controller(between M & V, e.g. outlets, actions)

File ```AutoLayoutDemo``` => help Lab2

​	Ctrl and drag to set constrains

​	Embed in => stack view

​	stack view => + variation => height = compact => horizontal => distribution = fill equally

Lab1 requirement and demo (update live while typing)

Lab2 requirement and demo 

Demo ```PresidentApproval``` 

```swift
required init?(coder: NSCoder){
  xxx
  super.init(coder: coder)
}
// or making variable optional
private (set) var xxx
// cannot set value from outside
```

how to take advantage of ```DisplayView.swift``` 



###### L4: Additional Swift Concepts and Views

```swift
lazy var xxx = xxx()
// do not initialize until access
```

After init, all properties must have value (optional can be nil)

Two kinds: convenience & designated init

Required init = must be implemented in subclass

```swift
// Failable init: 
init? (Arg1: Type1, ...){
	xxx
}
```

18"00 Demo ``` Lecture4Playground```	Write class init

```swift
guard let a = opt else{
  return
}
defer{
  xxx
}
```

3rd video => error handling

```swift
func ff(input) throws -> output {
  throw xxx
}
do{
  try xxx 
}
catch pattern{
  xxx
}
catch{ // anything
  yyy
}
let xxx = try?xxx 
// means return optional, try! = force
```

One UIWindow for one app

View-related functions

Frame(overall) vs bounds(local)

How to ***manually*** create view(e.g. label)

Lab3 => override ```draw, touchesBegan, touchesMoved, touchesEnded```

Redraw => use ```setNeedsDisplay```

```swift
UIColor.red.set() // set pen to be red
UIRectFill(bounds), UIRectFrame(shape, e.g. rec)
UIFontTextStyle.xxx // Font

```

15"00 Demo: ```Lecture4ViewExample``` about ***manually*** create view(e.g. label), create own view,  ```draw, touchesBegan, touchesMoved, touchesEnded``` function.



###### L5: Custom Drawing

Two videos about common questions

1. ```Michael's Auto Layout Tricks``` => Lab2

​	Intrinsic size = button, label will have smallest possible size

​	Two view that don't have intrinsic size together will lead to trouble.

​	You can set equal height...

​	centring constrain

​	stack view has built-in constrains(right most menu)

​	use ```greater or equal``` instead of ```equal``` sometimes

2. ```Fixing Broken Outlets and Actions in Xcode```

Demo: ```InClassDemo1``` => drawing circles => help Lab3

​	How to use ```UIBezierPath```

​	use navigation controller to add ```clear``` button

```swift
didset{
	setNeedsDisplay()
}
```

Lab3 Demo

![螢幕截圖 2022-01-10 12.40.42](/Users/stevenwong/Downloads/438S/Lec5/螢幕截圖 2022-01-10 12.40.42.png)



###### L6: View Controllers

Navigation bar + Tab bar => help Lab4 

View controller lifecycle

```swift
viewDidLoad
viewWillAppear
viewWillDisappear
```

19"00 Demo: ```NavigationDemo```

​	Editor => embed in => navi

​	Add VC => by + VC and creating cocoa touch file => subclass of UIVC

​	Try to explore adaptive segue(e.g. linking a button to a VC)

![demo](/Users/stevenwong/Downloads/438S/Lec6/demo.png)

​	Note the order in the screenshot

​	In prepare, cannot modify the label **but** can modify the string variable thru init of ThirdVC from ToddsView

49"00 UserDefaults Demo

```swift
UserDefaults.standard.set("End of lecture" , forKey: "MyKey")
let xxx = UserDefaults.standard.string(forKey: "MyKey")
```



###### L7: Scroll Views, Table Views, and Collection Views

```swift
// Scroll view example, 3"00 Demo
let scrollView = UIScrollView(frame: theFrame)
let myImageView = UIImageView(frame: bigFrame) scrollView.addSubview(myImageView)
scrollView.contentSize = CGSize(width: 500, height: 500)
```

How to extend class => use subclass or delegation using protocol (similar to interface in Java)

```swift
class subclass: superclass, protocol1, protocol2...{
  // then implement all required methods
}
```

Tableview => UITableViewDataSource protocol

Slides 38-39 => How to reuse cell 

tableView.reloadData => update data

Three demos: Scroll view, table view, and collection view



###### L8: Local Storage and Web Services

Property Lists => small amount

2"00 Demo: property list + server

23"00 how to ssh a Jailbreaking iPod

File Paths in Your Application => page 11

Use ```Codable``` protocol => encode & decode => how to archiving and unarchiving p15-18

```bash
sqlite3 names.db
create table person (uniqueID INTEGER PRIMARY KEY, name TEXT);
insert into person (name) values ('The Donald');
insert into person (name) values ('Putin');
insert into person (name) values ('Bern');
select * from person;
```

 Objective-C wrapper around SQLite = > ```Github.com/ccgus/fmdb```

![螢幕截圖 2022-01-11 02.11.45](/Users/stevenwong/Downloads/438S/Lec8/螢幕截圖 2022-01-11 02.11.45.png)

Drag all these files in fmdb into the demo project (these are object-C code)

In ```StorageDemo-Bridging-Header``` write ```#import "FMDB.h"```

Do linking below

![螢幕截圖 2022-01-11 02.14.27](/Users/stevenwong/Library/Application Support/typora-user-images/螢幕截圖 2022-01-11 02.14.27.png)

Then write  **func** loadDatabase() {}



###### L9: Multithreading

Web service => XML(old, use [XMLParser](https://developer.apple.com/reference/foundation/xmlparser) or [SWXMLHash](https://github.com/drmohundro/SWXMLHash) to parse) or [JSON](http://www.json.org/)

[Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundati on/archives_and_serialization/encoding_and_decodin g_custom_types)

[JSON Editor](https://www.jsoneditoronline.org/)

4"00 Demo => JSON, using the file in L8

​	+ bar button items e.g. ```Fetch```

```firebase.google.com``` 15"00-35"00, should do some setting and downloading

```bash
sudo gem install cocoapods
```

Should open ```StorageDemo.xcworkspace``` in L8

WKWebView => use it in storyboard, WebDemo

openTapped will call openPage in ```UIAlertAction```

Multithread code example => page 25

QOSDemo:

###### ![螢幕截圖 2022-01-12 02.58.55](/Users/stevenwong/Library/Application Support/typora-user-images/螢幕截圖 2022-01-12 02.58.55.png)

Order: before, after, middle

Change async into sync,

![螢幕截圖 2022-01-12 03.02.44](/Users/stevenwong/Library/Application Support/typora-user-images/螢幕截圖 2022-01-12 03.02.44.png)

Order: before, middle, after

![螢幕截圖 2022-01-12 03.05.03](/Users/stevenwong/Library/Application Support/typora-user-images/螢幕截圖 2022-01-12 03.05.03.png)

Order: before, after, high priority and low priority in random order

![螢幕截圖 2022-01-12 03.06.38](/Users/stevenwong/Library/Application Support/typora-user-images/螢幕截圖 2022-01-12 03.06.38.png)

Change ```.background``` into ```.userInitiated```

Order: before, after, all high priority, all low priority

```swift
for _ in 0 ..< 100{
	_ = try Data(contentsOf: theURL!)
}
```

With multithreading, you can still drag slider while doing background job.

More on multithreading => see page 30 for tutorial link



###### L10: Remote APIs

Lab4 Demo

```InClassDemo2``` => help Lab4

​	Instead of using storyboard, this time we try another way. Programmatically create the ```DetailedViewController```. 

​	```UITableViewDelegate``` protocol for clicking, then use ```navigationController?.pushViewController(detailedVC, animated: true)```

![螢幕截圖 2022-01-12 18.02.48](/Users/stevenwong/Library/Application Support/typora-user-images/螢幕截圖 2022-01-12 18.02.48.png)

​	Notice the order of tab bar controller and navigation controller

​	At last, use multithread when fetching data. (```self.tableView.reloadData()```)



###### L11: Maps and Location Services

```ninjamock.com``` is a great way to demo + final project ideas examples

```import MapKit```

MKMapView

​	translate between CLLocation and human-readable addresses

​	Support for “annotations” (pins on a map)

​	Reverse Geocoding

​	A lot of APIs => page 9-14

Alt to use two-finger mode.

Starting from IOS 8, need ```locationManager.requestWhenInUseAuthorization()```

CoreLocationDemo

In ```info.plist```, add this

![螢幕截圖 2022-01-12 20.42.33](/Users/stevenwong/Library/Application Support/typora-user-images/螢幕截圖 2022-01-12 20.42.33.png)

[Geocoding demo](https://github.com/ooper-shlab/GeocoderDemo-Swift), see line 350-396



###### L12: Camera, Gestures, and Audio and Video 

```swift
// add these to info.plist
Privacy – Camera Usage Description
Privacy – Photo Library Usage Description
Privacy – Photo Library Additions Usage Description
```

Have to plug in a real device instead of simulator

Camera Demo => take picture, view labum, save to album

No need to define your own “gestures” using touches began, touches moved, and touches ended

Add gestures via storyboard or programmatically

Gesture Demo in Camera Demo's ```viewDidLoad(){}```

e.g. ```UISwipeGestureRecognizer```, 

For short sound =>

```swift
var soundID: SystemSoundID
let fileURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), “mySound” as
CFString!, ”caff” as CFSTring!, nil)
// First register the sound
AudioServicesCreateSystemSoundID (fileURL!, &soundID);
// Then you can play the sound
AudioServicesPlaySystemSound (soundID);

Easily convert sounds to System Sounds formats 
/usr/bin/afconvert -f aiff -d BEI16 input.mp3 output.aif
```

For longer sound => AVAudioPlayer

```swift
var player = AVAudioPlayer()
let url = Bundle.main.url(forResource: “myAudio”, withExtension: “mp3”)! do {
player = try AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
}
catch let error as NSError {print(error.description) }
player.numberOfLoops = 1 player.prepareToPlay() player.play()
```

Demo: audio & video => short, long, video 3 buttons



###### L13: Design Principles

https://developer.apple.com/videos/play/wwdc2017/802/

https://developer.apple.com/design/



###### L14: SwiftUI, Core ML, Building Production-Quality Apps

![螢幕截圖 2022-01-12 23.38.37](/Users/stevenwong/Library/Application Support/typora-user-images/螢幕截圖 2022-01-12 23.38.37.png)

State variable: ```@State var count:Int = 0``` 

​	When state variable changes, anything using the variable refresh. But NOT vice versa.

List Demo(instead of tableView) 

Binding is a two way (different from state variable), by putting a $ before a variable name

![螢幕截圖 2022-01-13 00.08.56](/Users/stevenwong/Library/Application Support/typora-user-images/螢幕截圖 2022-01-13 00.08.56.png)

Navi Demo

Redo Lab1 using SwiftUI!

![螢幕截圖 2022-01-13 00.21.48](/Users/stevenwong/Library/Application Support/typora-user-images/螢幕截圖 2022-01-13 00.21.48.png)

Tutorial: 

​	https://developer.apple.com/tutorials/swiftui/creating-and- combining-views

​	The official documentation is pretty minimal at this point, so I highly recommend one of the ones below

​	https://github.com/SimpleBoilerplates/SwiftUI-Cheat-Sheet

​	https://www.hackingwithswift.com/

​	https://swiftui-lab.com

MLModel(but not interested)

How to Building Production-Quality Apps



###### L15: Objective-C

[Video](https://wustl.instructure.com/courses/69275/pages/lecture-15-objective-c-videos)

Objective-C is a super class of C

Message syntax

```objective-c
[receiver message:arg1 andArg:arg2]
```



###### L16: All proposal presentation

