import Foundation

class ItemUpdater {

    static let AgedBrie = "Aged Brie"
    static let Sulfuras = "Sulfuras, Hand of Ragnaros"
    static let BackstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    static let Conjured = "Conjured"

    public var item: Item?

    class func updaterWith(item: Item) -> ItemUpdater {
        var itemUpdater = ItemUpdater(item: item)
        if item.name == ItemUpdater.AgedBrie {
            itemUpdater = AgedBrieItemUpdater(item: item)
        } else if item.name == ItemUpdater.Sulfuras {
            itemUpdater = SulfurasItemUpdater(item: item)
        } else if item.name == ItemUpdater.BackstagePasses {
            itemUpdater = BackstagePassesItemUpdater(item: item)
        } else if item.name == ItemUpdater.Conjured {
            itemUpdater = ConjuredItemUpdater(item: item)
        }
        return itemUpdater
    }

    public init(item: Item) {
        self.item = item
    }

    public func updateItem() {
        guard let item = self.item else {
            return
        }
        self.decreaseQuality(item: item)
        self.updateSellIn(item: item)
        self.updateQualityIfExpired(item: item)
    }

    public func updateQualityIfExpired(item: Item) {
        if (item.sellIn < 0) {
            if (item.quality > 0) {
                item.quality = item.quality - 1
            }
        }
    }

    public func updateSellIn(item: Item) {
        item.sellIn = item.sellIn - 1
    }

    public func decreaseQuality(item: Item) {
        if (item.quality > 0) {
            item.quality = item.quality - 1
        }
    }

}
