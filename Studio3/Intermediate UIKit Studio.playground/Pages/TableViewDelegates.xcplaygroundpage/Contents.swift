import UIKit
import PlaygroundSupport
//: # Delegate Methods
//: Now that we've looked at how to setup a data source, let's look at some delegate methods.
//: \
//: \
//: *Delegates* are very similar to data sources, with the main difference being their types of methods. Data source methods consist of methods for providing data to the TableView, and are called only when the TableView is initialized, and when `reloadData()` is called. On the other hand, delegate methods are called in repsonse to interactions happening, such as a cell being touched.
//: \
//: \
//: The main delegate methods you might be interested in are:
//: + `didSelectRowAt` for responding to a cell being tapped
//: + `heightForRowAt` for configuring custom heights
//: - Note: Although it seems like it would make sense for "swipe to delete" functionality to be accomplished through the delegate, it is actually a method of `UITableViewDataSource`.

//: - - -
//: ## Setup
//: Below, we're using a `UITableViewController` subclass. `UITableViewController` is a UIKit class that automatically does the following:
//: + Creates or links to a UITableView
//: + Implements the `UITableViewDataSource` and `UITableViewDelegate` protocols
//: + Assigns itself as the delegate and dataSource for the TableView.
//: \
//: \
//: Therefore, we can implement delegate and dataSource methods inside the following class and the TableView will use those methods. We've implemented a simple TableView that displays a list of numbers. When you run the code, it will open the `Playground Live View`, a sort of extended preview that you can interact with.
class TableVC: UITableViewController {
    var numbers = [100, 42, 13, 9999]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "Number \(numbers[indexPath.row])"
        return cell
    }
}

let tableVC = TableVC()
// Show the VC in the live view (on the right)
PlaygroundPage.current.setLiveView(tableVC)

//: - Note: You may need to resize the live view on the right, so you can see the code.

//: - - -
//: ## Implementation
//: Now, let's take a look at how to implement a delegate method. We've added the method signature for the method `didSelectRowAtIndexPath`, which fires when the users taps a row in the TableView.
//: + callout(Implement a delegate method): Finish the method below so that when a user taps a row, the number displayed in the row is printed out to the console.

extension TableVC{
    // What's an extension? Remember, it lets you add functionality to an existing class later on
    // Here's the method we'll be adding
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // FIXME: Finish this code so that it prints the name of the tapped cell to the console
        // If you don't remember how to use an indexPath, look at the previous code block on this page
        print(numbers[indexPath.row])
    }
}
//: Now, if you tap a row in the Live View, it should print to your console the number you tapped.

//: - - -
//: ## Add a second delegate method
//: There's several different delegate methods you might want to implement to customize your TableView. For practice, add another method that customizes the heights of each row.
//: \
//: \
//: How do you find out what the method is called? You can either use the [UITableViewDelegate documentation](https://developer.apple.com/documentation/uikit/uiTableViewdelegate) or type "tableView" below, and a list of autocomplete options should come up.
//: + callout(Implement another delegate method): Implement a method so that every row in the TableView is a different height.

extension TableVC{
    // FIXME: Add a method to make the rows different heights
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
//        return CGFloat(indexPath.row) * 20.0 + 40.0
    }
}

//: That's about it for Table Views.
//: One more thing to note is that if you want to design cells using more than the default styles, you have a few options. You can:
//: + Add views to a prototype cell in storyboard and access them via tags *or*
//: + Make a custom subclass of `UITableViewCell` and instantiate cells using it.

//: - - -
//: [Previous](@previous) | [Next](@next)
//:
//: [Welcome](Welcome) - [TableViews](TableViews) - TableView Delegates - [Reusable Cells](ReusableCells) - [CollectionViews](CollectionViews)
//: - - -
// No tests for this one! Make sure you've completed two delegate methods as specified
