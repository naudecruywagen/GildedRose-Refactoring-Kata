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
            if (items[i].name != GildedRose.agedBrie && items[i].name != GildedRose.backstagePasses) {
                if (items[i].quality > 0) {
                    if (items[i].name != GildedRose.sulfuras) {
                        items[i].quality = items[i].quality - 1
                    }
                }
            } else {
                if (items[i].quality < 50) {
                    items[i].quality = items[i].quality + 1

                    if (items[i].name == GildedRose.backstagePasses) {
                        if (items[i].sellIn < 11) {
                            if (items[i].quality < 50) {
                                items[i].quality = items[i].quality + 1
                            }
                        }

                        if (items[i].sellIn < 6) {
                            if (items[i].quality < 50) {
                                items[i].quality = items[i].quality + 1
                            }
                        }
                    }
                }
            }

            if (items[i].name != GildedRose.sulfuras) {
                items[i].sellIn = items[i].sellIn - 1
            }

            if (items[i].sellIn < 0) {
                if (items[i].name != GildedRose.agedBrie) {
                    if (items[i].name != GildedRose.backstagePasses) {
                        if (items[i].quality > 0) {
                            if (items[i].name != GildedRose.sulfuras) {
                                items[i].quality = items[i].quality - 1
                            }
                        }
                    } else {
                        items[i].quality = items[i].quality - items[i].quality
                    }
                } else {
                    if (items[i].quality < 50) {
                        items[i].quality = items[i].quality + 1
                    }
                }
            }
        }
    }
}
