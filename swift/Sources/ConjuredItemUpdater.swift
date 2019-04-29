//
// Created by Naudé Cruywagen on 2019-04-29.
//

import Foundation

class ConjuredItemUpdater: ItemUpdaterType {
    func updateQuality(with item: Item) {
        decreaseQuality(of: item)
        decreaseQuality(of: item)
    }
}
