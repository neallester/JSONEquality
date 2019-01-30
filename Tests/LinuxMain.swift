import XCTest

import JSONEqualityTests

var tests = [XCTestCaseEntry]()
tests += JSONEqualityTests.allTests()
XCTMain(tests)