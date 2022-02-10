//
//  BackWebviewController.swift
//
//  Created by Jivan on 2020/12/31.
//

import UIKit
import WebKit

class BackWebviewController: WebViewController, WKNavigationDelegate, UIGestureRecognizerDelegate {
    var backButtonTitle: String!
    var closeButtonTitle: String!

    fileprivate var isPresent = false
    fileprivate var closeBarButton: UIBarButtonItem!
    fileprivate var backBarButton: UIBarButtonItem!

    deinit {
        self.webView.navigationDelegate = nil
    }

    public convenience init(_ url: URL) {
        self.init()
        self.url = url
        backButtonTitle = "返回"
        closeButtonTitle = "关闭"
    }

    public convenience init(_ htmlString: String) {
        self.init()
        self.htmlString = htmlString
        backButtonTitle = "返回"
        closeButtonTitle = "关闭"
    }

    public convenience init(_ url: URL, backButtonTitle: String?, closeButtonTitle: String?) {
        self.init()
        self.url = url
        self.backButtonTitle = backButtonTitle ?? "返回"
        self.closeButtonTitle = closeButtonTitle ?? "关闭"
    }

    public convenience init(_ htmlString: String, backButtonTitle: String?, closeButtonTitle: String?) {
        self.init()
        self.htmlString = htmlString
        self.backButtonTitle = backButtonTitle ?? "返回"
        self.closeButtonTitle = closeButtonTitle ?? "关闭"
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        setupBarButtons()

        isPresent = presentingViewController != nil
        if isPresent {
            navigationItem.rightBarButtonItems = [closeBarButton]
        } else {
            navigationItem.leftBarButtonItems = [backBarButton]
        }
    }

    weak var originalGestureDelegate: UIGestureRecognizerDelegate?
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        originalGestureDelegate = navigationController?.interactivePopGestureRecognizer?.delegate
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = originalGestureDelegate
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UI

    fileprivate func setupBarButtons() {
        let closeButton = UIButton(type: .system)
        closeButton.setTitle(closeButtonTitle, for: .normal)
        closeButton.setTitleColor(navigationController?.navigationBar.tintColor, for: .normal)
        closeButton.tintColor = navigationController?.navigationBar.tintColor
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        closeButton.addTarget(self, action: #selector(handleClose), for: .touchUpInside)
        closeButton.sizeToFit()
        closeButton.contentEdgeInsets = UIEdgeInsets(top: 1, left: -10, bottom: 0, right: 0)
        closeBarButton = UIBarButtonItem(customView: closeButton)

        let backImage = UIImage(named: "nav_back", in: Bundle(for: WebViewController.self), compatibleWith: nil)
        let backButton = UIButton(type: .system)
        backButton.setTitle(backButtonTitle, for: .normal)
        backButton.setTitleColor(navigationController?.navigationBar.tintColor, for: .normal)
        backButton.tintColor = .blue
        backButton.setImage(backImage, for: .normal)
        backButton.setImage(backImage, for: .highlighted)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        backButton.sizeToFit()
        backButton.contentEdgeInsets = UIEdgeInsets(top: 2, left: -15, bottom: 0, right: 0)
        backButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 0)
        backBarButton = UIBarButtonItem(customView: backButton)
    }

    // MARK: - Action

    @objc func handleClose() {
        if isPresent {
            dismiss(animated: true, completion: nil)
        } else {
            _ = navigationController?.popViewController(animated: true)
        }
    }

    @objc func handleBack() {
        if webView.canGoBack {
            // 网页返回
            webView.goBack()

        } else {
            // 原生导航返回
            handleClose()
        }
    }

    // MARK: - WKNavigationDelegate

    open func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
        updateBackButtons(navigationAction)
    }

    open func updateBackButtons(_ navigationAction: WKNavigationAction) {
        switch navigationAction.navigationType {
        case .backForward:
            if isPresent, !webView.canGoBack {
                navigationItem.rightBarButtonItems = [closeBarButton]
            } else {
                if navigationItem.leftBarButtonItems?.count != 2 {
                    navigationItem.rightBarButtonItems = [closeBarButton]
                    navigationItem.leftBarButtonItems = [backBarButton]
                }
            }

        default:
            break
        }
    }

    // MARK: - UIGestureRecognizerDelegate

    open func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIScreenEdgePanGestureRecognizer, !webView.canGoBack {
            return true
        }
        return false
    }
}
