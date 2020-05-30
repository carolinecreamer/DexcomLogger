//
//  DexcomSiteViewController.swift
//  
//
//  Created by Caroline Creamer on 5/28/20.
//

import UIKit
import WebKit

class DexcomSiteViewController: UIViewController, WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler {
    
    var webView: WKWebView!
    let userContentController = WKUserContentController()
    var myURL: URL = URL(string:"https://sandbox-api.dexcom.com/v2/oauth2/login?client_id=OIydAQ6SvqadaHqSAvOi0evpRywwa5UI&redirect_uri=creamerlogger://&response_type=code&scope=offline_access")!
    var request: URLRequest!
    var requestUrl: URL!
    let clientKey = "OIydAQ6SvqadaHqSAvOi0evpRywwa5UI"
    let clientSecret = "ngkBVXhNA0L8wTzb"
    
    func startAuthorization() {
        // redirect url set in scheme in Info.plist
        let redirectURL = "creamerlogger://"
        // set by Dexcom
        let responseType = "code"
        let scope = "offline_access"
        request = URLRequest(url: myURL)
        webView.load(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //requestUrl = myURL else { fatalError() }
        startAuthorization()
        print("~~~")
        print(request)
        
 //originally had HTTP GET request here which resulted in the request happening as soon as the site loaded, giving a 404 error as the user hadn't done anything yet. I moved the GET request into the function on line 68, but the program never seems to reach that function, so the GET request isn't called
        
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//            print("!!!")
//           print(response)
//
//            // Check if Error took place
//            if let error = error {
//                print("Error took place \(error)")
//                return
//            }
//
//            // Read HTTP Response Status code
//            if let response = response as? HTTPURLResponse {
//                print("Response HTTP Status code: \(response.statusCode)")
//            }
//
//            // Convert HTTP Response Data to a simple String
//            if let data = data, let dataString = String(data: data, encoding: .utf8) {
//                print("Response data string:\n \(dataString)")
//            }
//
//        }
//        task.resume()
        // Do any additional setup after loading the view.
    }
    

    
    //once received navigation response, requests authorization code and returns to HomeViewController
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        print("hi")
        request.httpMethod = "GET"
         // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            print("!!!")
            print(response)
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
            
        }
        task.resume()
        performSegue(withIdentifier: "returnHome", sender: self)
        
    }
    
    override func loadView() {
        super.loadView()
        //load web view
        let config = WKWebViewConfiguration()
        config.userContentController = userContentController
        webView = WKWebView(frame: self.view.bounds, configuration: config)
       webView.uiDelegate = self
       view = webView
    }
    
    
    func webView(_ webView: WKWebView,
                          didFinish navigation: WKNavigation!) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            print("!!!")
            print(response)
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
            
        }
        task.resume()
        performSegue(withIdentifier: "returnHome", sender: self)
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
/*
extension WKWebView {
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
}
*/

extension DexcomSiteViewController {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        //receives code from dexcom authentication
        if (message.name == "setToken"){
            if let token = message.body as? String{
                print(token)
            }

        }
        print("Received message from native: \(message)")
          let dict = message.body as! [String:AnyObject]
          let secretToken = dict["secretToken"] as! String
          
          // now use the name and token as you see fit!
      }
    
}
