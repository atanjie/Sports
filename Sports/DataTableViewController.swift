//
//  DataTableViewController.swift
//  Sports
//
//  Created by ios20 on 17/11/14.
//  Copyright © 2017年 ios20. All rights reserved.
//

import UIKit

class DataTableViewController: UITableViewController {
    var schecles : NSArray!
    var data:[ScheduleModel] = Array<ScheduleModel>();
    
    var days = ["2016-08-05","2016-08-06","2016-08-07","2016-08-08","2016-08-09","2016-08-10","2016-08-11","2016-08-12","2016-08-13","2016-08-14"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    //表格
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return days.count
    }
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    //表格数
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //分组标题
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var text:String!
        text = days[section]
        return text
    }
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.days
    }
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell=tableView.dequeueReusableCell(withIdentifier: "diy_cell")
        if(cell == nil){//因为是纯代码实现，没有对行里的cell做注册，这里是 做注册， 注册一次后，下次会继续使用这个缓存
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "diy_cell");
        }
        let d = ScheduleDao()
        var dataday:String!
        for j in 0...10{
            dataday = days[j]
            let s = ScheduleModel(id: 0, eid: 0, gameDate: days[j], gameTime: "", info: "", startGameDate: days[j], endGameDate: "", startGameTime: "", endGameTime: "")
            let list = d.getSchedule(s)
            for i in list{
                cell?.textLabel?.text = i.info
                return cell!
            }
        }
        return cell!
    }

}
