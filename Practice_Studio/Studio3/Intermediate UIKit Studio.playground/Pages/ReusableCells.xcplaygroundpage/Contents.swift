import UIKit

/*:
 # Reusable Cells
 If you remember the lecture, the way we've been handling cell creation is actually somewhat inefficient. Our way creates a new cell every time the method `cellForRowAtIndexPath` is called (for simplicity). However, `UITableView` is capable of utilizing *cell reuse*, where a new cell is not created if not needed.
 */

//: - - -
/*:
 ## Implementing Cell Reuse in Storyboard
 If you create prototype cells in storyboard and assign them a reuse identifier, you can use them in your `cellForRowAtIndexPath` method by calling
 
 `tableView.dequeueReusableCellWithIdentifier("myIdentifier")`
 
 ![Creating a prototype cell in storyboard](prototypecell.png)
 
 Then, all your cells will use the design put in Storyboard.
 
 */

//: - - -
/*:
 ## Implementing Cell Reuse Programmatically
 Since we can't use Storyboard in Xcode Playgrounds, we have to register our reusable cell programmatically. Here, we create a TableView and register a standard-style cell.
 */
let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 400))
tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")

//: Now, in our datasource, we can use this reusable cell.

class SimpleDataSource: NSObject, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Try to get the reusable cell. If we can't, return an empty cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = "Cell \(indexPath.row)"
        return cell
    }
}

//: + callout(Assign the datasource): You've done this before. Assign an instance of `SimpleDataSource` to the `dataSource` property of the tableview. When you've done this, the QuickLook should show the cells filled in.
let datasource = SimpleDataSource()
tableView.dataSource = datasource
// FIXME: Assign an instance of SimpleDataSource to your tableview's dataSource

//: It may look exactly the same as before, but under the hood, this is much more efficient (take my word for it). You should always be using some form of cell reuse, unless there is a very convincing reason not to.


//: - - -
//: [Previous](@previous) | [Next](@next)
//:
//: [Welcome](Welcome) - [TableViews](TableViews) - [TableView Delegates](TableViewDelegates) - Reusable Cells - [CollectionViews](CollectionViews)
//: - - -
