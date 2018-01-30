import Foundation

public class ItemUpdater {
    let item: Item

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
