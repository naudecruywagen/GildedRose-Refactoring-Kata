//
// Created by Naudé Cruywagen on 2019-04-29.
//

import Foundation

protocol ItemUpdater {
    func update(item: Item)
}

protocol ItemUpdatePerformer {
    func doSomethingIfItemExpired(item: Item)
    func decreaseSellInIfNotSulfuras(item: Item)
    func doSomething(with item: Item)
}

typealias ItemUpdaterType = ItemUpdater & ItemUpdatePerformer

extension ItemUpdater where Self: ItemUpdatePerformer {

    func update(item: Item) {
        doSomething(with: item)
        decreaseSellInIfNotSulfuras(item: item)
        doSomethingIfItemExpired(item: item)
    }

    func doSomethingIfItemExpired(item: Item) {
        if (item.sellIn < 0) {
            if (item.name != ItemUpdaterFactory.backstagePasses) {
                if (item.quality > 0) {
                    if (item.name != ItemUpdaterFactory.sulfuras) {
                        item.quality = item.quality - 1
                    }
                }
            } else {
                item.quality = item.quality - item.quality
            }
        }
    }

    func decreaseSellInIfNotSulfuras(item: Item) {
        if (item.name != ItemUpdaterFactory.sulfuras) {
            item.sellIn = item.sellIn - 1
        }
    }

    func doSomething(with item: Item) {
        if (item.name != ItemUpdaterFactory.backstagePasses) {
            if (item.quality > 0) {
                if (item.name != ItemUpdaterFactory.sulfuras) {
                    item.quality = item.quality - 1
                }
            }
        } else {
            if (item.quality < 50) {
                item.quality = item.quality + 1

                if (item.name == ItemUpdaterFactory.backstagePasses) {
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

class ItemUpdaterFactory: ItemUpdaterType {

    static let agedBrie = "Aged Brie"
    static let backstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    static let sulfuras = "Sulfuras, Hand of Ragnaros"

    class func createWith(item: Item) -> ItemUpdater {
        let itemUpdater: ItemUpdater
        switch item.name {
        case agedBrie:
            itemUpdater = AgedBrieItemUpdater()
        default:
            itemUpdater = ItemUpdaterFactory()
        }
        return itemUpdater
    }
}
