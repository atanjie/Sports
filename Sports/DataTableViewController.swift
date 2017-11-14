//
//  DataTableViewController.swift
//  Sports
//
//  Created by ios20 on 17/11/14.
//  Copyright © 2017年 ios20. All rights reserved.
//

import UIKit

class DataTableViewController: UITableViewController {
    var Array = ["2016-08-05","2016-08-06","2016-08-07","2016-08-08","2016-08-09","2016-08-10","2016-08-11","2016-08-12","2016-08-13","2016-08-14"]
    var weekday = ["星期一","星期二","星期三","星期四","星期五","星期六","星期日"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    //表格
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weekday.count
    }
    //表格数
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //分组标题
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var text:String!
        
        for i in 0...10{
          text = Array[i]
            return text
        }
        return "4"
    }
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.Array
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
        cell?.textLabel?.text = weekday[indexPath.row]
        return cell!
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */



}
