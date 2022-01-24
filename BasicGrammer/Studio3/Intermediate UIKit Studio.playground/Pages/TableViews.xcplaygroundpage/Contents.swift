
import UIKit
import XCTest
/*:
 # TableViews
 `UITableViews` and `UICollectionViews` are a handy way to show a variable amount of items in a scrollable view. They handle reuse of cells much more efficiently than if you manually put items in a UIScrollView. You might think that you could just use `tableView.data = [my, array, of, items]` but that is not the case. Instead, we use a **datasource** to provide data.
 
 Let's create a TableView to work with. You would usually do this in Storyboards, but here we've programmatically set one up for you to work with.
 
 */
let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
/*:
 If you click the quick look button, you can see the empty table view that was created. Now, let's add some data. First, we'll need an object that acts as the datasource for the TableView.
 
 */
/*:
 + Note: A **datasource** is simply an object that implements the `UITableViewDataSource` protocol and contains methods that provide data to the table view.
 */
//: - - -
//: ## Creating an example UITableViewDataSource
//: Usually, we make a `UIViewController` the class that implements `UITableViewDataSource`. Here, since  we're not using a ViewController, we instead will create a subclass of the `NSObject` type that implements `UITableViewDataSource`. It doesn't really matter—we can use any class as long as it implements the **two** required methods. What are those methods? Let's see.
// Notice how our class implements UITableViewDataSource
class MyTableViewDataSource:NSObject, UITableViewDataSource{
    
    // First, we need a method that tells the TableView how many rows it should have.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // Second, we need a method that takes the index path (section and row) for a item in the TableView, and expects us to return a cell object. Typically, you use the index path to get a certain item from an array, and use that item to configure the cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a cell to return
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        // indexPath has two properties, `section` and `row`.
        cell.textLabel?.text = "Cell number \(indexPath.row)"
        return cell
    }
}
//: Let's see what our TableView looks like now!
tableView
//: Uh oh, nothing happened. That's because our tableView object doesn't know anything about this new data source class we've created. Let's see how we connect the two.
//: - - -
//: ## Assigning the data source to the TableView
//: It's not good enough to just create our datasource class. We have to associate it with the table view in question. UITableView has a property, `dataSource`, which can be any object implementing the `UITableViewDataSource` protocol. Let's create an instance of our datasource, and assign it to the TableView.
//: + callout(Assigning a dataSource): We've created a dataSource object for you. Assign it to the `dataSource` property of `tableView`.
let dataSource = MyTableViewDataSource()
// FIXME: Assign `dataSource` to the `dataSource` property of `tableView`
tableView.dataSource = dataSource

//: Now, when you QuickLook the TableView object, you should be able to see that the TableView was filled with several empty cells, according to the methods in our data source. Since we passed 5 to our `numberOfRows` function, there should be 5 empty rows.
//: - Note: If you're using Storyboard, there's an easier way to assign your dataSource. Simply Cntrl-drag from the tableView to your class object in the top of the VC.

//: ![Connecting a UITableViewDataSource](connecting-tb.mov)

//: - - -
//: ## Filling in actual data
//: Here, we've created a second dataSource class that is only partially completed. It should use the data in the `names` variable to fill in the rows of the tableView.
//: + callout(Write a dataSource class): Finish the class `SecondDataSource` so it displays one name from `names` in each cell.
class SecondDataSource: NSObject, UITableViewDataSource {
    
    var names = ["Michael", "Todd", "Jordie", "Nathan"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // FIXME: Return the correct number of names. DO NOT hardcode the number 4, instead, dynamically get the length of the `names` array.
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // FIXME: Return a cell containing a text label that displays the name. Look up above for how to set up a simple UITableViewCell.
        // Hint: How can we figure out which number row we're in?
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}

let secondDataSource = SecondDataSource()
tableView.dataSource = secondDataSource

//: When you've completed it, if you QuickLook the tableView, you should see the four names filled in.

//: - - -
//: ## Changing data
//: However, what happens when we change `names`? Let's see:
secondDataSource.names.append("Bob")
tableView
//: Nothing changed! That's because `tableView` only asks the datasource for data once, when it is assigned. After that, we have to let the TableView know that data has changed.
tableView.reloadData()

//: Now it works as expected!
//: \
//: We've covered how TableView data sources work. Next, we'll talk about delegate methods, and how they're different.


//: - - -
//: [Previous](@previous) | [Next](@next)
//:
//: [Welcome](Welcome) - TableViews - [TableView Delegates](TableViewDelegates) - [Reusable Cells](ReusableCells) - [CollectionViews](CollectionViews)
//: - - -

runTests(on: TableViewsTests.self)

extension TableViewsTests{
    
    func testCellForRow(){
        XCTAssertEqual(tableView.cellForRow(at: IndexPath(row: 4, section: 0))?.textLabel?.text, "Bob")
    }
    
    func testNumberOfCells(){
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 5)
    }
}


