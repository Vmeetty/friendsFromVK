//
//  FriendTableViewCell.swift
//  testJSON4
//
//  Created by vlad on 20.04.17.
//  Copyright © 2017 vladCh. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    var friend: FriendModel! {
        didSet {
            configCell()
        }
    }

    func configCell () {
        firstNameLabel.text = friend.firstName
        lastNameLabel.text = friend.lastName
        photoImageView.layer.cornerRadius = 10
        
        if let photo = friend.photoUrlStr, let url = URL(string: photo) {
            NetworkManager.sharedInstace.getPhoto(url: url, onSuccess: { (img) in
                self.photoImageView.image = img
            }, onFail: { (errorStr) in
                print("Wrong url")
            })
        }
    }
    
    override func prepareForReuse() {
        photoImageView.image = nil
        firstNameLabel.text = nil
        lastNameLabel.text = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)

        // Configure the view for the selected state
    }

}
