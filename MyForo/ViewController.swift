//
//  ViewController.swift
//  MyForo
//
//  Created by Patrick Robinson on 19/6/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemList = self.itemArray else {
            return 0
        }
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        cell.textLabel?.text = self.itemArray![indexPath.row].title
        
        return cell
    }
    

    var client:Client?
    let session = URLSession.shared
    var itemArray:[Post]?
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        itemArray = [Post]()
        let url = URL(string:"https://jsonplaceholder.typicode.com/posts")
        var request = URLRequest(url: url!)
        client = Client(session: session)

        client?.fetch(type:[Post].self, with: request, completion: {result in
            switch result {
            case .success(let post):
                print(post[0].body)
                self.itemArray = post
                self.tableView.reloadData()
                case .failure(let error):
                print(error)
            }
        })
        
        
        
        
    }


}

