//
//  MainViewController.swift
//  SwiftDemo
//
//  Created by kang on 2018/4/3.
//  Copyright © 2018年 kang. All rights reserved.
//

import UIKit

class MainViewController: KViewController,UITableViewDelegate,UITableViewDataSource{

    var tableView: UITableView!
    
    var dataArray:[Any] = []
    var sectionArray:[Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setData()
        self.setSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setSubviews () {
        //初始化tableView
        self.tableView = UITableView(frame:self.view.frame)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier:"HomeCell")
        self.tableView.register(KSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: "SectionView")
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.view.addSubview(self.tableView)
    }
    
    func setData() {
       
        let primaryModel = SectionModel()
        primaryModel.title = "基础控件"
        primaryModel.isExpand = false
        primaryModel.dataArray = ["UILabel",
                            "UITextField",
                            "UITextView",
                            "UISearchBar",
                            "UIScrollView",
                            "UITableView",
                            "UICollectionView",
                            "UIImageView",
                            "UISliderView",
                            "UIDatePicker",
                            "UIPickerView",
                            "UISwitchView",
                            "ProgressView",
                            "UISegmentControl"
                            ]
        
        let intermediateModel = SectionModel()
        intermediateModel.title = "中级功能"
        intermediateModel.isExpand = false
        intermediateModel.dataArray = ["UILabel",
                                  "UITextField",
                                  "UITextView",
                                  "UISearchBar",
                                  "UIScrollView",
                                  "UITableView",
                                  "UICollectionView",
                                  "UIImageView",
                                  "UISliderView",
                                  "UIDatePicker",
                                  "UIPickerView",
                                  "UISwitchView",
                                  "ProgressView",
                                  "UISegmentControl"
                                  ]
       
        
        let seniorModel = SectionModel()
        seniorModel.title = "高级功能"
        seniorModel.isExpand = false
        seniorModel.dataArray = ["UILabel",
                                  "UITextField",
                                  "UITextView",
                                  "UISearchBar",
                                  "UIScrollView",
                                  "UITableView",
                                  "UICollectionView",
                                  "UIImageView",
                                  "UISliderView",
                                  "UIDatePicker",
                                  "UIPickerView",
                                  "UISwitchView",
                                  "ProgressView",
                                  "UISegmentControl"
                                  ]
        
        self.sectionArray.append(primaryModel)
        self.sectionArray.append(intermediateModel)
        self.sectionArray.append(seniorModel)
        
    }
    
    
    //MARK:tableView 代理方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionArray.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.sectionArray[section] as! SectionModel).isExpand == false ? 0 : (self.sectionArray[section] as! SectionModel).dataArray.count;
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40;
    }
    
    func tableView(_ talbeView:UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = talbeView.dequeueReusableHeaderFooterView(withIdentifier: "SectionView") as! KSectionHeaderView
        let model = self.sectionArray[section] as! SectionModel
        header.setModel(model: model)
        header.block = { () -> () in
            talbeView.reloadSections([section], with: UITableViewRowAnimation.fade)
        }
        
        return header;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell")
        let model = self.sectionArray[indexPath.section] as! SectionModel
        cell?.textLabel?.text = model.dataArray[indexPath.row]
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView(tableView, didDeselectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }

}
