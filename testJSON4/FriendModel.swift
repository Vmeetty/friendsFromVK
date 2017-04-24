//
//  FriendModel.swift
//  testJSON4
//
//  Created by vlad on 20.04.17.
//  Copyright © 2017 vladCh. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class FriendModel {
    
    var firstName: String
    var lastName: String
    var photoUrlStr: String?
    
    init? (json: JSON) {
        guard let fn = json["first_name"].string, let ln = json["last_name"].string else {
            return nil
        }
        firstName = fn
        lastName = ln
        photoUrlStr = json["photo_100"].string
    }
    
    static func parseJson (json: JSON) -> [FriendModel] {
        var result: [FriendModel] = []
        
        if let friendArray = json["response"]["items"].array {
            for friend in friendArray {
                if let forResult = FriendModel(json: friend) {
                    result.append(forResult)
                }
            }
        }
        return result
    }
    
}
