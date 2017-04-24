//
//  NetworkManager.swift
//  testJSON4
//
//  Created by vlad on 20.04.17.
//  Copyright © 2017 vladCh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    static var sharedInstace = NetworkManager()
    private init () {
    }
    
    var baseURL = "https://api.vk.com/method/friends.get"
    var params: [String:Any] = ["user_id":7914257, "order":"name", "count":30, "fields":"city,domain,photo_100", "v":5.63]
    
    func getFriend (onSuccess: @escaping ([FriendModel])->(), onFail: @escaping (String)->()) {
        
        Alamofire.request(baseURL, method: .get, parameters: params).responseJSON(completionHandler: { response in
            if let error = response.error {
                onFail(error.localizedDescription)
            } else {
                if let value = response.value {
                    onSuccess(FriendModel.parseJson(json: JSON(value)))
                }
            }
        })
        
    }
    
    func getPhoto (url: URL, onSuccess: @escaping (UIImage)->(), onFail: @escaping (String)->()) {
        
        Alamofire.request(url).response(completionHandler: { response in
            if let error = response.error {
                onFail(error.localizedDescription)
            } else {
                if let imgData = response.data, let image = UIImage(data: imgData) {
                    onSuccess(image)
                }
            }
        })
        
//        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data,_,error) in
//            if let errorSting = error {
//                onFail(errorSting.localizedDescription)
//            } else {
//                if let dataForString = data, let dataString = UIImage(data: dataForString) {
//                    onSuccess(dataString)
//                }
//            }
//        })
//        task.resume()
    }
    
}
