//
//  TestViewController.swift
//  SmartCodable_Example
//
//  Created by qixin on 2023/9/1.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SmartCodable



class TestViewController : BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let abc = "123Aa_bcc"
        
        let a = abc.convertCamelCaseToSnakeCase()
        print(a)
        
        return
        
        
        SmartConfig.debugMode = .none
        
        
        let dict: [String : Any] = [
            "nickName": "Mccc",
            "subs": [[
                "nickName": "Mccc",
                "subSex": [
                    "sexName": 123
                ]
            ]]
        ]
        

        
        let options = [
            SmartExactMap(path: "subs", from: "nickName", to: "age"),
            SmartExactMap(path: "subs.subSex", from: "sexName", to: "sex")
        ]
        let options1 = [
            SmartGlobalMap(from: "nickName", to: "age"),
            SmartGlobalMap(from: "sexName", to: "sex")
        ]
        

        if let model = MapModel.deserialize(dict: dict, keyStrategy: .globalMap(options1)) {
            print(model)
        }
    }
}

struct MapModel :SmartCodable {
   
    public var name: String = ""
    var subs: [MapSubModel] = []
    public init() {}
}
struct MapSubModel :SmartCodable {
    public var age: String = ""
    var subSex: MapSubSexModel = MapSubSexModel()
    public init() {}
}

struct MapSubSexModel :SmartCodable {
    public var sex: String = ""
    public init() {}
}


extension String {
    fileprivate func convertCamelCaseToSnakeCase() -> String {
        return unicodeScalars.reduce("") { (result, scalar) in
            if CharacterSet.uppercaseLetters.contains(scalar) {
                return result + (result.isEmpty ? "" : "_") + String(Character(scalar)).lowercased()
            } else {
                return result + String(Character(scalar))
            }
        }
    }
}
