//
//  ExplainOneViewController.swift
//  SmartCodable_Example
//
//  Created by qixin on 2024/1/22.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import UIKit

class ExplainOneViewController: BaseTwoViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "为什么要在Model中实现init方法？"
        
        contentLabel.text = """
        
        如果您的解析模型中设置了一个非可选的模型属性，如果解析失败了，SmartCodable会提供一个这个模型属性的默认值，这就意味着该模型支持无参的初始化方法‘.init()’。
        
        在SmartDecodable协议中声明了init方法，这代表着协议遵循者必须实现协议中定义的init方法。
        对于初始化方法（init）来说无法提供默认的实现，因为构造器的默认实现可能无法满足所有遵循该协议的类型的初始化需求。
        
        遵循 SmartDecodable 协议的类型不能避免实现 init() 方法，但如果所有属性都有默认值或是可选的，并且没有定义其他初始化方法，那么 Swift 将自动为您提供这个初始化方法。
        
        如果这个模型被public，那么需要实现 ‘public init() { }’ 。这是因为在 Swift 中，协议的访问级别会影响到实现该协议的类型所需的访问级别。这意味着任何遵循该协议的类型都需要公开地实现所有协议要求的方法和属性。
        """
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
