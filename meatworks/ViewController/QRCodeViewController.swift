//
//  QRCodeViewController.swift
//  TRG
//
//  Created by PqThanh on 5/31/18.
//  Copyright © 2018 PQT. All rights reserved.
//

import UIKit
import SwiftQRCode

class QRCodeViewController: UIViewController {

    @IBOutlet weak var imgCode: UIImageView!
    @IBOutlet weak var btnNext: UIButton!
    
    var otpBlock: ((String) -> Void)? = nil
    var isFirstLogin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.imgCode.image = QRCode.generateImage(Meatworks.userInfo?.currentUserId ?? "", avatarImage: nil)
        btnNext.isHidden = !isFirstLogin
    }

    @IBAction func openMenu(_ sender: AnyObject) {
        self.openLeft()
    }
    
    @IBAction func next(_ sender: AnyObject) {
        if let otpBlock = self.otpBlock {
            otpBlock("")
            self.dismiss(animated: true, completion: nil)
        }
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
