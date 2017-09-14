//
//  EventDetailViewController.swift
//  Jinkawa-iOS
//
//  Created by Taro Sato on 2017/09/13.
//  Copyright © 2017年 Taro Sato. All rights reserved.
//

import UIKit
import NCMB

class EventDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var event:NCMBObject = NCMBObject() // イベントオブジェクトの保持
    let detailList:[String] = [
        "event_name",
        "event_department_name",
        "day",
        "location",
        "description"
    ]
    
    @IBOutlet weak var detailTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(event)
        
        detailTable.delegate = self
        detailTable.dataSource = self
        
        // Do any additional setup after loading the view.
        detailTable.register(UINib(nibName:"EventDetailTableViewCell", bundle:nil), forCellReuseIdentifier: "detailCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.detailList.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! EventDetailTableViewCell
        cell.title.text = event.object(forKey: detailList[indexPath.row]) as? String
        
        return cell
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
