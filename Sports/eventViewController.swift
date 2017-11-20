//
//  eventViewController.swift
//  Sports
//
//  Created by ios20 on 17/11/14.
//  Copyright © 2017年 ios20. All rights reserved.
//

import UIKit

class eventViewController: UIViewController{
    var getid:Int32!
    var para:paramsProtocol?
    weak var delegate: LTDelegate?
    
    @IBOutlet weak var imginfo: UIImageView!
    @IBOutlet weak var tittleinfo: UILabel!
    @IBOutlet weak var txtinfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate=self
        getdata()
//        let selectweek = getid
//        
//                let alertController = UIAlertView()
//                alertController.title = "提示"
//                alertController.message = "你选择了\(selectweek)"
//                alertController.addButton(withTitle: "ok")
//                alertController.show()
        // Do any additional setup after loading the view.
    }
   


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getdata()
    {
        let eve = EventsModel(getid, "", "", "", "", "")
        let  dao = EventsDao()
        let evente =  dao.getEvents(eve)
    
        
        self.tittleinfo.text = evente[0].basicInfo
        self.txtinfo.text = evente[0].name
        self.imginfo.image=UIImage(named: evente[0].icon!)
        
        
        
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
    }
    
    
}


