public class GildedRose {

    static let AgedBrie = "Aged Brie"
    static let BackstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    static let Sulfuras = "Sulfuras, Hand of Ragnaros"

    var items: [Item]

    required public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {

        for i in 0..<items.count {
            let item = items[i]
            switch (item.name) {
            case GildedRose.AgedBrie:
                let agedBrieItemUpdater = AgedBrieItemUpdater(item: item)
                agedBrieItemUpdater.updateItem()
            case GildedRose.BackstagePasses:
                let backstagePassesItemUpdater = BackstagePassesItemUpdater(item: item)
                backstagePassesItemUpdater.updateItem()
            case GildedRose.Sulfuras:
                let sulfurasItemUpdater = SulfurasItemUpdater(item: item)
                sulfurasItemUpdater.updateItem()
            default:
                updateQuality(item: item)
                decreaseSellIn(item: item)
                updateQualityIfExpired(item: item)
            }
        }
    }

    func updateQuality(item: Item) {
        if (item.quality > 0) {
            item.quality = item.quality - 1
        }
    }

    func decreaseSellIn(item: Item) {
        item.sellIn = item.sellIn - 1
    }

    func updateQualityIfExpired(item: Item) {
        if (item.sellIn < 0) {
            if (item.quality > 0) {
                item.quality = item.quality - 1
            }
        }
    }
}
