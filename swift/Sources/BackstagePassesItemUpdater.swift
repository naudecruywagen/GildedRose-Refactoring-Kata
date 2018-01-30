import Foundation

class BackstagePassesItemUpdater {
    private var item: Item

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

            if (item.name == GildedRose.BackstagePasses) {
                if (item.sellIn < 11) {
                    if (item.quality < 50) {
                        item.quality = item.quality + 1
                    }
                }

                if (item.sellIn < 6) {
                    if (item.quality < 50) {
                        item.quality = item.quality + 1
                    }
                }
            }
        }
    }

    func decreaseSellIn(item: Item) {
        item.sellIn = item.sellIn - 1
    }

    func updateQualityIfExpired(item: Item) {
        if (item.sellIn < 0) {
            item.quality = item.quality - item.quality
        }
    }
}
