//
//  PartisitantViewController.swift
//  Jinkawa-iOS
//
//  Created by Taro Sato on 2017/09/15.
//  Copyright © 2017年 Taro Sato. All rights reserved.
//

import UIKit

class PartisipantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var participantTable: UITableView!
    var event_id:String = ""
    lazy var participantList:[Participant] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        participantTable.delegate = self
        participantTable.dataSource = self
        
        ParticipantManager.sharedInstance.loadList()
        participantList = ParticipantManager.sharedInstance.getList(event_id: self.event_id)
        print(participantList)
        
        participantTable.register(UINib(nibName: "ParticipantTableViewCell", bundle: nil), forCellReuseIdentifier: "participantCell")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = participantTable.dequeueReusableCell(withIdentifier: "participantCell") as! ParticipantTableViewCell
        let participant = participantList[indexPath.row]
        
        cell.nameLabel.text = participant.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participantList.count;
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
