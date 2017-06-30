//
//  ViewController.swift
//  MyApp14
//
//  Created by user on 2017/6/30.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController,JSPpop {
    @IBOutlet weak var webvc: UIWebView!

    @IBAction func btn(_ sender: Any) {
        let url = Bundle.main.url(forResource: "brad", withExtension: "html")
        let req = URLRequest(url: url!)
        webvc.loadRequest(req)
        // 先定義一個JSContext處理webvc 的ＪＳ再設一個物件JScontext.setObject然swift處裡JSContext
        let jscont = webvc.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as! JSContext
        
        jscont.setObject(self, forKeyedSubscript: "iii" as (NSCopying & NSObjectProtocol)!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var lb: UILabel!
    func m1(_ name:String) {
        print("\(name)")
        lb.text = name
    }
}

@objc protocol JSPpop : JSExport {
    func m1(_ name:String)
}
