//
//  RegisterViewController.swift
//  MeatWorks
//
//  Created by fwThanh on 10/18/17.
//  Copyright © 2017 PQT. All rights reserved.
//

import UIKit
import SVProgressHUD
import SlideMenuControllerSwift

class RegisterViewController: UIViewController {

    @IBOutlet weak var pview: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfMobile: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfRetypePassword: UITextField!
    @IBOutlet weak var paddingScr: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.setDefaultMaskType(.clear)
        // Do any additional setup after loading the view.
        view1.layer.cornerRadius = 25
        view1.layer.borderWidth = 2
        view1.layer.borderColor = UIColor.gray.cgColor
        view2.layer.cornerRadius = 25
        view2.layer.borderWidth = 2
        view2.layer.borderColor = UIColor.gray.cgColor
        view3.layer.cornerRadius = 25
        view3.layer.borderWidth = 2
        view3.layer.borderColor = UIColor.gray.cgColor
        view4.layer.cornerRadius = 25
        view4.layer.borderWidth = 2
        view4.layer.borderColor = UIColor.gray.cgColor
        view5.layer.cornerRadius = 25
        view5.layer.borderWidth = 2
        view5.layer.borderColor = UIColor.gray.cgColor
        view6.layer.cornerRadius = 25
        view6.layer.borderWidth = 2
        view6.layer.borderColor = UIColor.gray.cgColor
        btnRegister.layer.cornerRadius = 25
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            paddingScr.constant = 40 + keyboardSize.height
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        paddingScr.constant = 40
    }
    
    @IBAction func backAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpAction(_ sender: AnyObject) {
        
        if tfEmail.text == "" || (tfPassword.text == "" || tfPassword.text != tfRetypePassword.text) {
            let alert = UIAlertController(title: "alertRequiredFields".localized(), message: nil, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok".localized(), style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        SVProgressHUD.show()
        MService.shared.signup(u: User(userId: "0", email: tfEmail.text!, token: "", password: tfPassword.text!, tel: tfPhone.text!, mobile: tfMobile.text!, curPoint: 0, code: "", type: "", username: tfUsername.text!), completion: { (userId) in
            if userId != nil {
                Meatworks.userInfo = User(userId: userId!, email: self.tfEmail.text!, token: "", password: self.tfPassword.text!, tel: self.tfPhone.text!, mobile: self.tfMobile.text!, curPoint: 0, code: "", type: "", username: self.tfUsername.text!)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let appDelegate = UIApplication.shared.delegate! as! AppDelegate
                let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewControllerId")
                let menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewControllerId")
                let initialViewController = SlideMenuController(mainViewController: mainViewController, leftMenuViewController: menuViewController)
                appDelegate.window?.rootViewController = initialViewController
                appDelegate.window?.makeKeyAndVisible()
            }
            SVProgressHUD.dismiss()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
