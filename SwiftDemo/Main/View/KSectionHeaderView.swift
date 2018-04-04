//
//  KSectionHeaderView.swift
//  SwiftDemo
//
//  Created by kang on 2018/4/3.
//  Copyright © 2018年 kang. All rights reserved.
//

import UIKit

class KSectionHeaderView: UITableViewHeaderFooterView {
    
    var bgView : UIView!
    var titleLabel : UILabel!
    var sectionBtn : UIButton!
    var isExpand : Bool!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setSubviews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubviews () {
        
        self.bgView = UIView();
        self.bgView.backgroundColor = UIColor(red:0.7 ,green:0.6 ,blue:0.3 ,alpha:1.0)
        self.addSubview(self.bgView)
        
        self.isExpand = false
        // 标题label
        self.titleLabel = UILabel()
        self.addSubview(titleLabel)
        
        // 展开按钮
        self.sectionBtn = UIButton()
        self.sectionBtn.setImage(UIImage(named:"right"), for: UIControlState.normal)
        self.sectionBtn.addTarget(self, action:#selector(sectionBtnClicked(_ :)), for: UIControlEvents.touchUpInside)
        self.addSubview(self.sectionBtn)
    }
    
    
    override func layoutSubviews() {
        
        self.bgView.frame = self.frame
        self.titleLabel.frame = CGRect(x:15.0,y:10.0,width:self.frame.size.width - 60,height:self.frame.size.height - 20.0)
        self.sectionBtn.frame = CGRect(x:self.frame.size.width - self.frame.size.height - 20,y:0,width:self.frame.size.height,height:self.frame.size.height)
    }
    
    
    @objc func sectionBtnClicked (_ sender:UIButton) {
        if isExpand {
            
        }
        
    }

}
