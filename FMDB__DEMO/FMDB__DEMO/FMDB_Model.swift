//
//  FMDB_Model.swift
//  Project_02
//
//  Created by 丰雨 on 16/5/3.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit


class FMDB_Model: NSObject {

    var dataBase : FMDatabase
    var dbPath : String
    
    var lock : NSLock?
    
    //MARK >> 创建数据库的单例，防止数据库被复用
    static let ShareInStance = FMDB_Model()
    private override init() {
        print("HSHomeDirectory:------\(NSHomeDirectory())")
        
        let doucmentPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        let path = doucmentPath.stringByAppendingString("table.sqlite")
        self.dbPath = path
        
        //数据库初始化
        dataBase = FMDatabase.init(path: self.dbPath)
        print("path: ---- \(self.dbPath)")
    }
    
    //MARK: >> 创建表
    func createTableSqlite() {
        if dataBase.open() {
            let sqlTable: String = "create table if not exists table (id integer primary key autoincrement, M_Name text, M_Address text)"
            if dataBase.executeUpdate(sqlTable, withArgumentsInArray: nil) {
                print("数据库表创建成功")
            } else {
                print("数据库创建失败！failed:\(dataBase.lastErrorMessage())")
            }
        } else {
            print("Unable to open database!")
        }
        dataBase.close()
    }
    
    // MARK: >> 增
    func insertIntoTableSqlite(model: MModel) {
        if dataBase.open() {
            let arr:[AnyObject] = [model.M_Name!, model.M_Address!];
            if dataBase.executeUpdate("insert into table (M_Name ,M_Address) values (?, ?)", withArgumentsInArray: arr) {
                print("添加1条数据成功")
            } else {
                print("添加1条数据失败---\(dataBase.lastErrorMessage())")
            }
            dataBase.close()
        }
    }
    
    // MARK: >> 删
    func deleteFromTableSqlite(model: MModel) {
        if dataBase.open() {
            if dataBase.executeUpdate("delete from table where M_Name = (?)", withArgumentsInArray: [model.M_Name!]) {
                print("删除1条数据成功！: \(model.M_Name)")
            } else {
                print("删除1条数据失败！: \(dataBase.lastErrorMessage())")
            }
        }
    }
    
    //MARK: >> 清空表
    func cleanTableSqlite() {
        if dataBase.open() {
            if dataBase.executeUpdate("delete from table", withArgumentsInArray: nil) {
                print("清空表成功")
            } else {
                print("清空表失败----\(dataBase.lastErrorMessage())")
            }
        }
    }
    
    // MARK: >> 改
    func updateTableSqlite(model: MModel, newModel: MModel) {
        if dataBase.open() {
            let arr:[AnyObject] = [newModel.M_Name!, model.M_Name!]
            if dataBase.executeUpdate("update table set M_name = (?)  where M_Name = (?)", withArgumentsInArray: arr) {
                print("更改成功")
            } else {
                print("更改失败")
            }
        }
    }
    
    // MARK: >> 查
    func selectFromTableSqlite(model: MModel) ->Bool {
        if dataBase.open() {

            let set: FMResultSet = dataBase.executeQuery("select * from table where M_Name = (?)", withArgumentsInArray: [model.M_Name!])
            while set.next() {
                let name: String = set.stringForColumn("M_Name")
                let address: String = set.stringForColumn("M_Address")
                print("name:\(name)----address:\(address)")
                dataBase.close()
                if model.M_Name == name {
                    print("已存在---\(name)")
                    return true
                } else {
                    print("不存在---\(model.M_Name)")
                    return false
                }
            }
        }
        dataBase.close()
        return false
        
    }
    
    //输出全部数据库内容
    func getAllDataFromTableSqlite() -> [MModel]{
        var arr = [MModel]()
        
        if dataBase.open() {
            let set = dataBase.executeQuery("select * from table", withArgumentsInArray: nil)
            while set.next() {
                let model: MModel = MModel(name: set.stringForColumn("M_Name"), address: set.stringForColumn("M_Address"))
                arr.append(model)
            }
            dataBase.close()
        }
        return arr
    }
}
