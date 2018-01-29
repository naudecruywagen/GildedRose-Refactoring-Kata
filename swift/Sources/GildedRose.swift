
public class GildedRose {
    
    static let AgedBrie = "Aged Brie"
    static let BackstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    static let Sulfuras = "Sulfuras, Hand of Ragnaros"
    
    var items:[Item]
    
    required public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        
        for i in 0..<items.count {
            guard let item = items[i] as? Item  else { return }
            
            updateQuality(item: item)
            
            if (item.name != GildedRose.Sulfuras) {
                item.sellIn = item.sellIn - 1
            }
            
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
}
