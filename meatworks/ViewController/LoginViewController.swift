//
//  LoginViewController.swift
//  MeatWorks
//
//  Created by fwThanh on 10/18/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import Localize_Swift
import SwiftQRCode
import SVProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    
    @IBOutlet weak var viewQrCode: UIView!
    @IBOutlet weak var imgCode: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view1.layer.cornerRadius = 25
        view1.layer.borderWidth = 2
        view1.layer.borderColor = UIColor.gray.cgColor
        view2.layer.cornerRadius = 25
        view2.layer.borderWidth = 2
        view2.layer.borderColor = UIColor.gray.cgColor
        btnLogin.layer.cornerRadius = 25
        
        let langId = NSLocale.current.languageCode ?? "en"
        Localize.setCurrentLanguage(langId)
        self.setUILanguage()
    }

    func setUILanguage (){
        lbTitle.text = "SIGNIN".localized()
        tfUsername.placeholder = "username".localized()
        tfPassword.placeholder = "password".localized()
        btnLogin.setTitle("signin".localized(), for: .normal)
    }
    
    @IBAction func signInAction(_ sender: AnyObject) {
        self.view.endEditing(true)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
        MService.shared.loginAccount(username: tfUsername.text!, password: tfPassword.text!) { (userId) in
            if (userId != nil) {
                self.viewQrCode.isHidden = false
                self.imgCode.image = QRCode.generateImage(userId!, avatarImage: nil)
                SVProgressHUD.dismiss()
                Meatworks.userInfo = User(userId: userId!, email: self.tfUsername.text!, token: "", password: self.tfPassword.text!)
            }
            else {
                SVProgressHUD.dismiss()
            }
        }
    }
    
    @IBAction func nextAction(_ sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewControllerId")
        let menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewControllerId")
        let initialViewController = SlideMenuController(mainViewController: mainViewController, leftMenuViewController: menuViewController)
        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
