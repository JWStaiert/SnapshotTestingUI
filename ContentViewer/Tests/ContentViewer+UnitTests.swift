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

  var label: UILabel?

  override func viewWillTransition(
    to size: CGSize,
    with coordinator: UIViewControllerTransitionCoordinator) {

    label?.center = CGPoint(x: size.width / 2, y: size.height / 2)
  }

  override func viewDidLoad() {

    super.viewDidLoad()

    self.label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
    self.label!.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
    self.label!.textAlignment = .center
    self.label!.text = "TestUIViewController"

    self.view.addSubview(label!)
  }
}

class ContentViewer_UnitTests: XCTestCase {

  func test_viewSnapshotComparison_landscape() throws {

    XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeLeft

    let viewer = ContentViewer()

    viewer.present({ TestView() }, waitForUserInput: false)

    assertSnapshot(
      matching: viewer.snapshot(),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )

    viewer.dismiss()
  }

  func test_viewSnapshotComparison_portrait() throws {

    XCUIDevice.shared.orientation = UIDeviceOrientation.portrait

    let viewer = ContentViewer()

    viewer.present({ TestView() }, waitForUserInput: false)

    assertSnapshot(
      matching: viewer.snapshot(),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )

    viewer.dismiss()
  }

  func test_uiViewSnapshotComparison_landscape() throws {

    XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeLeft

    let viewer = ContentViewer()

    viewer.present(TestUIView.self, waitForUserInput: false)

    assertSnapshot(
      matching: viewer.snapshot(),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )

    viewer.dismiss()
  }

  func test_uiViewSnapshotComparison_portrait() throws {

    XCUIDevice.shared.orientation = UIDeviceOrientation.portrait

    let viewer = ContentViewer()

    viewer.present(TestUIView.self, waitForUserInput: false)

    assertSnapshot(
      matching: viewer.snapshot(),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )

    viewer.dismiss()
  }

  func test_uiViewControllerSnapshotComparison_landscape() throws {

    XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeLeft

    let viewer = ContentViewer()

    viewer.present(TestUIViewController.self, waitForUserInput: false)

    assertSnapshot(
      matching: viewer.snapshot(),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )

    viewer.dismiss()
  }

  func test_uiViewControllerSnapshotComparison_portrait() throws {

    XCUIDevice.shared.orientation = UIDeviceOrientation.portrait

    let viewer = ContentViewer()

    viewer.present(TestUIViewController.self, waitForUserInput: false)

    assertSnapshot(
      matching: viewer.snapshot(),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )

    viewer.dismiss()
  }
}
