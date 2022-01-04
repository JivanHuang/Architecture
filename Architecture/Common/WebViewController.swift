//
//  WebViewController.swift
//
//  Created by Jivan on 2020/12/31.
//

import UIKit
import WebKit

/// 解决内存不释放问题
class WeakScriptMessageDelegate: NSObject, WKScriptMessageHandler {
    weak var scriptDelegate: WKScriptMessageHandler?

    init(_ scriptDelegate: WKScriptMessageHandler) {
        self.scriptDelegate = scriptDelegate
        super.init()
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        scriptDelegate?.userContentController(userContentController, didReceive: message)
    }
}

class WebViewController: ViewController {
    let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
    let progressView = UIProgressView()
    open var url: URL?
    open var htmlString: String?

    public convenience init(_ url: URL) {
        self.init()
        self.url = url
    }

    public convenience init(_ htmlString: String) {
        self.init()
        self.htmlString = htmlString
    }

    deinit {
        if self.isViewLoaded {
            self.webView.removeObserver(self, forKeyPath: "estimatedProgress", context: nil)
            self.webView.removeObserver(self, forKeyPath: "title", context: nil)
        }
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        initUI()

        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
        webView.uiDelegate = self
        //  Swift 调用 JavaScript 方法

        // 字体大小适配
        let textJS = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);"
        webView.evaluateJavaScript(textJS, completionHandler: nil)

        // JavaScript 调用 Swift 方法

        webView.configuration.userContentController.add(WeakScriptMessageDelegate(self), name: "")

        if url != nil {
            loadRequest()
        }
        if htmlString != nil {
            loadHtmlString()
        }
    }

    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
        if url != nil {
            progressView.frame = CGRect(x: 0, y: 0 - webView.scrollView.bounds.origin.y, width: webView.bounds.size.width, height: kOnexPixel)
            progressView.progressTintColor = .blue
        }
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func initUI() {
        view.backgroundColor = .white
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(webView)
        webView.allowsBackForwardNavigationGestures = true
        if url != nil {
            webView.addSubview(progressView)
            progressView.progress = 0.1 // to fix short time blank when view did load
        }
    }

    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if let keyPath = keyPath {
            switch keyPath {
            case "estimatedProgress":
                let newProgress = change![.newKey] as? Float
                switch newProgress {
                case 0.0:
                    progressView.isHidden = false

                case 1.0:
                    progressView.progress = newProgress!
                    delay(0.5, closure: {
                        UIView.animate(withDuration: 0.2, animations: {
                            self.progressView.isHidden = true
                        })
                    })

                default:
                    progressView.progress = newProgress ?? 0.1
                    progressView.isHidden = false
                }

            case "title":
                if let _ = title {
                    return
                }
                let title = change![.newKey] as! String
                self.title = title
            default:
                break
            }
        }
    }

    open func loadRequest() {
        if let url = self.url {
            let request = NSMutableURLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 20)
            webView.load(request as URLRequest)
        }
    }

    open func loadHtmlString() {
        if let html = htmlString {
            webView.loadHTMLString(html, baseURL: nil)
        }
    }

    fileprivate func delay(_ delay: Double? = 1.0, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay! * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure
        )
    }
}

extension WebViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {}
}

extension WebViewController: WKUIDelegate {
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { _ in
            completionHandler()
        }))
        present(alert, animated: true, completion: nil)
    }

    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { _ in
            completionHandler(true)
        }))

        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { _ in
            completionHandler(false)
        }))
        present(alert, animated: true, completion: nil)
    }
}
