//
//  IG01ViewController.swift
//  DemoApp
//
//  Created by 倪申雷 on 2021/3/22.
//

import UIKit
import IGListKit
import SnapKit

class IG01ViewController: UIViewController {

    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var data: [Any] = [
        "Maecenas faucibus mollis interdum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.",
        GridItem(color: UIColor(red: 237 / 255.0, green: 73 / 255.0, blue: 86 / 255.0, alpha: 1), itemCount: 6),
        User(pk: 2, name: "Ryan Olson", handle: "ryanolsonk"),
        "Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
        User(pk: 4, name: "Oliver Rickard", handle: "ocrickard"),
        GridItem(color: UIColor(red: 56 / 255.0, green: 151 / 255.0, blue: 240 / 255.0, alpha: 1), itemCount: 5),
        "Nullam quis risus eget urna mollis ornare vel eu leo. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.",
        User(pk: 3, name: "Jesse Squires", handle: "jesse_squires"),
        GridItem(color: UIColor(red: 112 / 255.0, green: 192 / 255.0, blue: 80 / 255.0, alpha: 1), itemCount: 3),
        "Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.",
        GridItem(color: UIColor(red: 163 / 255.0, green: 42 / 255.0, blue: 186 / 255.0, alpha: 1), itemCount: 7),
        User(pk: 1, name: "Ryan Nystrom", handle: "_ryannystrom")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }

}

extension IG01ViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        data.map { $0 as! ListDiffable }
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is String:   return ExpandableSectionController()
        case is GridItem: return GridSectionController(isReorderable: true)
        default:          return UserSectionController(isReorderable: true)
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        nil
    }
    
}
