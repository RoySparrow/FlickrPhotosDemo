//
//  SearchResultCollectionCell.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/15.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import UIKit

protocol SearchResultCollectionCellDelegate: class {
    
    /// 通知 delegate，使用者點擊了收藏圖片
    func searchResultCollectionCellDidTapFavorite(_ cell: SearchResultCollectionCell)
}

class SearchResultCollectionCell: UICollectionViewCell {

    weak var delegate: SearchResultCollectionCellDelegate? = nil
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgNameLbl: UILabel!
    @IBOutlet weak var favoriteBtn: UIButton!
    
    @IBAction func favoriteBtnTapped(_ sender: UIButton) {
        delegate?.searchResultCollectionCellDidTapFavorite(self)
    }
    
    deinit {
        Logger.log(message: "已釋放")
    }
}
