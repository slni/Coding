//
//  BufferOverflowVC.swift
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/12.
//

import UIKit


class RuntimeSanitizationVC: UIViewController {
    
    enum SubDemo: CaseIterable {
        case separator_as
        case as_UseOfDeallocatedMemory_1
        case as_UseOfDeallocatedMemory_2
        case as_DeallocationOfDeallocatedMemory
        case as_DeallocationOfNonallocatedMemory
        case as_UseOfStackMemoryAfterFunctionReturn
        case as_UseOfOut_of_ScopeStackMemory
        case as_OverflowAndUnderflowOfBuffers
        case as_OverflowOfCPPContainers
        
        case separator_ts
        case ts_DataRaces
        
        case separator_ubs
        case ubs_InvalidFloatCast
        case ubs_DivisionByZero
        case ubs_IntegerOverflow

        func action() {
            switch self {
            case .separator_as:
                print("地址问题检测")
            case .as_UseOfDeallocatedMemory_1:
                UseDeallocatedMemory.useOfDeallocatedMemory()
            case .as_UseOfDeallocatedMemory_2:
                UseDeallocatedMemory.useOfDeallocatedPointer()
            case .as_DeallocationOfDeallocatedMemory:
                DeallocationOfDeallocatedMemory.testInC()
            case .as_DeallocationOfNonallocatedMemory:
                DeallocationOfNonallocatedMemory.test()
            case .as_UseOfStackMemoryAfterFunctionReturn:
                UseStackMemoryAfterFunctionReturn.test()
            case .as_UseOfOut_of_ScopeStackMemory:
                UseOut_of_ScopeStackMemory.test()
            case .as_OverflowAndUnderflowOfBuffers:
                OverflowUnderflowOfBuffers.test()
            case .as_OverflowOfCPPContainers:
                OverflowOfCPPContainers.test()
            case .separator_ts:
                print("线程问题检测")
            case .ts_DataRaces:
                DataRaces.shared.startTest()
            case .separator_ubs:
                print("未定义行为检测")
            case .ubs_InvalidFloatCast:
                InvalidFloatCast.test()
            case .ubs_DivisionByZero:
                DivisionByZero.test()
            case .ubs_IntegerOverflow:
                IntegerOverflow.test()
            }
        }
        
        var title: (String, UIColor) {
            switch self {
            case .separator_as:
                return ("--------地址检测--------", .black)
            case .as_UseOfDeallocatedMemory_1:
                return ("使用了已释放的内存_demo1", .green)
            case .as_UseOfDeallocatedMemory_2:
                return ("使用了已释放的内存_demo2", .green)
            case .as_DeallocationOfDeallocatedMemory:
                return ("释放了已释放的内存", .red)
            case .as_DeallocationOfNonallocatedMemory:
                return ("释放了不是手动分配(alloc)的内存", .red)
            case .as_UseOfStackMemoryAfterFunctionReturn:
                return ("使用了函数返回后被释放的栈内存", .green)
            case .as_UseOfOut_of_ScopeStackMemory:
                return ("使用了超出范围的栈内存", .green)
            case .as_OverflowAndUnderflowOfBuffers:
                return ("缓冲区溢出(上溢和下溢)", .green)
            case .as_OverflowOfCPPContainers:
                return ("C++容器溢出", .green)
            case .separator_ts:
                return ("--------线程检测--------", .black)
            case .ts_DataRaces:
                return ("多线程数据竞争", .green)
            case .separator_ubs:
                return ("--------未定义行为检测--------", .black)
            case .ubs_InvalidFloatCast:
                return ("无效的浮点数投射", .black)
            case .ubs_DivisionByZero:
                return ("0为除数", .red)
            case .ubs_IntegerOverflow:
                return ("Int溢出", .green)
            }
        }
        
        var detailTitle: String {
            switch self {
            case .separator_as:
                return "++++++++++++++++++++++++++++++++"
            case .as_UseOfDeallocatedMemory_1:
                return "使用了已经释放的内存"
            case .as_UseOfDeallocatedMemory_2:
                return "使用了已经释放的指针"
            case .as_DeallocationOfDeallocatedMemory:
                return "同一块内存被释放了多次"
            case .as_DeallocationOfNonallocatedMemory:
                return "释放了一块不需要手动释放的内存, 如栈上的内存"
            case .as_UseOfStackMemoryAfterFunctionReturn:
                return ""
            case .as_UseOfOut_of_ScopeStackMemory:
                return ""
            case .as_OverflowAndUnderflowOfBuffers:
                return "栈区,堆区,全局区 溢出; (上溢出和下溢出)"
            case .as_OverflowOfCPPContainers:
                return ""
            case .separator_ts:
                return "++++++++++++++++++++++++++++++++"
            case .ts_DataRaces:
                return ""
            case .separator_ubs:
                return "++++++++++++++++++++++++++++++++"
            case .ubs_InvalidFloatCast:
                return ""
            case .ubs_DivisionByZero:
                return ""
            case .ubs_IntegerOverflow:
                return ""
            }
        }
        
    }
    
    let cellID = "CellID"
    
    lazy var tableView: UITableView = {
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

extension RuntimeSanitizationVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SubDemo.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let demo = SubDemo.allCases[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = demo.title.0
        cell?.textLabel?.textColor = demo.title.1
        cell?.detailTextLabel?.text = demo.detailTitle
        return cell!
    }
    
}

extension RuntimeSanitizationVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let demo = SubDemo.allCases[indexPath.row]
        print(demo.title.0)
        demo.action()
    }
    
}
