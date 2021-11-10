//
//  RechercheViewController.swift
//  Eval5Final
//
//  Created by Student04 on 10/11/2021.
//

import UIKit



class RechercheViewController: UIViewController {
   
    //weak var delegate : SearchDelegate!
    var tableauFilms = [Result]()
    @IBOutlet weak var searchBar: UISearchBar!
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var placeHolderImage: UIImageView!
    @IBOutlet weak var labelTopView: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var botView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.isHidden = true
        setupTopViewSearchBar()
        setupbotViewStart()
     
        topView.layer.cornerRadius = 20
        setupTableView()
        self.tableView.isHidden = true
        self.tableView.isOpaque = false
        self.tableView.tableFooterView = UIView()
        
        self.placeHolderImage.image = UIImage(named: "cinema")
        
        // je n arrive pas a cavher ma tableView..
       //  j ai recup les donnees et elle ne se met pas à jours
        
        
        
        
        
        
        
       
        
        searchBarSearchButtonClicked(searchBar: searchBar)
        // Do any additional setup after loading the view.
    }
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ResultatCell", bundle: nil), forCellReuseIdentifier: "ResultatCell")
        self.botView.backgroundColor = .white
    }
   
    func setupTopViewSearchBar(){
        self.searchBar.backgroundColor = .black
        self.searchBar.layer.cornerRadius = 15
        self.searchBar.clipsToBounds = true
        self.searchBar.barTintColor = .black
        self.searchBar.barStyle = .black
        self.searchBar.delegate = self
        
        
        self.labelTopView.text = "Search"
        self.labelTopView.tintColor = .white
        
    }
    
    func setupbotViewStart(){
        self.placeHolderImage.image = UIImage(named: "cinema")
        
        
    }
    
 
    
}
extension RechercheViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableauFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "ResultatCell", for: indexPath) as! ResultatCell
        
        Cell.titreFilm.text = tableauFilms[indexPath.row].title
        Cell.dateFilm.text = tableauFilms[indexPath.row].title
        
         return Cell
    }
    
    
    
}
extension RechercheViewController : UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.tableView.isHidden = true
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        //On récupère le texte entré dans la search bar
        
        if let text = searchBar.text {
            
            self.tableView.isHidden = false
           // textFieldShouldReturn(searchBar.searchTextField)
            FilmService.shared.getQuery(query: text)
            FilmService.shared.getFilmSearched{ films in
                if let films = films{
                    self.tableauFilms = films
                    
                    self.tableView.isHidden = false
                }else{}
                self.tableView.reloadData()
            }
            }
        self.tableView.reloadData()
        }
    
   
  
    
    }

extension RechercheViewController: UITextFieldDelegate {

}

