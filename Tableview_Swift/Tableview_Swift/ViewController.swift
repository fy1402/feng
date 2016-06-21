//
//  ViewController.swift
//  Tableview_Swift
//
//  Created by 丰雨 on 16/6/2.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setTableView()
//        setCollectionView()
        view.addSubview(collectionView)
    }
    
    
    // MARK: - lazy loading
    private lazy var collectionView: UICollectionView = {
        let layout = WaterFallFlowLayout()
        layout.delegate = self
        
        let collectionView = UICollectionView(frame: UIScreen.mainScreen().bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: String(UICollectionViewCell))
        
        return collectionView
    }()
    
    private lazy var items: [Square] = {
       return Square.squares()
    }()
    
    // MARK: - UICollectionViewDataSource
//    extension ViewController: UICollectionViewDataSource {
//        
//    }
    
    
    
    
    func setTableView() {
        tableView = UITableView(frame: CGRectMake(0, 64, self.view.frame.size.width, 500), style: UITableViewStyle.Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        self.view.addSubview(tableView!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    //MARK: - UITableViewDelegate, UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1000
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "TableViewCell"
        var cell: TableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? TableViewCell
        if cell == nil {
            cell = TableViewCell(style: .Default, reuseIdentifier: identifier)
        }
        cell!.imageV.image = UIImage(named: "🐦.jpg")
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
         return 100
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(UICollectionViewCell), forIndexPath: indexPath)
        cell.backgroundColor = UIColor.grayColor()
        
        var label = cell.viewWithTag(10) as? UILabel
        if label == nil {
            label = UILabel()
            label?.tag = 10
            cell.contentView.addSubview(label!)
        }
        
        label!.text = String(indexPath.item)
        label!.sizeToFit()
        
        return cell
    }
    
}


extension ViewController: WaterFallFlowLayoutDelegate {
    func waterflowLayout(waterFallFlowLayout: WaterFallFlowLayout, heigtForItemAtIndex: Int, itemWidth: CGFloat) -> CGFloat {
        
        let item = items[heigtForItemAtIndex]
        let height = itemWidth * item.h / item.w
        
        return height
    }
}
