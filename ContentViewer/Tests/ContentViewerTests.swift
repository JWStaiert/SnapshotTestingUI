//  SnapshotTestingUI/ContentViewer/Tests/ContentViewer+UnitTests.swift
//
//  Created by Jason William Staiert on 8/7/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

@testable import SnapshotTestingUI

import SnapshotTestingEx
import SnapshotTesting
import SwiftUI
import XCTest

struct TestView: SwiftUI.View {

  @EnvironmentObject var model: RootViewModel

  var body: some SwiftUI.View {

    VStack {
      Button(action: { model.dismiss() }, label: {
        Text("Press to Dismiss")
      })
    }
    .frame(
      maxWidth: .greatestFiniteMagnitude,
      maxHeight: .greatestFiniteMagnitude,
      alignment: .center
    )
  }
}

class ContentViewer_UnitTests: XCTestCase {

  func test_viewCanPass() throws {

    let _ = ContentViewer( { TestView() })
  }

  func test_viewCanFail() throws {

    XCTFail("Test not implemented.")
  }

  func test_viewSnapshotComparison() throws {

    XCTFail("Test not implemented.")
  }

  func test_uiViewCanPass() throws {

    XCTFail("Test not implemented.")
  }

  func test_uiViewCanFail() throws {

    XCTFail("Test not implemented.")
  }

  func test_uiViewSnapshotComparison() throws {

    XCTFail("Test not implemented.")
  }

  func test_uiViewControllerCanPass() throws {

    XCTFail("Test not implemented.")
  }

  func test_uiViewControllerCanFail() throws {

    XCTFail("Test not implemented.")
  }

  func test_uiViewControllerSnapshotComparison() throws {

    XCTFail("Test not implemented.")
  }
}
