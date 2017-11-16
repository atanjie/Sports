//
//  eventViewController.swift
//  Sports
//
//  Created by ios20 on 17/11/14.
//  Copyright © 2017年 ios20. All rights reserved.
//

import UIKit

class eventViewController: UIViewController{
    var getid:Int!
    var para:paramsProtocol?
    weak var delegate: LTDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self as! LTDelegate
        let selectweek = getid
        
                let alertController = UIAlertView()
                alertController.title = "提示"
                alertController.message = "你选择了\(selectweek)"
                alertController.addButton(withTitle: "ok")
                alertController.show()
        // Do any additional setup after loading the view.
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
extension eventViewController: LTDelegate {
    func postValueToUpPage(str: Int) {
        getid=str
    }
    
    
}


