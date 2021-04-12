//
//  DataRaces.swift
//  DemoApp
//
//  Created by 倪申雷 on 2021/4/9.
//

import UIKit

class DataRaces {
    
    static let shared = DataRaces()
    var message: String?
    var messageIsAvailable: Bool = false
    
    // Executed on Thread #1
    func producer() {
        message = "hello!"
        messageIsAvailable = true
    }
    // Executed on Thread #2
    func consumer() {
        repeat {
            usleep(1000)
        } while !messageIsAvailable
        print(message ?? "nil")
    }
    
    func startTest() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            self.consumer()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            guard let self = self else { return }
            self.producer()
        }
    }

}
