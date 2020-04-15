//
//  SearchViewController.swift
//  FlickrPhotosDemo
//
//  Created by Roy Sparrow on 2020/4/13.
//  Copyright © 2020 SparrowStudio. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextInputField: UITextField!
    @IBOutlet weak var amountPerPageInputField: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBAction func searchBtnTapped(_ sender: UIButton) {
        pushToSearchResultVC()
    }
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        if !String.isEmptyOrNil(searchTextInputField.text) && !String.isEmptyOrNil(amountPerPageInputField.text) {
            setSearchBtnTappable(true)
        } else {
            setSearchBtnTappable(false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        dismissKeyboard()
    }
    
    private func initLayout() {
        searchTextInputField.text = ""
        searchTextInputField.delegate = self
        amountPerPageInputField.text = ""
        amountPerPageInputField.delegate = self
        setSearchBtnTappable(false)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    /// 設定搜尋按鈕可不可以點擊
    /// - Parameter isTappable: 可不可以點擊
    private func setSearchBtnTappable(_ isTappable: Bool) {
        if isTappable {
            searchBtn.isUserInteractionEnabled = true
            searchBtn.backgroundColor = .systemBlue
        } else {
            searchBtn.isUserInteractionEnabled = false
            searchBtn.backgroundColor = .systemGray
        }
    }
    
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func pushToSearchResultVC() {
        let resultVC = SearchResultViewController.instantiate()
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    deinit {
        Logger.log(message: "已釋放")
    }
}

extension SearchViewController: StoryboardInstantiable {}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case searchTextInputField:
            amountPerPageInputField.becomeFirstResponder()
        case amountPerPageInputField:
            amountPerPageInputField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
