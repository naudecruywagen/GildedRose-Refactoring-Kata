//
// Created by Naudé Cruywagen on 2019-04-29.
//

import Foundation

class AgedBrieItemUpdater: ItemUpdaterType {
    public func doSomethingIfItemExpired(item: Item) {
        if (item.sellIn < 0) {
            if (item.quality < 50) {
                item.quality = item.quality + 1
            }
        }
    }

    public func decreaseSellInIfNotSulfuras(item: Item) {
        if (item.name != ItemUpdaterFactory.sulfuras) {
            item.sellIn = item.sellIn - 1
        }
    }

    public func doSomething(with item: Item) {
        if (item.quality < 50) {
            item.quality = item.quality + 1
        }
    }
}

