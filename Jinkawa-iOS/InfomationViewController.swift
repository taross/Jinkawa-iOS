//
//  InfomationListViewController.swift
//  Jinkawa-iOS
//
//  Created by Taro Sato on 2017/07/09.
//  Copyright © 2017年 Taro Sato. All rights reserved.
//

import UIKit
import NCMB

class InfomationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var infomationListView: UITableView!
    private var infomationList:[NCMBObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infomationListView.delegate = self
        infomationListView.dataSource = self
        
        InfomationModel.sharedManager.loadList()
        infomationList = InfomationModel.sharedManager.getList()
        
        print(infomationList)
        
        infomationListView.register(UINib(nibName:"InfomationItemViewCell", bundle: nil), forCellReuseIdentifier: "infomationItem")
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hi")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.infomationList.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infomationItem", for: indexPath) as! InfomationItemViewCell
        
        cell.title.text = infomationList[indexPath.row].object(forKey: "title") as? String
        cell.date.text = infomationList[indexPath.row].object(forKey: "date") as? String
        cell.publisher.text = infomationList[indexPath.row].object(forKey: "department_name") as? String
        
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
