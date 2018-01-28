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
    
    func testThatTheQualityOfAnItemIsNeverMoreThan50() {
        let item = Item(name: "Item", sellIn: 2, quality: 51)
        let gildedRose = GildedRose(items: [item])
        gildedRose.updateQuality()
        XCTAssertEqual(item.quality, 50)
    }
}
