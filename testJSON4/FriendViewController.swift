//
//  ViewController.swift
//  testJSON4
//
//  Created by vlad on 20.04.17.
//  Copyright © 2017 vladCh. All rights reserved.
//

import UIKit

let friendCellID = "FriendTableViewCell"
let moreCellID = "MoreTableViewCell"

class FriendViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var model = [FriendModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        loadFriends()
    }
    
    func loadFriends () {
        NetworkManager.sharedInstace.getFriend(onSuccess: { success in
            self.model = success
            self.myTableView.reloadData()
        }, onFail: { failString in
            let alert = UIAlertController(title: failString, message: "my massage", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        })
    }
    
    
}

extension FriendViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: friendCellID) as! FriendTableViewCell
        if indexPath.row == model.count + 1 {
            
        }
        cell.friend = model[indexPath.row]
        
        return cell
    }
    
}



















