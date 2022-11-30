//
//  WebViewController.swift
//  BreakingBad
//
//  Created by Mustafa Çiçek on 26.11.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    configureWebview()
        // Do any additional setup after loading the view.
    }
    
    private func configureWebview() {
        view.addSubview(webView)
        guard let url = URL(string: "https://www.imdb.com/title/tt0903747/") else { return }
        webView.load(URLRequest(url: url))
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

}
