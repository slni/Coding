//
//  BufferOverflowVC.swift
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/12.
//

import UIKit

class BufferOverflowVC: UIViewController {
    
    lazy var mockAButton: UIButton = {
        $0.setTitle("计算spo2", for: .normal)
        $0.backgroundColor = .red
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(.red, for: .highlighted)
        $0.addTarget(self, action: #selector(mockA), for: .touchUpInside)
        return $0
    }(UIButton())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Buffer overflow"
        configUI()
    }
    
    func configUI() {
        view.addSubview(mockAButton)
        mockAButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(100)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    @objc func mockA() {
        doSpo2Algo()
    }

}
