//
//  Detail.swift
//  Lab4
//
//  Created by Steven Wong on 25/10/2021.
//

import UIKit

class Detail: UIViewController {
    var movie: Movie!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("reaching detail")
//        test()
        display()
        
        // still need to deal with favourite
    }
    
    func display(){
        view.backgroundColor = UIColor.green
        let theImageFrame = CGRect(x: view.frame.midX - image.size.width / 2, y: 120, width: image.size.width, height: image.size.height)
        let imageView = UIImageView(frame: theImageFrame)
        imageView.image = image
        view.addSubview(imageView)
        
        let theTextFrame = CGRect(x: 0, y: image.size.height + 120, width: view.frame.width, height: 30)
        let textView = UILabel(frame: theTextFrame)
        textView.text = movie.title
        textView.textAlignment = .center
        view.addSubview(textView)
        
        let release_date_Frame = CGRect(x: 0, y: image.size.height + 150, width: view.frame.width, height: 30)
        let release_date_View = UILabel(frame: release_date_Frame)
        release_date_View.text = movie.release_date
        release_date_View.textAlignment = .center
        view.addSubview(release_date_View)
        
        let vote_average_Frame = CGRect(x: 0, y: image.size.height + 180, width: view.frame.width, height: 30)
        let vote_average_View = UILabel(frame: vote_average_Frame)
        vote_average_View.text = String(movie.vote_average)
        vote_average_View.textAlignment = .center
        view.addSubview(vote_average_View)
        
        let overview_Frame = CGRect(x: 0, y: image.size.height + 210, width: view.frame.width, height: 90)
        let overview_View = UILabel(frame: overview_Frame)
        overview_View.text = movie.overview
        overview_View.textAlignment = .center
        view.addSubview(overview_View)
        
        let addFrame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height - 180, width: 200, height: 30)
        let button = UIButton(frame: addFrame)
        button.backgroundColor = .black
        button.setTitle("Add to Favorite", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(addFavourite), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func addFavourite(sender: UIButton!){
        print("add to favourite")
        utility._add(self.movie)
    }
    
    func test(){
        movie = (Movie(id: 1, poster_path: "https://research.engineering.wustl.edu/~todd/wustl_seal.jpg", title: "rrr", release_date: "1999", vote_average: 9.0, overview: "hello", vote_count: 90))
        let url = URL(string: movie.poster_path!)
        let data = try? Data(contentsOf: url!)
        if let tmp_image = UIImage(data: data!){
            image = tmp_image
        }
    }
}
