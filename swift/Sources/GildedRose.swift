public class GildedRose {

    static let AgedBrie = "Aged Brie"
    static let BackstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    static let Sulfuras = "Sulfuras, Hand of Ragnaros"
    static let Conjured = "Conjured"

    var items: [Item]

    required public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {

        for i in 0..<items.count {
            let item = items[i]
            let itemUpdater = ItemUpdater.updater(with: item)
            itemUpdater.updateItem()
        }
    }

}
