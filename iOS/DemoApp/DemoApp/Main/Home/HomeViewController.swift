//
//  HomeViewController.swift
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/12.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    enum SubDemo: String, CaseIterable {
        case bufferOverflow = "01-BufferOverflow"
        
        var vc: UIViewController {
            switch self {
            case .bufferOverflow:
                return BufferOverflowVC()
            }
        }
        
    }
    
    let homeCellID = "homeCellID"
    
    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: homeCellID)
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "首页"
        configUI()
    }
    
    func configUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SubDemo.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellID)
        cell?.textLabel?.text = SubDemo.allCases[indexPath.section].rawValue
        return cell!
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let targetVC = SubDemo.allCases[indexPath.section].vc
        targetVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(targetVC, animated: true)
    }
    
}
