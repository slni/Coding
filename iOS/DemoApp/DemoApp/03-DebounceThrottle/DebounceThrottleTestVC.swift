//
//  DebounceThrottleTestVC.swift
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/31.
//

import UIKit

class DebounceThrottleTestVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
    }
    
    func bar(bar: String) {
        print("Bar", bar)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("点击了屏幕")
        let queue = DispatchQueue.global(qos: .background)
        
        // throttle
//        let fn = throttle1(delay: 0.4, queue: queue, action: bar)
//        for i in 0...9 {
//            print("index=\(i)")
//            fn("你好\(i)")
//            Thread.sleep(forTimeInterval: 0.2)
//        }
        
        // debounce
        let fn11 = debounce1(delay: .seconds(1), queue: queue, action: bar)
        for i in 0...9 {
            print("index=\(i)")
            fn11("你好\(i)")
            Thread.sleep(forTimeInterval: 0.01)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
