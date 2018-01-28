@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {

    func testThatQualityDegradesTwiceAsFastAfterSellByDateHasPasses() {
        let item = Item(name: "Item", sellIn: 0, quality: 6)
        let gildedRose = GildedRose(items: [item])
        gildedRose.updateQuality()
        XCTAssertEqual(item.quality, 4)
    }
    
    func testThatTheQualityOfAnItemIsNeverNegative() {
        let item = Item(name: "Item", sellIn: 2, quality: 0)
        let gildedRose = GildedRose(items: [item])
        gildedRose.updateQuality()
        XCTAssertEqual(item.quality, 0)
    }
    
    func testThatAgedBrieIncreasesInQuality() {
        let item = Item(name: "Aged Brie", sellIn: 3, quality: 5)
        let gildedRose = GildedRose(items: [item])
        gildedRose.updateQuality()
        XCTAssertEqual(item.quality, 6)
    }
    
    func testThatAgedBrieIncreasesInQualityAfterItExpires() {
        let item = Item(name: "Aged Brie", sellIn: 0, quality: 5)
        let gildedRose = GildedRose(items: [item])
        gildedRose.updateQuality()
        XCTAssertEqual(item.quality, 7)
    }
    
    func testThatTheQualityOfAnItemIsNeverMoreThan50() {
        let item = Item(name: "Item", sellIn: 2, quality: 51)
        let gildedRose = GildedRose(items: [item])
        gildedRose.updateQuality()
        XCTAssertEqual(item.quality, 50)
    }
    
    func testThatSulfurasNeverDecreasesInQuality() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 2)
        let gildedRose = GildedRose(items: [item])
        gildedRose.updateQuality()
        XCTAssertEqual(item.quality, 2)
    }
    
    func testThatSulfurasNeverHAsToBeSold() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 2)
        let gildedRose = GildedRose(items: [item])
        gildedRose.updateQuality()
        XCTAssertEqual(item.sellIn, 0)
    }
    
    func testThatBackstagePassesIncreasesInQuality() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 30, quality: 12)
        let gildedRose = GildedRose(items: [item])
        gildedRose.updateQuality()
        XCTAssertEqual(item.quality, 13)
    }
    
    func testThatBackStagePassesQualityIncreasesBy2WhenThereAreTenDaysOrLess() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 12)
        let gildedRose = GildedRose(items: [item])
        gildedRose.updateQuality()
        XCTAssertEqual(item.quality, 14)
    }
    
    func testThatBackStagePassesQualityIncreasesBy3WhenThereAreFiveDaysOrLess() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 12)
        let gildedRose = GildedRose(items: [item])
        gildedRose.updateQuality()
        XCTAssertEqual(item.quality, 15)
    }
    
    func testThatBackstagePassesQualityDropsTo0AfterItExpires() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 12)
        let gildedRose = GildedRose(items: [item])
        gildedRose.updateQuality()
        XCTAssertEqual(item.quality, 0)
    }
}
