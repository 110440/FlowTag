//
//  FlowTagView.swift
//  FlowTag
//
//  Created by tanson on 16/6/22.
//  Copyright © 2016年 tanson. All rights reserved.
//

import UIKit

class FlowTagView: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    var dataCount:Int = 0
    var cornerRadius:CGFloat = 15
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let layout = FlowTagLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        self.collectionViewLayout = layout
        self.registerClass(FlowTagCell.self, forCellWithReuseIdentifier: "cell")
        self.dataSource = self
        self.delegate = self
    }
    
    override func intrinsicContentSize() -> CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIViewNoIntrinsicMetric, height: self.contentSize.height )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size = self.contentSize
    }
    
    private var tagNameForIndexBlock: ( (index:Int)->String )?
    func setBlockForTagName(block: (index:Int)->String ){
        self.tagNameForIndexBlock = block
    }

    func reloadData(tagCout:Int){
        self.dataCount = tagCout
        self.reloadData()
    }
    
    ////
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCount
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! FlowTagCell
        cell.tagName.text = self.tagNameForIndexBlock?(index:indexPath.row) ?? " "
        cell.tagName.layer.cornerRadius = cornerRadius
        return cell
    }
    
    
    lazy private var templateCell:FlowTagCell = {
        let cell = FlowTagCell(frame: CGRect.zero)
        return cell
    }()
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        self.templateCell.tagName.text = self.tagNameForIndexBlock?(index:indexPath.row) ?? " "
        let size = self.templateCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        return CGSize(width: size.width + 15, height: size.height + 10)
    }
}

private class FlowTagCell: UICollectionViewCell {
    
    var tagName:UILabel = {
        let lab = UILabel()
        lab.textAlignment = .Center
        //lab.layer.cornerRadius = 10
        lab.layer.borderColor = UIColor.blueColor().CGColor
        lab.layer.borderWidth = 2
        lab.clipsToBounds = true
        lab.translatesAutoresizingMaskIntoConstraints = false
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.tagName)
        self.initConstraints()
    }
    
    func initConstraints(){
        contentView.addConstraint(NSLayoutConstraint(item: tagName, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: tagName, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: tagName, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1, constant: 0))
        contentView.addConstraint(NSLayoutConstraint(item: tagName, attribute: .Bottom, relatedBy: .Equal, toItem: contentView, attribute: .Bottom, multiplier: 1, constant: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
