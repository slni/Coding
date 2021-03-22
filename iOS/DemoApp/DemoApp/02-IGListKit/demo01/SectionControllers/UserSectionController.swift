/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import IGListKit
import UIKit

final class User: ListDiffable {

    let pk: Int
    let name: String
    let handle: String

    init(pk: Int, name: String, handle: String) {
        self.pk = pk
        self.name = name
        self.handle = handle
    }

    // MARK: ListDiffable

    func diffIdentifier() -> NSObjectProtocol {
        return pk as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? User else { return false }
        return name == object.name && handle == object.handle
    }

}


final class UserSectionController: ListSectionController {

    private var user: User?
    private let isReorderable: Bool

    required init(isReorderable: Bool = false) {
        self.isReorderable = isReorderable
        super.init()
    }

    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell: DetailLabelCell = collectionContext?.dequeueReusableCell(for: self, at: index) else {
            fatalError()
        }
        cell.title = user?.name
        cell.detail = "@" + (user?.handle ?? "")
        cell.contentView.backgroundColor = UIColor.green
        return cell
    }

    override func didUpdate(to object: Any) {
        self.user = object as? User
    }

    override func canMoveItem(at index: Int) -> Bool {
        return isReorderable
    }
}
