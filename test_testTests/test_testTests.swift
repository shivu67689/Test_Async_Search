//
//  test_testTests.swift
//  test_testTests
//
//  Created by Shivakumarswami Hiremath on 13/12/21.
//

import XCTest


@testable import test_test


class test_testTests: XCTestCase {

    
    func testhasEmptyTitle() {
        
        let viewModel = Result(displayTitle: "", mpaaRating: "", criticsPick: 0, byline: "", headline: "", summaryShort: "", publicationDate: "", openingDate: "", dateUpdated: "", link: Link(type: .article, url: "", suggestedLinkText: ""), multimedia: nil)
        
        XCTAssertTrue(viewModel.displayTitle.isEmpty)
        
        
        }
    
   
}
