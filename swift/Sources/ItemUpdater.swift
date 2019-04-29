//
// Created by Naudé Cruywagen on 2019-04-29.
//

import Foundation

protocol ItemUpdater {
    func update(item: Item)
}

protocol ItemUpdatePerformer {
    func decreaseQualityIfItemExpired(item: Item)
    func decreaseSellIn(item: Item)
    func updateQuality(of item: Item)
    func decreaseQuality(of item: Item)
}

typealias ItemUpdaterType = ItemUpdater & ItemUpdatePerformer

extension ItemUpdater where Self: ItemUpdatePerformer {

    func update(item: Item) {
        updateQuality(of: item)
        decreaseSellIn(item: item)
        decreaseQualityIfItemExpired(item: item)
    }

    func decreaseQualityIfItemExpired(item: Item) {
        if (item.sellIn < 0) {
            decreaseQuality(of: item)
        }
    }

    func decreaseSellIn(item: Item) {
        item.sellIn = item.sellIn - 1
    }

    func updateQuality(of item: Item) {
        decreaseQuality(of: item)
    }

    func decreaseQuality(of item: Item) {
        if (item.quality > 0) {
            item.quality = item.quality - 1
        }
    }
}

class ItemUpdaterFactory: ItemUpdaterType {

    static let agedBrie = "Aged Brie"
    static let backstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    static let sulfuras = "Sulfuras, Hand of Ragnaros"
    static let conjured = "Conjured"

    class func createWith(item: Item) -> ItemUpdater {
        let itemUpdater: ItemUpdater
        switch item.name {
        case agedBrie:
            itemUpdater = AgedBrieItemUpdater()
        case backstagePasses:
            itemUpdater = BackstagePassesItemUpdater()
        case sulfuras:
            itemUpdater = SulfurasItemUpdater()
        case conjured:
            itemUpdater = ConjuredItemUpdater()
        default:
            itemUpdater = ItemUpdaterFactory()
        }
        return itemUpdater
    }
}
