//
//  WikipediaControllerViewController.swift
//  Project16
//
//  Created by İstemihan Çelik on 9.04.2021.
//

import UIKit
import WebKit

//Project:16 Challenge:3


class WikipediaControllerViewController: UIViewController {
    
    var webView: WKWebView!
    var capital: Capital?
    
    override func loadView() {
        webView = WKWebView()
        //webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let capital = capital else { return }
        
        let url = URL(string: "https://en.wikipedia.org/wiki/" + capital.wikiInfo)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true

    }
    

   

}
