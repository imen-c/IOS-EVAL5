//
//  TopRatedViewController.swift
//  Eval5Final
//
//  Created by Student04 on 10/11/2021.
//

import UIKit
import Alamofire
import AlamofireImage
class TopRatedViewController: UIViewController {
    
    static let urlI = "https://image.tmdb.org/t/p/w500"

    var TopFilms = [Result]()
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        appelData()
        print(TopFilms.count)
    }
    
    func appelData(){
        FilmService.shared.getTopRated {
            films in
            if let films = films{
                self.TopFilms = films
                }else{}
        }
    }
    func setupCollection(){
        let layout = UICollectionViewFlowLayout()
                layout.scrollDirection = .vertical

                let itemWidth = (collectionView.frame.size.width/2) - 4
                layout.itemSize = CGSize(width: itemWidth, height: itemWidth)

                layout.minimumLineSpacing = 4
                layout.minimumInteritemSpacing = 0

                collectionView.collectionViewLayout = layout

                collectionView.register(UINib(nibName: "Collectionell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")

                collectionView.dataSource = self
                collectionView.delegate = self
    }

}
extension TopRatedViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        TopFilms.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        if let path = TopFilms[indexPath.row].backDropPath {
             if let url = URL(string: "https://image.tmdb.org/t/p/w500\(path)" ){
                 
             cell.affiche.af.setImage(withURL: url, filter: AspectScaledToFillSizeFilter(size: cell.affiche.frame.size))
             }}
        
        let vote = TopFilms[indexPath.row].voteAverage
        //cell.vote.text = String(vote)
        
        return cell
    }
    
    
    
}
