//
//  CollectionCellExtension.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/15.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    
    /// 預設 reuse 用的唯一辨識 id
    static var defaultReuseId: String {
        return String(describing: self)
    }
    
    /// 預設 cell 的 nib
    static var defaultNib: UINib {
        return UINib(nibName: defaultReuseId, bundle: nil)
    }
}
