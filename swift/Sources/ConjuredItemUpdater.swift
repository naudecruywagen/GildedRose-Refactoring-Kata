//
// Created by Naudé Cruywagen on 2019-04-29.
//

import Foundation

class ConjuredItemUpdater: ItemUpdaterType {
    func updateQuality(of item: Item) {
        decreaseQuality(of: item)
        decreaseQuality(of: item)
    }
}
