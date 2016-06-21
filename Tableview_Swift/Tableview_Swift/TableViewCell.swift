//
//  TableViewCell.swift
//  Tableview_Swift
//
//  Created by 丰雨 on 16/6/2.
//  Copyright © 2016年 Feng. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var imageV: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let imageView = UIImageView()
        imageV = imageView
        self.addSubview(imageV)
        layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageV.backgroundColor = UIColor.grayColor()
        imageV.frame = CGRectMake(50, 0, 100, 100)
        imageV.contentMode = UIViewContentMode.ScaleToFill
    }
}
