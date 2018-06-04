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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.imgCode.image = QRCode.generateImage(Meatworks.userInfo?.currentUserId ?? "", avatarImage: nil)
    }

    @IBAction func openMenu(_ sender: AnyObject) {
        self.openLeft()
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
