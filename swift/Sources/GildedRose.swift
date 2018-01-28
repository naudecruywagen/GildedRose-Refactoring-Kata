public class GildedRose {

    var items: [Item]

    required public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {

        for i in 0..<items.count {
            let item = items[i] as Item
            let itemUpdater = ItemUpdater.updaterWith(item: item)
            itemUpdater.updateItem()
        }
    }
}
