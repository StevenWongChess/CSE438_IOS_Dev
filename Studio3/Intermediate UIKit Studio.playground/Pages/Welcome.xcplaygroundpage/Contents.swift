import UIKit
import XCTest
//: # Studio 3: UITableView and Intermediate UIKit
//: ## CSE 438: Mobile Application Development
//: ### Overview
//: In this studio, you will look at some advanced concepts that you might use in a lab or your final project. We'll especially focus on UITableView and UICollectionView, which are important to understand for Lab 4.
//: ### Details
//: **Due:** End of class today. \
//: **Grading:** Complete as much of the studio as you can to get credit. \
//: **Submission:** Zip the file and submit it on Canvas under Studio 3.
//:
/*:
 - - -
 ## Reminder about QuickLook
 Remember that in a playground, you can use the `QuickLook` button to preview a `UIKit` element, and the `Show Result` button to keep the rendered element visible on the screen. Below, we create a UIButton, and then you can view it using QuickLook or `Show Result`.
 */
let button = UIButton()
button.setTitle("Click me!", for: .normal)
button.sizeToFit()
button.setTitleColor(.systemBlue, for: .normal)
button
/*:
 Since this lab primarily deals with UIKit, we will be using a lot of rendered UIKit elements.
 + callout(Creating a UIKit View): Let's practice by creating a UILabel, assigning it the text "Hello, world!", and making the text a color of your choice besides black. After you do that, use QuickLook to check that it works.
 */
let label:UILabel = UILabel()
// FIXME: Assign the text "Hello, world!" to the label
label.text = "Hello, world!"
// FIXME: Set the label's text color to something other than black
label.textColor = UIColor.green
label.sizeToFit() // resizes the label to fit the text, don't change this
label

/*:
 - - -
 ## Tests
 Like in Studio 2, the bottom of the page will have a runTests call. If the tests pass, you will see all ✅s. The order of the checks matches the order of tests on the page. Tests may be commented out, you must uncomment them before running.
 */
//: - - -
//: To navigate between pages, use the links at the bottom of each page. Click the "Next" button below to get started.
//: \
//: \
//: [Previous](@previous) | [Next](@next)
//:
//: Welcome - [TableViews](TableViews) - [TableView Delegates](TableViewDelegates) - [ReusableCells](ReusableCells) - [CollectionViews](CollectionViews)
//: - - -
runTests(on: WelcomeTests.self)

extension WelcomeTests{
    func testLabel(){
        XCTAssertEqual(label.frame.width, 94.5)
        XCTAssertNotEqual(label.textColor, UIColor.label)
    }
}
