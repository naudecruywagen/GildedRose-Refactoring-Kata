//
// Created by Naudé Cruywagen on 2019-04-29.
//

import Foundation

class BackstagePassesItemUpdater: ItemUpdaterType {
    func decreaseQualityIfItemExpired(item: Item) {
        if (item.sellIn < 0) {
            item.quality = item.quality - item.quality
        }
    }

    func decreaseSellIn(item: Item) {
        item.sellIn = item.sellIn - 1
    }

    func updateQuality(with item: Item) {
        if (item.quality < 50) {
            item.quality = item.quality + 1

            if (item.sellIn < 11) {
                if (item.quality < 50) {
                    item.quality = item.quality + 1
                }
            }

            if (item.sellIn < 6) {
                if (item.quality < 50) {
                    item.quality = item.quality + 1
                }
            }
        }
    }
}
