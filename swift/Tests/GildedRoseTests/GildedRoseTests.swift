@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {

    func testThatQualityDegradesTwiceAsFastAfterSellByDateHasPasses() {
        let item = Item(name: "Item", sellIn: 0, quality: 6)
        let gildedRose = GildedRose(items: [item])
        gildedRose.updateQuality()
        XCTAssertEqual(item.quality, 4)
    }
}
