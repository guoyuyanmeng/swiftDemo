//
//  KSectionHeaderView.swift
//  SwiftDemo
//
//  Created by kang on 2018/4/3.
//  Copyright © 2018年 kang. All rights reserved.
//

import UIKit

typealias SectionExpandCallback = ()->()

class KSectionHeaderView: UITableViewHeaderFooterView {
    
    var bgView : UIView!
    var titleLabel : UILabel!
    var sectionBtn : UIButton!
    var isExpand : Bool!
    var _model: SectionModel!
    var block:SectionExpandCallback?
    
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
        
        self.bgView.frame = self.bounds
        self.bgView.backgroundColor = UIColor(red:0.7 ,green:0.6 ,blue:0.3 ,alpha:1.0)
        self.titleLabel.frame = CGRect(x:15.0,y:10.0,width:self.frame.size.width - 60,height:self.frame.size.height - 20.0)
        let _h: CGFloat = 40.0
        let _x: CGFloat = self.frame.size.width - _h - 10
        let _y: CGFloat = (self.frame.size.height - _h)/2
        let _w: CGFloat = _h
        self.sectionBtn.frame = CGRect(x:_x,y:_y,width:_w,height:_h)
        self.sectionBtn.imageRect(forContentRect: CGRect(x:5,y:5,width:30,height:30))
    }
    
    
    func setModel(model:SectionModel) {
        if _model != model {
            _model = model
        }
        
        self.titleLabel.text = model.title
        
        if _model.isExpand! {
            self.sectionBtn.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        }else {
            self.sectionBtn.transform = CGAffineTransform.identity
        }
        
    }
    
    
    @objc func sectionBtnClicked (_ sender:UIButton) {
        self._model.isExpand = !self._model.isExpand!
        self.block!()
        
        if _model.isExpand! {
            self.sectionBtn.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        }else {
            self.sectionBtn.transform = CGAffineTransform.identity
        }
        
        
        
    }

}
