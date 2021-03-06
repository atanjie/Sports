//
//  SportprojectViewController.swift
//  Sports
//
//  Created by ios20 on 17/11/13.
//  Copyright © 2017年 ios20. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SportprojectViewController: UICollectionViewController {
    
    
    var events : NSArray!
    var p:[EventsModel] = Array<EventsModel>()
    weak var delegate: LTDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Register cell classes
        collectionView?.delegate = self
        collectionView?.dataSource = self
        getdata()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 6
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SportsprojectViewCell
        cell.Sports_Image.image = UIImage(named: p[indexPath.section*2+indexPath.row].icon!)
        return cell
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func getdata() {
        let eve = EventsModel(0, "", "", "", "", "")
        let evt = EventsDao()
         p = evt.getEvents(eve)
    }
    var id:Int32!
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView!.deselectItem(at: indexPath, animated: true)
//        let selectweek = p[indexPath.section*2+indexPath.row].id
//        let alertController = UIAlertView()
//        alertController.title = "提示"
//        alertController.message = "你选择了\(p[indexPath.section*2+indexPath.row].id)"
//        alertController.addButton(withTitle: "ok")
//        alertController.show()
        id=Int32(p[indexPath.section*2+indexPath.row].id)
        //prepare(for: eventViewController, sender: <#T##Any?#>)
        let secondViewController = eventViewController()
        secondViewController.getid=id
        var sb=UIStoryboard.init(name: "Main", bundle: nil)
        var vc=sb.instantiateViewController(withIdentifier: "eventView") as! eventViewController
        vc.getid=id
        //self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let EventViewController=segue.destination as! eventViewController
        EventViewController.getid=id
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
protocol LTDelegate: NSObjectProtocol {
    func postValueToUpPage(str: Int)
}

