import UIKit
//: # CollectionViews
/*:
 `UICollectionView` is another common UIKit component. It works very similarly to a `UITableView`. The biggest difference is that while TableViews can only have items going vertically, CollectionViews can have different-width elements in a vertical and horizontal layout.
 
 ![The CollectionView used in Lab 4](lab4.png)
 UICollectionViews are used everywhere from the Music app to the Files app to the Photos app. They are extremely powerful, allowing custom layouts, user-driven rearranging, and animating changes.
 */

//: - - -
/*:
 ## Implementation
 CollectionViews are implemented very similarily to TableViews. Let's create one to work with.
 */
// Don't worry about this line, you don't need to do it in Storyboards.
let flowLayout = UICollectionViewFlowLayout()

// Create the CollectionView
let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 200, height: 300), collectionViewLayout: flowLayout)

// Set the background color (.systemBackground is white or black, depending on dark mode)
collectionView.backgroundColor = .systemBackground

/*: Next, we should make a dataSource object. There's one problem, however: `UICollectionViewCell` does not have default styled cells like `UITableViewCell` does. Implementing a custom `UICollectionViewCell` is a bit ugly to do in Xcode Playgrounds, so we won't do it here. I highly recommend [Ray Wenderlich's explanation](https://www.raywenderlich.com/9334-uicollectionview-tutorial-getting-started#toc-anchor-013).
 */
//: - - -
/*:
 ## DataSource
 Here, we're just going to set the background color of the cells, for simplicity sake. Please read the link above, it will help immensely for Lab 4.
 + callout(Finish the datasource): Finish the datasource class below so that it makes one cell for each color, and gives the cell the correct background color.
 
 Note that our principles of cell reuse still apply.
 */
 
class SimpleDataSource: NSObject, UICollectionViewDataSource{
    let colors:[UIColor] = [.systemRed, .systemBlue, .systemGreen, .systemTeal, .systemPink]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // FIXME: Return the correct number of items, one for each color
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // FIXME: Return a cell, dequeued using the reuse identifier "myCell". DO NOT use the UICollectionViewCell constructor as we have before. Set the cell's background color to the correct color from `colors`
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        let index = indexPath.row 
        cell.backgroundColor = colors[index]
        return cell
    }
}

collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
let dataSource = SimpleDataSource()
collectionView.dataSource = dataSource

//: When you've done it, the QuickLook should look like this:

//: ![Sample result](colors.png)
/*:
 That's about it for `UICollectionView`. Again, if you're having trouble with custom cells, look at this [link](https://www.raywenderlich.com/9334-uicollectionview-tutorial-getting-started#toc-anchor-013) for a great explanation.
 */
//: - - -
/*:
 # Conclusion
 TableViews and CollectionViews are some of the most powerful UIKit components, used in just about every single stock iOS app. However, their implementation can be trickier than your typical component. Key takeaways:
 + A *dataSource* object provides data to a TableView or CollectionView
 + To create a dataSource object, implement the `UITableViewDataSource` or `UICollectionViewDataSource` protocol.
 + A *delegate* object responds to actions and provides configuration.
 + Always use cell reuse for more efficient view creation
 */
//: \
//: \
//: [Previous](@previous) | [Next](@next)
//:
//: [Welcome](Welcome) - [TableViews](TableViews) - [TableView Delegates](TableViewDelegates) - [Reusable Cells](ReusableCells) - CollectionViews
