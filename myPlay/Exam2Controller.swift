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

class Exam2ViewController: UIViewController {
    
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
        self.textView.text = "exam2"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

