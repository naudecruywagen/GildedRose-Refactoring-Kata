
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
        if (item.name != GildedRose.AgedBrie && item.name != GildedRose.BackstagePasses) {
            if (item.quality > 0) {
                if (item.name != GildedRose.Sulfuras) {
                    item.quality = item.quality - 1
                }
            }
        } else {
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
    }

    func decreaseSellIn(item: Item) {
        if (item.name != GildedRose.Sulfuras) {
            item.sellIn = item.sellIn - 1
        }
    }
    
    func updateQualityIfExpired(item: Item) {
        if (item.sellIn < 0) {
            if (item.name != GildedRose.AgedBrie) {
                if (item.name != GildedRose.BackstagePasses) {
                    if (item.quality > 0) {
                        if (item.name != GildedRose.Sulfuras) {
                            item.quality = item.quality - 1
                        }
                    }
                } else {
                    item.quality = item.quality - item.quality
                }
            } else {
                if (item.quality < 50) {
                    item.quality = item.quality + 1
                }
            }
        }
    }
}
