public class AgedBrieItemUpdater {

    let item: Item

    init(item: Item) {
        self.item = item
    }

    func updateItem() {
        updateQuality(item: item)
        decreaseSellIn(item: item)
        updateQualityIfExpired(item: item)
    }

    func updateQuality(item: Item) {
        if (item.quality < 50) {
            item.quality = item.quality + 1
        }
    }

    func decreaseSellIn(item: Item) {
        item.sellIn = item.sellIn - 1
    }

    func updateQualityIfExpired(item: Item) {
        if (item.sellIn < 0) {
            if (item.quality < 50) {
                item.quality = item.quality + 1
            }
        }
    }
}
