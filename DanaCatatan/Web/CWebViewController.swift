//
//  CWebViewController.swift
//  Catatan
//
//  Created by apple on 2024/3/5.
//

import UIKit
import WebKit
import MBProgressHUD_WJExtension

class CWebViewController: BaseViewController, WKNavigationDelegate,WKScriptMessageHandler {

    lazy var webView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.bounces = false;
        webView.scrollView.alwaysBounceVertical = false;
        webView.navigationDelegate = self;
        webView.scrollView.showsVerticalScrollIndicator = false;
        webView.scrollView.showsHorizontalScrollIndicator = false;
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.title), options: .new, context: nil)
        
        return webView
    }()
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addNavView()
        navView.block = { [weak self] in
            self?.popToSpecificViewController()
        }
        view.insertSubview(webView, belowSubview: navView)
        webView.snp.makeConstraints { make in
            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: CGFloat(NAV_HIGH), left: 0, bottom: 0, right: 0))
        }
        if let url = URL(string: url ?? "") {
            webView.load(URLRequest(url: url))
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.estimatedProgress) {
            
        } else if keyPath == #keyPath(WKWebView.title) {
            if let newTitle = change?[.newKey] as? String {
                DispatchQueue.main.async { [weak self] in
                    self?.navView.nameLabel.text = newTitle
                }
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.title))
    }
    
    //js
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    
    //web
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        addHudView()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        removeHudView()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
        removeHudView()
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url else {
            decisionHandler(.allow)
            return
        }
        let urlStr = url.absoluteString
        if urlStr.hasPrefix("mailto:") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else if urlStr.hasPrefix("whatsapp:") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                MBProgressHUD.wj_showPlainText("Not installed WhatsApp", view: nil)
            }
        }
        if urlStr.hasPrefix("mailto:") || urlStr.hasPrefix("whatsapp:") {
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
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
