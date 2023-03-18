//
//  DesignBrowserHistory.swift
//  https://leetcode.com/problems/design-browser-history/
//
//  Created by Erik Radicheski da Silva on 18/03/23.
//

import XCTest

final class DesignBrowserHistory: XCTestCase {

    func testExampleA() {
        let browserHistory = BrowserHistory("leetcode.com")
        browserHistory.visit("google.com")
        browserHistory.visit("facebook.com")
        browserHistory.visit("youtube.com")
        XCTAssertEqual(browserHistory.back(1), "facebook.com")
        XCTAssertEqual(browserHistory.back(1), "google.com")
        XCTAssertEqual(browserHistory.forward(1), "facebook.com")
        browserHistory.visit("linkedin.com")
        XCTAssertEqual(browserHistory.forward(2), "linkedin.com")
        XCTAssertEqual(browserHistory.back(2), "google.com")
        XCTAssertEqual(browserHistory.back(7), "leetcode.com")
    }

}

private class BrowserHistory {
    
    private var history = [String]()
    private var index = -1
    
    init(_ homepage: String) {
        history.append(homepage)
        index = 0
    }
    
    func visit(_ url: String) {
        while history.endIndex - 1 > index {
            let _ = history.removeLast()
        }
        
        history.append(url)
        index = history.endIndex - 1
    }
    
    func back(_ steps: Int) -> String {
        index = max(0, index - steps)
        return history[index]
    }
    
    func forward(_ steps: Int) -> String {
        index = min(history.endIndex - 1, index + steps)
        return history[index]
    }
}
