//
//  Networking.swift
//  Tank_Calculator
//
//  Created by Anil Kumar on 24/05/19.
//  Copyright © 2019 Anil Kumar. All rights reserved.
//

import UIKit
import Alamofire

class Networking: NSObject{
    
    var dict : NSDictionary = [:]
    var values: [String]    = []
    var keys: [String]      = []
    
    let calculationUrl  = "http://aitechdemos.com/sites/tank/calculator.inc.php"
    public static let shared = Networking()
    
    func calculation(_ hv: String, _ increment: String, _ diameter: String, _ length: String, completion: @escaping (_ success:Bool, _ error: String, _ diameter: String, _ length: String, _ capacity: Double, _ inches: [String], _ gallons: [String]) -> Void){
        
        let parameters = [
            "hv" : hv,
            "increment" : increment,
            "diameter" : diameter,
            "length" : length
        ]
        
        let headers : HTTPHeaders = [
            "Content-Type":"application/x-www-form-urlencoded"
        ]
        
        APIManager.sharedManager.request(calculationUrl, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            switch(response.result){
            case .success(_):
                print(response.result.value as Any)
                if let result : [String:Any] = response.result.value as? [String : Any]{
                    for _ in result{
                        self.dict       = result["inchesdata"] as! NSDictionary
                        returnDiameter  = result["diameter"] as! String
                        returnLength    = result["length"] as! String
                        returnCapacity  = result["capacity"] as! Double
                        mobileData      = result["maildata"] as! String
                    }
                    print(mobileData)
                    self.keys = self.dict.allKeys as! [String]
                    print(self.keys)
                    if let valuesSting = self.dict.allValues as? [String] {
                        self.values = valuesSting
                        print(self.values)
                    }
                    completion(true, "", returnDiameter, returnLength, returnCapacity, self.keys, self.values)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(false, error.localizedDescription,"","", 0, [""], [""])
            }
        }
    }
}

struct APIManager {
    static let sharedManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        return Alamofire.SessionManager(configuration: configuration)
    }()
}

