import Foundation

public class ItemUpdater {
    let item: Item

    class func updater(with item: Item) -> ItemUpdater {
        var itemUpdater: ItemUpdater
        switch (item.name) {
        case GildedRose.AgedBrie:
            itemUpdater = AgedBrieItemUpdater(item: item)
        case GildedRose.BackstagePasses:
            itemUpdater = BackstagePassesItemUpdater(item: item)
        case GildedRose.Sulfuras:
            itemUpdater = SulfurasItemUpdater(item: item)
        default:
            itemUpdater = ItemUpdater(item: item)
        }
        return itemUpdater
    }

    init(item: Item) {
        self.item = item
    }

    func updateItem() {
        updateQuality(item: item)
        decreaseSellIn(item: item)
        updateQualityIfExpired(item: item)
    }

    public func updateQuality(item: Item) {
        if (item.quality > 0) {
            item.quality = item.quality - 1
        }
    }

    public func decreaseSellIn(item: Item) {
        item.sellIn = item.sellIn - 1
    }


    public func updateQualityIfExpired(item: Item) {
        if (item.sellIn < 0) {
            if (item.quality > 0) {
                item.quality = item.quality - 1
            }
        }
    }

}
