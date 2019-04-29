//
// Created by Naudé Cruywagen on 2019-04-29.
//

import Foundation

class ItemUpdater {
    static let agedBrie = "Aged Brie"
    static let backstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    static let sulfuras = "Sulfuras, Hand of Ragnaros"

    class func createWith(item: Item) -> ItemUpdater {
        let itemUpdater: ItemUpdater
        switch item.name {
        case agedBrie:
            itemUpdater = AgedBrieItemUpdater()
        default:
            itemUpdater = ItemUpdater()
        }
        return itemUpdater
    }

    func update(item: Item) {
        doSomething(with: item)
        decreaseSellInIfNotSulfuras(item: item)
        doSomethingIfItemExpired(item: item)
    }

    public func doSomethingIfItemExpired(item: Item) {
        if (item.sellIn < 0) {
            if (item.name != ItemUpdater.backstagePasses) {
                if (item.quality > 0) {
                    if (item.name != ItemUpdater.sulfuras) {
                        item.quality = item.quality - 1
                    }
                }
            } else {
                item.quality = item.quality - item.quality
            }
        }
    }

    public func decreaseSellInIfNotSulfuras(item: Item) {
        if (item.name != ItemUpdater.sulfuras) {
            item.sellIn = item.sellIn - 1
        }
    }

    public func doSomething(with item: Item) {
        if (item.name != ItemUpdater.backstagePasses) {
            if (item.quality > 0) {
                if (item.name != ItemUpdater.sulfuras) {
                    item.quality = item.quality - 1
                }
            }
        } else {
            if (item.quality < 50) {
                item.quality = item.quality + 1

                if (item.name == ItemUpdater.backstagePasses) {
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
    }
}
