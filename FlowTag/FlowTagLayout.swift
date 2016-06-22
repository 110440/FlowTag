//
//  FlowTagLayout.swift
//  FlowTag
//
//  Created by tanson on 16/6/22.
//  Copyright © 2016年 tanson. All rights reserved.
//

import UIKit

class FlowTagLayout: UICollectionViewFlowLayout {

    
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard let layoutAttributes = super.layoutAttributesForElementsInRect(rect) else { return [] }
        if layoutAttributes.count == 1 { return layoutAttributes }
        
        let lineSpace:CGFloat = self.minimumLineSpacing
        let itemSpace:CGFloat = self.minimumInteritemSpacing
 
        
        for index in 1..<(layoutAttributes.count) {
            
            let curLayoutAtt = layoutAttributes[index]
            let preLayoutAtt = layoutAttributes[index - 1]
            
            let curX = preLayoutAtt.frame.maxX
            if  (curX + itemSpace + curLayoutAtt.frame.width) <= (self.collectionView!.frame.width - self.sectionInset.right){
                curLayoutAtt.frame.origin.x = curX + itemSpace
                curLayoutAtt.frame.origin.y = preLayoutAtt.frame.origin.y
            }else{
                curLayoutAtt.frame.origin.x = self.sectionInset.left
                curLayoutAtt.frame.origin.y = preLayoutAtt.frame.origin.y + preLayoutAtt.frame.height + lineSpace
            }
        }

        return layoutAttributes
    }
    
}
