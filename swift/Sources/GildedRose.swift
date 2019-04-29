public class GildedRose {
    static let agedBrie = "Aged Brie"
    static let backstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    static let sulfuras = "Sulfuras, Hand of Ragnaros"

    var items: [Item]

    required public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {

        for i in 0..<items.count {
            let item = items[i]
            let itemUpdater = ItemUpdater.createWith(item: item)
            itemUpdater.doSomething(with: item)
            itemUpdater.decreaseSellInIfNotSulfuras(item: item)
            itemUpdater.doSomethingIfItemExpired(item: item)
        }
    }
}
