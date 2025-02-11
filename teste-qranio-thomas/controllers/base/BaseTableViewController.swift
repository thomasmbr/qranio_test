//
//  BaseTableViewController.swift
//  teste-qranio-thomas
//
//  Created by Thomás Marques Brandão Reis on 06/03/19.
//  Copyright © 2019 Thomás Marques Brandão Reis. All rights reserved.
//

import UIKit

protocol UIBaseTableViewProtocol {
    func loadData()
}

class UIBaseTableViewController: UITableViewController, UIBaseTableViewProtocol {
    
    let loadingView = UIView()
    let spinner = UIActivityIndicatorView()
    let loadingLabel = UILabel()
    
    func loadData() {}
    
    func startLoading() {
        let width: CGFloat = 120
        let height: CGFloat = 30
        let x = (tableView.frame.width / 2) - (width / 2)
        let y = (tableView.frame.height / 2) - (height / 2) - (navigationController?.navigationBar.frame.height)!
        loadingView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        loadingLabel.textColor = .gray
        loadingLabel.textAlignment = .center
        loadingLabel.text = Constants.LOADING
        loadingLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
        loadingLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 30)
        
        spinner.style = .gray
        spinner.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        spinner.startAnimating()
        
        loadingView.addSubview(spinner)
        loadingView.addSubview(loadingLabel)
        
        tableView.addSubview(loadingView)
    }
    
    func stopLoading() {
        spinner.stopAnimating()
        spinner.isHidden = true
        loadingLabel.isHidden = true
    }
    
    func show(message: String) {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        let messageLabel = UILabel(frame: rect)
        messageLabel.text = message
        messageLabel.textColor = .gray
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
        messageLabel.sizeToFit()
        
        self.tableView.backgroundView = messageLabel;
        self.tableView.separatorStyle = .none;
    }
    
}
