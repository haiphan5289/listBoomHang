//
//  HomeScreenVC.swift
//  ListBoomHang
//
//  Created by MacbookPro on 4/24/20.
//  Copyright © 2020 MacbookPro. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SVProgressHUD
import SnapKit

class HomeScreenVC: UIViewController {

    private let tableView: UITableView = UITableView(frame: .zero, style: .grouped)
    override func viewDidLoad() {
        super.viewDidLoad()
        visualize()
    }
    private func visualize() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeScreenCell.nib, forCellReuseIdentifier: HomeScreenCell.identifier)
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }

}
extension HomeScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
}
extension HomeScreenVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeScreenCell.identifier) as! HomeScreenCell
//        cell.backgroundColor = .red
        return cell
    }
}
