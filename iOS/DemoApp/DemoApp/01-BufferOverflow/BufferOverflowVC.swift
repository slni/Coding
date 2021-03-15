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
    
    lazy var mockB1Button: UIButton = {
        $0.setTitle("test1", for: .normal)
        $0.addTarget(self, action: #selector(test1), for: .touchUpInside)
        return $0
    }(UIButton())
    
    lazy var mockB2Button: UIButton = {
        $0.setTitle("test2", for: .normal)
        $0.addTarget(self, action: #selector(test2), for: .touchUpInside)
        return $0
    }(UIButton())
    
    lazy var mockB3Button: UIButton = {
        $0.setTitle("test3", for: .normal)
        $0.addTarget(self, action: #selector(test3), for: .touchUpInside)
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
            make.left.equalTo(view.snp.left).offset(20)
        }
        
        [mockB1Button, mockB2Button, mockB3Button].forEach {
            $0.backgroundColor = .yellow
            $0.setTitleColor(.black, for: .normal)
            $0.setTitleColor(.yellow, for: .highlighted)
        }
        
        view.addSubview(mockB1Button)
        mockB1Button.snp.makeConstraints { (make) in
            make.top.equalTo(mockAButton.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
        }
        view.addSubview(mockB2Button)
        mockB2Button.snp.makeConstraints { (make) in
            make.top.equalTo(mockB1Button.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
        }
        view.addSubview(mockB3Button)
        mockB3Button.snp.makeConstraints { (make) in
            make.top.equalTo(mockB2Button.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
        }
    
    }
    
    @objc func mockA() {
        doSpo2Algo()
    }
    
    @objc func test1() {
        test1_AddressSanitizer()
    }
    
    @objc func test2() {
        test2_LeakSanitizer()
    }
    
    @objc func test3() {
        SanitizersOCBridge.test3_MemorySanitizer()
    }

}
