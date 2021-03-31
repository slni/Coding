//
//  BufferOverflowVC.swift
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/12.
//

import UIKit

class BufferOverflowVC: UIViewController {
    
    lazy var mockSpo2Button: UIButton = {
        $0.setTitle("计算spo2", for: .normal)
        $0.backgroundColor = .red
        $0.setTitleColor(.white, for: .normal)
        $0.setTitleColor(.red, for: .highlighted)
        $0.addTarget(self, action: #selector(mockSpo2), for: .touchUpInside)
        return $0
    }(UIButton())
    
    lazy var mockAScanButton: UIButton = {
        $0.setTitle("AScan", for: .normal)
        $0.addTarget(self, action: #selector(mockAScan), for: .touchUpInside)
        return $0
    }(UIButton())
    
    lazy var mockTScanButton: UIButton = {
        $0.setTitle("TScan", for: .normal)
        $0.addTarget(self, action: #selector(mockTScan), for: .touchUpInside)
        return $0
    }(UIButton())
    
    lazy var mockUBScanButton: UIButton = {
        $0.setTitle("UBScan", for: .normal)
        $0.addTarget(self, action: #selector(mockUBScan), for: .touchUpInside)
        return $0
    }(UIButton())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Buffer overflow"
        configUI()
    }
    
    func configUI() {
        view.addSubview(mockSpo2Button)
        mockSpo2Button.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(100)
            make.left.equalTo(view.snp.left).offset(20)
        }
        
        [mockAScanButton, mockTScanButton, mockUBScanButton].forEach {
            $0.backgroundColor = .yellow
            $0.setTitleColor(.black, for: .normal)
            $0.setTitleColor(.yellow, for: .highlighted)
        }
        
        view.addSubview(mockAScanButton)
        mockAScanButton.snp.makeConstraints { (make) in
            make.top.equalTo(mockSpo2Button.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
        }
        view.addSubview(mockTScanButton)
        mockTScanButton.snp.makeConstraints { (make) in
            make.top.equalTo(mockAScanButton.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
        }
        view.addSubview(mockUBScanButton)
        mockUBScanButton.snp.makeConstraints { (make) in
            make.top.equalTo(mockTScanButton.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
        }
    
    }
    
    @objc func mockSpo2() {
        //doSpo2Algo()
        
        OverflowUnderflowOfBuffers.test()
    }
    
    @objc func mockAScan() {
        RuntimeSanitizationMock.addressSanitizer()
    }
    
    @objc func mockTScan() {
        RuntimeSanitizationMock.threadSanitizer()
    }
    
    @objc func mockUBScan() {
        RuntimeSanitizationMock.undefinedBehaviorSanitizer()
    }

}
