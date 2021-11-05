//
//  Favourite.swift
//  Lab4
//
//  Created by Steven Wong on 25/10/2021.
//

import UIKit

class Favourite: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var allMovies:[Movie] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: .default, reuseIdentifier: "fav")
        myCell.textLabel!.text = allMovies[indexPath.row].title
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let DetailedVC = Detail()
        
        let item:Movie = allMovies[index]
        var image_cache:UIImage
        
        if(item.poster_path != nil){
            let url = URL(string: "https://image.tmdb.org/t/p/w185\(item.poster_path!)")
            let data = try? Data(contentsOf: url!)
            if(data != nil){
                if let image = UIImage(data: data!){
                    image_cache = image
                }
                else{
                    image_cache = UIImage(named: "blank.png")!
                }
            }
            else{
                image_cache = UIImage(named: "blank.png")!
            }
        }
        else{
            image_cache = UIImage(named: "blank.png")!
        }
        DetailedVC.movie = item
        DetailedVC.image = image_cache
        print("haha")

        self.navigationController?.pushViewController(DetailedVC, animated: true)
    }
    
    // wipe to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            allMovies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)

            let defaults = UserDefaults.standard
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(allMovies) {
              defaults.set(encoded, forKey: "savedinfo")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataFromPropertyList()
        tableView.reloadData()
    }
    
    func dataFromPropertyList(){
        allMovies = []
        let defaults = UserDefaults.standard
        if let SavedPlayers = defaults.object(forKey: "savedinfo") as? Data {
          let decoder = JSONDecoder()
          if let loadedPlayers = try? decoder.decode([Movie].self, from: SavedPlayers) {
            allMovies = loadedPlayers
//            print(allMovies.count)
          }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("reaching favourite")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "fav")
        
        dataFromPropertyList()
        
    }
    
    @IBAction func clearAll(_ sender: Any) {
        allMovies = []
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode([Movie]()) {
          defaults.set(encoded, forKey: "savedinfo")
        }
        tableView.reloadData()
    }
    
}
