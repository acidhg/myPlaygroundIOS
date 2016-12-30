//
//  ViewController.swift
//  myPlay
//
//  Created by JOHYUNGEUN on 2016. 12. 26..
//  Copyright © 2016년 Keukey. All rights reserved.
//

import UIKit
import Result
import ReactiveCocoa
import ReactiveSwift

class ReactivePerson {
    let name = MutableProperty<String>("")
}

struct ReactiveDog {
    let name: DynamicProperty<String>
}


class ReactiveCocoaViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var reactiveButton: UIButton!
    //    var queryString = reactive([AnyObject]())
    let person = ReactivePerson()
    let temp = MutableProperty<Float>(5.0)
    let tempReceiver = MutableProperty<Float>(0.0)
    typealias SearchResult = String
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let viewMonitor = self.reactive.trigger(for: #selector(viewDidLoad))
            .on(event: { print("View will appear soon... \($0)") })
            .observe(on: UIScheduler()) // not ok
        print("initiated")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        label.reactive.text <~ textField.reactive.text
        let searchStrings = textField.reactive.continuousTextValues
            .throttle(5.0, on: QueueScheduler.main)
            .logEvents()
        
        let searchResults = searchStrings
            .flatMap(.latest) { (query: String?) -> SignalProducer<(Data, URLResponse), AnyError> in
                let request = self.makeSearchRequest(escapedQuery: query)
                return URLSession.shared.reactive
                    .data(with: request)
                    .retry(upTo: 2)
                    .flatMapError { error in
                        print("Network error occurred: \(error)")
                        return SignalProducer.empty
                }
            }
            .map { (data, response) -> [SearchResult] in
                let string = String(data: data, encoding: .utf8) ?? ""
                return self.searchResults(fromJSONString: string)
            }
            .observe(on: UIScheduler())
        
        print(type(of: searchResults))
        
        searchResults.observe { event in
            switch event {
            case let .value(results):
                print("Search results: \(results)")
            case let .failed(error):
                print("Search error: \(error)")
            case .completed, .interrupted:
                break
            }
        }
        
        //        label.reactive.text <~ searchStrings  // ok
        //        label.reactive.text <~ textField.reactive.continuousTextValues    // ok
        label.reactive.text <~ temp.signal.map { "\($0)" }  // ok
        tempReceiver <~ temp.signal //ok
        person.name <~ temp.signal.map { "\($0)" }  // ok
        temp.value = 10.0
        
        let printAction = Action<Void, Void, NoError> { value in
            print("Action received")
            return SignalProducer.empty
        }
        reactiveButton.reactive.pressed = CocoaAction(printAction)  // ok
        
        self.reactive.lifetime.ended.observeCompleted { // not ok
            print("View controller completed")
        }
        
        
    }

    @IBAction func printLog(_ sender: Any) {
        print("tempReceiver: \(tempReceiver.value)")
        print("person name: \(person.name.value)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeSearchRequest(escapedQuery: String?) -> URLRequest {
        //        let url = URL(string:"https://www.google.co.kr/?gfe_rd=cr&ei=2gJmWNOLFY-EqAGs35vQCw#newwindow=1&q=" + (escapedQuery ?? ""))
        let url = URL(string:"https://httpbin.org/get")
        print("url query is: \(url?.absoluteString)")
        return URLRequest(url: url!)
    }
    
    func searchResults(fromJSONString JSONString: String) -> [SearchResult] {
        return JSONString.components(separatedBy: " ")
    }
}

