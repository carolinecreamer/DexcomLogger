//
//  SignInViewController.swift
//  
//
//  Created by Caroline Creamer on 5/28/20.
//

import UIKit
import OAuthSwift
import SafariServices
import AuthenticationServices

@available(iOS 12.0, *)
class SignInViewController: UIViewController, ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return self.view.window ?? ASPresentationAnchor()
    }
    var webAuthSession: ASWebAuthenticationSession?
    var authURL = URL(string: "https://sandbox-api.dexcom.com/v2/oauth2/login?client_id=OIydAQ6SvqadaHqSAvOi0evpRywwa5UI&redirect_uri=creamerlogger://&response_type=code&scope=offline_access")
    var scheme = "creamerlogger://"
    let rest = RestManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var signInButton: UIButton!
    
    @available(iOS 13.0, *)
    @IBAction func authorizeTapped(_ sender: Any) {
        //when 'authorize' button clicked, go to Dexcom site via authorizeDexcom function
        authorizeDexcom(context: self)
    }
    
    var oauthswift: OAuth2Swift = OAuth2Swift(
        consumerKey: "OIydAQ6SvqadaHqSAvOi0evpRywwa5UI",
        consumerSecret: "ngkBVXhNA0L8wTzb",
        authorizeUrl: "https://sandbox-api.dexcom.com/v2/oauth2/login?",
        accessTokenUrl: "https://sandbox-api.dexcom.com/v2/oauth2/token",
        responseType: "code"
    )

    // Dexcom Test Functions
    @available(iOS 13.0, *)
    func authorizeDexcom(context: ASWebAuthenticationPresentationContextProviding) {
        print("started")
        
      //  oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauthswift)
        
        guard let rdURI = URL(string: "creamerlogger://") else {
            return
        }

        
        let handle = oauthswift.authorize(
        withCallbackURL: rdURI,
        scope: "offline-access", state:"") { result in
        switch result {
            case .success(let (credential, response, parameters)):
                print("!!!")
                print(credential.oauthToken)
          // Do your request
                self.webAuthSession = ASWebAuthenticationSession.init(url: self.authURL!, callbackURLScheme: self.scheme, completionHandler: { (callBack:URL?, error:Error?) in

                // handle auth response
                guard error == nil, let successURL = callBack else {
                    print("***")
                    return
                }
                //get token from auth code
                let oauthToken = NSURLComponents(string: (successURL.absoluteString))?.queryItems?.filter({$0.name == "code"}).first

                print("~~~")
                print(oauthToken ?? "No OAuth Token")
                self.webAuthSession?.presentationContextProvider = context
                self.webAuthSession?.start()
            })

        case .failure(let error):
            print("???")
            print(error.localizedDescription)
        }
    }
    }
        
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
  
}
