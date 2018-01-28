import Foundation

class AgedBrieItemUpdater: ItemUpdater {

    override func updateQualityIfExpired(item: Item) {
        if (item.sellIn < 0) {
            if (item.quality < 50) {
                item.quality = item.quality + 1
            }
        }
    }

    override func decreaseQuality(item: Item) {
        if (item.quality < 50) {
            item.quality = item.quality + 1
        }
    }

}
