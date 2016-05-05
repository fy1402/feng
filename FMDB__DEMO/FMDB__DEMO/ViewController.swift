//
//  ViewController.swift
//  FMDB__DEMO
//
//  Created by 丰雨 on 16/5/5.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var addBtn: UIButton? = nil
    var cleanBtn: UIButton? = nil
    var deleteBtn: UIButton? = nil
    var updateBtn: UIButton? = nil
    var selectBtn: UIButton? = nil
    var getAllBtn: UIButton? = nil
    
    var dbShare: FMDB_Model? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbShare = FMDB_Model.ShareInStance
        
        addBtn = UIButton(type: UIButtonType.Custom)
        addBtn?.frame = CGRectMake(50, 50, 50, 50)
        addBtn?.setTitle("add", forState: UIControlState.Normal)
        addBtn?.titleLabel?.textColor = UIColor.blackColor()
        addBtn?.backgroundColor = UIColor.yellowColor()
        addBtn?.addTarget(self, action: #selector(ViewController.addBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(addBtn!)
        
        cleanBtn = UIButton(type: UIButtonType.Custom)
        cleanBtn?.frame = CGRectMake(50, 120, 50, 50)
        cleanBtn?.setTitle("clean", forState: UIControlState.Normal)
        cleanBtn?.backgroundColor = UIColor.blueColor()
        cleanBtn?.titleLabel?.textColor = UIColor.blackColor()
        cleanBtn?.addTarget(self, action: #selector(ViewController.cleanBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(cleanBtn!)
        
        deleteBtn = UIButton(type: UIButtonType.Custom)
        deleteBtn?.frame = CGRectMake(50, 190, 50, 50)
        deleteBtn?.setTitle("deleteBtn", forState: UIControlState.Normal)
        deleteBtn?.backgroundColor = UIColor.blueColor()
        deleteBtn?.titleLabel?.textColor = UIColor.blackColor()
        deleteBtn?.addTarget(self, action: #selector(ViewController.deleteBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(deleteBtn!)
        
        updateBtn = UIButton(type: UIButtonType.Custom)
        updateBtn?.frame = CGRectMake(50, 260, 50, 50)
        updateBtn?.setTitle("updateBtn", forState: UIControlState.Normal)
        updateBtn?.backgroundColor = UIColor.blueColor()
        updateBtn?.titleLabel?.textColor = UIColor.blackColor()
        updateBtn?.addTarget(self, action: #selector(ViewController.updateBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(updateBtn!)
        
        selectBtn = UIButton(type: UIButtonType.Custom)
        selectBtn?.frame = CGRectMake(50, 320, 50, 50)
        selectBtn?.setTitle("selectBtn", forState: UIControlState.Normal)
        selectBtn?.backgroundColor = UIColor.blueColor()
        selectBtn?.titleLabel?.textColor = UIColor.blackColor()
        selectBtn?.addTarget(self, action: #selector(ViewController.selectBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(selectBtn!)
        
        getAllBtn = UIButton(type: UIButtonType.Custom)
        getAllBtn?.frame = CGRectMake(50, 390, 50, 50)
        getAllBtn?.setTitle("getAllBtn", forState: UIControlState.Normal)
        getAllBtn?.backgroundColor = UIColor.blueColor()
        getAllBtn?.titleLabel?.textColor = UIColor.blackColor()
        getAllBtn?.addTarget(self, action: #selector(ViewController.getDataBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(getAllBtn!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addBtnClick() {
        for _ in 0 ..< 10 {
            addDataBaseProject()
        }
        
        for _ in 0 ..< 10 {
            dbShare = FMDB_Model.ShareInStance
            let model = MModel(name: "aa", address: "aaa")
            
            dbShare!.insertIntoTableSqlite(model)
        }
        
        for _ in 0 ..< 10 {
            dbShare = FMDB_Model.ShareInStance
            let model = MModel(name: "cc", address: "ccc")
            
            dbShare!.insertIntoTableSqlite(model)
        }
        
    }
    
    //dataBase
    func createDataBaseProject() {
        let db = FMDB_Model.ShareInStance
        db.createTableSqlite()
    }
    //曾
    func addDataBaseProject() {
        let db = FMDB_Model.ShareInStance
        let model = MModel(name: "bb", address: "bbb")
        
        db.insertIntoTableSqlite(model)
    }
    //清空
    func cleanBtnClick() {
        FMDB_Model.ShareInStance.cleanTableSqlite()
    }
    //删除
    func deleteBtnClick() {
        
        FMDB_Model.ShareInStance.deleteFromTableSqlite(MModel(name: "bb", address: "bbb"))
    }
    //更新
    func updateBtnClick() {
        dbShare = FMDB_Model.ShareInStance
        dbShare?.updateTableSqlite(MModel(name: "bb", address: "bbb"), newModel: MModel(name: "eeeeeeee", address: "eeeeeeeeeeee"))
    }
    //查询
    func selectBtnClick() {
        dbShare?.selectFromTableSqlite(MModel(name: "aa", address: "aaa"))
    }
    //输出
    func getDataBtnClick() {
        let muArr:[MModel] = (dbShare?.getAllDataFromTableSqlite())!
        print("\(muArr)")
    }

}

extension NSDate {
    class func TimeIntervalSince1970() -> NSTimeInterval{
        let nowTime = NSDate()
        return nowTime.timeIntervalSince1970
    }
}

