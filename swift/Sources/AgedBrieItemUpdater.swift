//
// Created by Naudé Cruywagen on 2019-04-29.
//

import Foundation

class AgedBrieItemUpdater: ItemUpdaterType {
    func decreaseQualityIfItemExpired(item: Item) {
        if (item.sellIn < 0) {
            if (item.quality < 50) {
                item.quality = item.quality + 1
            }
        }
    }

    func decreaseSellIn(item: Item) {
        item.sellIn = item.sellIn - 1
    }

    func updateQuality(with item: Item) {
        if (item.quality < 50) {
            item.quality = item.quality + 1
        }
    }
}

