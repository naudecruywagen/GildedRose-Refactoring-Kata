public class AgedBrieItemUpdater: ItemUpdater {

    public override func updateQuality(item: Item) {
        if (item.quality < 50) {
            item.quality = item.quality + 1
        }
    }

    public override func decreaseSellIn(item: Item) {
        item.sellIn = item.sellIn - 1
    }

    public override func updateQualityIfExpired(item: Item) {
        if (item.sellIn < 0) {
            if (item.quality < 50) {
                item.quality = item.quality + 1
            }
        }
    }
}
