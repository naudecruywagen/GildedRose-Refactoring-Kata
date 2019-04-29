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
            let item = items[i]
            doSomething(with: item)

            if (item.name != GildedRose.sulfuras) {
                item.sellIn = item.sellIn - 1
            }

            if (item.sellIn < 0) {
                if (item.name != GildedRose.agedBrie) {
                    if (item.name != GildedRose.backstagePasses) {
                        if (item.quality > 0) {
                            if (item.name != GildedRose.sulfuras) {
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

    private func doSomething(with item: Item) {
        if (item.name != GildedRose.agedBrie && item.name != GildedRose.backstagePasses) {
            if (item.quality > 0) {
                if (item.name != GildedRose.sulfuras) {
                    item.quality = item.quality - 1
                }
            }
        } else {
            if (item.quality < 50) {
                item.quality = item.quality + 1

                if (item.name == GildedRose.backstagePasses) {
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
}
