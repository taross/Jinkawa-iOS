//
//  EventViewController.swift
//  Jinkawa-iOS
//
//  Created by Taro Sato on 2017/06/28.
//  Copyright © 2017年 Taro Sato. All rights reserved.
//

import UIKit
import NCMB

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var eventListView: UITableView!
    private var eventList:[NCMBObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventListView.delegate = self
        eventListView.dataSource = self
        
        EventModel.sharedManager.loadList()
        
        self.eventList = EventModel.sharedManager.getList()
        
        eventListView.register(UINib(nibName:"EventItemViewCell", bundle:nil), forCellReuseIdentifier: "eventItem")
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toEventDetail", sender: eventList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventList.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventItem", for: indexPath) as! EventItemViewCell
        
        cell.title.text = eventList[indexPath.row].object(forKey: "event_name") as? String
        cell.date.text = eventList[indexPath.row].object(forKey: "day") as? String
        cell.location.text = eventList[indexPath.row].object(forKey: "location") as? String
        cell.publisher.text = eventList[indexPath.row].object(forKey: "event_department_name") as? String
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEventDetail"{
            let eventDetailViewController = segue.destination as! EventDetailViewController
            eventDetailViewController.event = sender as! NCMBObject
        }
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
