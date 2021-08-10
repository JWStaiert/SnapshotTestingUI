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

    Text("TestView")
  }
}

class TestUIView: UILabel {

  override init(frame: CGRect) {

    super.init(frame: frame)

    self.center = CGPoint(x: 200, y: 200)
    self.textAlignment = .center
    self.text = "TestUIView"
  }

  required init?(coder: NSCoder) {

    fatalError("init(coder:) has not been implemented")
  }
}

class TestUIViewController: UIViewController {

  override func viewDidLoad() {

    super.viewDidLoad()

    #warning("TODO: Fix this controller so label is centered on screen.")
    var label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
    label.center = CGPoint(x: 200, y: 200)
    label.textAlignment = .center
    label.text = "TestUIViewController"

    self.view.addSubview(label)
  }
}

class ContentViewer_UnitTests: XCTestCase {

  override func setUp() {

    XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeRight
  }

  func test_viewCanPass() throws {

    let _ = ContentViewer( { TestView() })

    XCTFail("Test not implemented.")
  }

  func test_viewCanFail() throws {

    XCTFail("Test not implemented.")
  }

  func test_viewSnapshotComparison() throws {

    #warning("TODO: Test portrait and landscape orientations.")
    //XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeLeft

    //let _ = ContentViewer( { TestView() })

    //XCUIDevice.shared.orientation = UIDeviceOrientation.portrait

    //let _ = ContentViewer( { TestView() })

    XCTFail("Test not implemented.")
  }

  func test_uiViewCanPass() throws {

    let _ = ContentViewer(TestUIView.self)

    XCTFail("Test not implemented.")
  }

  func test_uiViewCanFail() throws {

    XCTFail("Test not implemented.")
  }

  func test_uiViewSnapshotComparison() throws {

    #warning("TODO: Test portrait and landscape orientations.")

    XCTFail("Test not implemented.")
  }

  func test_uiViewControllerCanPass() throws {

    let _ = ContentViewer(TestUIViewController.self)

    XCTFail("Test not implemented.")
  }

  func test_uiViewControllerCanFail() throws {

    XCTFail("Test not implemented.")
  }

  func test_uiViewControllerSnapshotComparison() throws {

    #warning("TODO: Test portrait and landscape orientations.")

    XCTFail("Test not implemented.")
  }
}
