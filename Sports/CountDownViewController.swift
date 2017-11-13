//
//  CountDownViewController.swift
//  Sports
//
//  Created by ios19 on 2017/11/13.
//  Copyright © 2017年 ios20. All rights reserved.
//

import UIKit

class CountDownViewController: UIViewController {

    @IBOutlet weak var lblCountDown: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建NSDateComponents对象
        let comps = NSDateComponents()
        //设置NSDateComponents日期
        comps.day = 5
        //设置NSDateComponents月
        comps.month = 8
        //设置NSDateComponents年
        comps.year = 2016
        
        //创建日历对象
        let calender = NSCalendar(calendarIdentifier:.gregorian)
        
        //获得2016-8-5日的NSDate日期对象
        let destinationDate = calender!.date(from: comps as DateComponents)
        
        let date:NSDate = NSDate()
        //获得当前日期到2016-8-5时间的NSDateComponents对象
        let components = calender!.components(NSCalendar.Unit.day, from: date as Date, to: destinationDate!, options:NSCalendar.Options.init(rawValue: 0))
        
        //获得当前日期到2016-8-5相差的天数
        let days = components.day
        
        //Swift1.1 -> Swift1.2修改点 start
        let strLabel = String(format:"%i天", days!)//NSString改为String
        //Swift1.1 -> Swift1.2修改点 end
        
        self.lblCountDown.text = strLabel
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
