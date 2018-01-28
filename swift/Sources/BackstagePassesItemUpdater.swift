import Foundation

class BackstagePassesItemUpdater: ItemUpdater {
    override func updateQualityIfExpired(item: Item) {
        if (item.sellIn < 0) {
            item.quality = item.quality - item.quality
        }
    }

    override func decreaseQuality(item: Item) {
        if (item.quality < 50) {
            item.quality = item.quality + 1

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
