//
//  ViewController.swift
//  Lab4
//
//  Created by Steven Wong on 25/10/2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
    
    var movies:[Movie] = []
    var theImageCache:[UIImage] = []
    var keyword: String = ""
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! myCollectionViewCell
        myCell.contentView.isUserInteractionEnabled = false;
//        myCell.theText.isUserInteractionEnabled = false;
        myCell.theImage.image = theImageCache[indexPath.section * 3 + indexPath.row]
        myCell.theText.text = movies[indexPath.section * 3 + indexPath.row].title
        return myCell
    }
    
    // jump to detail
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailedVC = Detail()
        let index = indexPath.section * 3 + indexPath.row
        detailedVC.image = theImageCache[index]
        detailedVC.movie = movies[index]
        navigationController?.pushViewController(detailedVC, animated: true)
//        print(detailedVC.movie.title)
    }
    
    // Extra point, 3d touch
    func collectionView(_ collectionView: UICollectionView,contextMenuConfigurationForItemAt indexPath: IndexPath,point: CGPoint) -> UIContextMenuConfiguration?{
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ -> UIMenu? in
            return self.createContextMenu(for:self.movies[indexPath.section * 3 + indexPath.row])
        }
    }
    func createContextMenu(for movie:Movie) -> UIMenu {
        let favorite = UIAction(title: "Favorite", image: UIImage(systemName: "heart.fill")) { _ in
            
            // code reuse, so use function instead
            utility._add(movie)
            
//            var objectsArray = [Movie]()
//            let defaults = UserDefaults.standard
//            if let SavedPlayers = defaults.object(forKey: "savedinfo") as? Data {
//              let decoder = JSONDecoder()
//              if let loadedPlayers = try? decoder.decode([Movie].self, from: SavedPlayers) {
//                   objectsArray = loadedPlayers
//              }
//            }
//            var exists:Bool = false
//            for i in objectsArray{
//                if(i.id == movie.id){
//                    exists = true
//                }
//            }
//            if(!exists){
//                objectsArray.append(movie)
//            }
//            let encoder = JSONEncoder()
//            if let encoded = try? encoder.encode(objectsArray) {
//              defaults.set(encoded, forKey: "savedinfo")
//            }
            
        }
        return UIMenu(title: "", children: [favorite])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        test()
    }
    
    func setup(){
        collectionView.register(Lab4.myCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        spinner.isHidden = true

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3.3, height: UIScreen.main.bounds.width / 2)
        collectionView.collectionViewLayout = layout
    }
    
    func fetchData(key: String) {
        do{
        let url = URL(string: key)
        let data = try Data(contentsOf: url!)
        let result = try JSONDecoder().decode(APIResults.self, from: data)
        movies = result.results
        }
        catch{print("search fail")}
//        print(movies)
    }
    
    func cacheImages(){
        for item in movies{
            if(item.poster_path != nil){
                let url = URL(string: "https://image.tmdb.org/t/p/w185\(item.poster_path!)")
                let data = try? Data(contentsOf: url!)
                if(data != nil){
                    if let image = UIImage(data: data!){
                        theImageCache.append(image)
                    }
                    else{
                        theImageCache.append(UIImage(named: "blank.png")!)
                    }
                }
                else{
                    theImageCache.append(UIImage(named: "blank.png")!)
                }
            }
            else{
                theImageCache.append(UIImage(named: "blank.png")!)
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        movies = []
        theImageCache = []
        collectionView.reloadData()
        searchBar.resignFirstResponder()
        keyword = searchBar.text!
        spinner.isHidden = false
        spinner.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async {
            self.fetchData(key: "https://api.themoviedb.org/3/search/movie?api_key=e1d29eafd6c76ea8a3abf2c04ea08649&query=\(self.keyword)")
            self.cacheImages()
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.spinner.isHidden = true
                self.collectionView.reloadData()
            }
        }
        print("search complete")
    }
    
    func test(){
        fetchData(key: "https://api.themoviedb.org/3/discover/movie?api_key=e1d29eafd6c76ea8a3abf2c04ea08649&sort_by=popularity.desc")
        cacheImages()
    }
}















//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("from \(segue.source) to \(segue.destination)")
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        print("1")
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        print("2")
//    }

