//
// Created by Naudé Cruywagen on 2019-04-29.
//

import Foundation

class AgedBrieItemUpdater: ItemUpdater {
    public override func doSomethingIfItemExpired(item: Item) {
        if (item.sellIn < 0) {
            if (item.quality < 50) {
                item.quality = item.quality + 1
            }
        }
    }

    public override func decreaseSellInIfNotSulfuras(item: Item) {
        if (item.name != ItemUpdater.sulfuras) {
            item.sellIn = item.sellIn - 1
        }
    }

    override public func doSomething(with item: Item) {
        if (item.quality < 50) {
            item.quality = item.quality + 1
        }
    }
}

