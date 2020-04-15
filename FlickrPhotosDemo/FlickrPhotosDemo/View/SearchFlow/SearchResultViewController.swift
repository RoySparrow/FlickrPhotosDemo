//
//  SearchResultViewController.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/14.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {

    /// 一行有幾個 cell
    private let cellCountPerLine = 2
    
    /// 每個 cell 的間距
    private let cellOffset: CGFloat = 10
    
    /// 每行的間距
    private let lineOffset: CGFloat = 10
    
    /// cell 的大小
    private lazy var cellSize: CGSize = {
        let cellWidth = (UIScreen.main.bounds.width-cellOffset)/CGFloat(cellCountPerLine)
        let cellHeight = cellWidth*1.5
        return CGSize(width: cellWidth, height: cellHeight)
    }()
    
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCollectionView()
    }
    
    private func initCollectionView() {
        resultCollectionView.delegate = self
        resultCollectionView.dataSource = self
        resultCollectionView.register(SearchResultCollectionCell.defaultNib, forCellWithReuseIdentifier: SearchResultCollectionCell.defaultReuseId)
    }
    
    deinit {
        Logger.log(message: "已釋放")
    }
}

extension SearchResultViewController: StoryboardInstantiable {}

extension SearchResultViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellOffset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineOffset
    }
}

extension SearchResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionCell.defaultReuseId, for: indexPath) as! SearchResultCollectionCell
        cell.delegate = self
        return cell
    }
}

extension SearchResultViewController: SearchResultCollectionCellDelegate {
    func searchResultCollectionCellDidTapFavorite(_ cell: SearchResultCollectionCell) {
        
    }
}
