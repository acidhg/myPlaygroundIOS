//
//  ViewController.swift
//  myPlay
//
//  Created by JOHYUNGEUN on 2016. 12. 26..
//  Copyright © 2016년 Keukey. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SnapKit

class AlamofireViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!

    override func updateViewConstraints() {
        textView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        super.updateViewConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10)
        textView.alwaysBounceVertical = true

        print("ab")
        var str = ""
        
        Alamofire.request("https://httpbin.org/get").validate().responseJSON {response in
            if let req = response.request, let res = response.response, let dat = response.data {
                str.append("\(req)\n\n\(res)\n\n\(dat)\n\n(response.result)\n\n")
            }
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for _ in 0..<2 {
                    str.append(json.rawString()! + "\n\n")
                }
            case .failure(let error):
                str.append(error.localizedDescription + "\n\n")
            }
            struct Point {
                let x: Int
                let y: Int
            }
            let p = Point(x: 15, y: 20)
            str.append(String(describing: p))
            
            self.textView.text = str
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

