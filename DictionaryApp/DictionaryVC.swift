//
//  DictionaryVC.swift
//  DictionaryApp
//
//  Created by MacBook on 25/11/17.
//  Copyright © 2017 MacBook. All rights reserved.
//

import UIKit

class DictionaryVC: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
   
    @IBOutlet weak var wordlbl: UILabel!
    @IBOutlet weak var typelbl: UILabel!
    @IBOutlet weak var disctxtview: UITextView!

    
    var searchwords: [SearchWord]?
    var searchword : [String] = []
    let searchResult = SearchWord()
    
    
   var exists: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    searchBar.delegate = self
    
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.text = searchText.localizedLowercase
        print(searchText)

        let url = URL(string: "https://owlbot.info/api/v2/dictionary/\(searchText)?format=json")
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                print(error!)
                return
            }
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)as! [[String:AnyObject]]
                
                print(json)
                for searchFromJson in json {
                    print(searchFromJson)
                    
                    let search = SearchWord()
                    
                    if let type = searchFromJson["type"] as? String, let definition = searchFromJson["definition"] as? String{
                        
                        self.searchResult.type = type
                        self.searchResult.definition = definition
                    }
                    self.searchwords?.append(search)
                }
            }catch let error {
                print(error)
            }
        }
        task.resume()
    }
  }
}

