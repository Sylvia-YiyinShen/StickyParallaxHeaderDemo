//
//  ViewController.swift
//  StickeyParallaxHeaderDemo
//
//  Created by Yiyin Shen on 17/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var myHeaderView: MyHeaderView?
    private var tableViewTopInset: CGFloat = 300

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "MyTableCell", bundle: .main), forCellReuseIdentifier: "MyTableCell")
        
        tableView.contentInset = UIEdgeInsets(top: tableViewTopInset, left: 0, bottom: 0, right: 0)
        myHeaderView = UINib(nibName: "MyHeaderView", bundle: .main).instantiate(withOwner: nil, options: nil).first as? MyHeaderView
        view.addSubview(myHeaderView!)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var height = tableViewTopInset
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            height = 300 + (window?.safeAreaInsets.top ?? CGFloat(0))
        }
        myHeaderView?.configure(minHeight: 150, maxHeight: height, scrollView: tableView)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        myHeaderView?.scrollViewDidScroll(scrollView)
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        myHeaderView?.scrollViewDidEndDragging(scrollView)
    }
}
