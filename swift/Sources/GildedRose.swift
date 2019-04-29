public class GildedRose {

    var items: [Item]

    required public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {

        for i in 0..<items.count {
            let item = items[i]
            let itemUpdater = ItemUpdaterFactory.createWith(item: item)
            itemUpdater.update(item: item)
        }
    }
}
