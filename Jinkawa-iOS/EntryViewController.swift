//
//  EntryViewController.swift
//  Jinkawa-iOS
//
//  Created by Taro Sato on 2017/09/13.
//  Copyright © 2017年 Taro Sato. All rights reserved.
//

import UIKit
import Eureka

class EntryViewController: FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        form
            +++ Section("申し込み情報")
            <<< NameRow("NameRowTag") {
                $0.title = "氏名"
                $0.add(rule: RuleRequired())
                $0.validationOptions = .validatesOnBlur
                }.onChange {
                    print("Name changed:", $0.value ?? "");
                }.cellUpdate { cell, row in
                    if !row.isValid {
                        cell.titleLabel?.textColor = .red
                    }
            }
            <<< SegmentedRow<String>("GenderRowTag") {
                $0.title = "性別　　　　　"
                $0.options = ["男", "女"]
                $0.value = "男"    // initially selected
            }
            <<< IntRow("AgeRowTag") {
                $0.title = "年齢"
            }
            <<< PhoneRow("PhoneRowTag") {
                $0.title = "電話番号"
                $0.validationOptions = .validatesOnBlur
                
            }
            <<< TextRow("AddressRowTag") {
                $0.title = "住所"
            }
        
        // If you don't want to use Eureka custom operators ...
        //        let row = NameRow("NameRow") { $0.title = "name" }
        //        let section = Section()
        //        section.append(row)
        //        form.append(section)
        //
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save,
                                                            target: self,
                                                            action: #selector(didTapSaveButton(sender:)))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func didTapSaveButton(sender: UIBarButtonItem) {
        let errors = form.validate()
        guard errors.isEmpty else {
            print("validate errors:", errors)
            return
        }
        
        // Get the value of a single row
        let nameRow = form.rowBy(tag: "NameRowTag") as! NameRow
        let name = nameRow.value!
        
        // Get the value of all rows which have a Tag assigned
        let values = form.values()
        
        let birthday = DateFormatter.localizedString(from: values["BirthdayRowTag"] as! Date,
                                                     dateStyle: .short,
                                                     timeStyle: .none)
        let email = values["EmailRowTag"] as! String
        //        let password = values["PasswordRowTag"] as! String
        let location = values["LocationRowTag"] as! String
        
        let message =
            "Name:" + name + "\n" +
                "Birthday:" + birthday + "\n\n" +
                "Email:" + email + "\n" +
                "Password:" + "●●●●●●" + "\n\n" +
                "Location:" + location
        
        let alert = UIAlertController(title: "Row values",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
