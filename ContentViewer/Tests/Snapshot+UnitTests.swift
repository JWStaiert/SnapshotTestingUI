//  SnapshotTestingUI/ContentViewer/Extensions+UnitTests.swift
//
//  Created by Jason William Staiert on 8/12/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

@testable import SnapshotTestingUI

import SwiftUI
import SnapshotTestingEx
import SnapshotTesting
import XCTest

fileprivate struct TestView: SwiftUI.View {

  var body: some SwiftUI.View {

    GeometryReader {

      gp in

      ZStack {

        RoundedRectangle(
          cornerRadius: 20,
          style: .circular
        )
        .foregroundColor(
          .blue
        )
        .frame(
          width:  gp.size.width,
          height: gp.size.height
        )
        .position(
          CGPoint(
            x: gp.frame(in: .local).midX,
            y: gp.frame(in: .local).midY
          )
        )

        Text("TestView")
          .frame(
            width:  gp.size.width,
            height: gp.size.height,
            alignment: .center
          )
          .foregroundColor(.white)
          .font(.system(.title))
      }
    }
  }
}

fileprivate class TestUIView: UILabel {

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

fileprivate class TestUIViewController: UIViewController {

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

class Snapshot_UnitTests: XCTestCase {

  func test_snapshot_View_object_landscape() {

    XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeLeft

    assertSnapshot(
      matching: snapshot(TestView()),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )
  }

  func test_snapshot_View_object_portrait() {

    XCUIDevice.shared.orientation = UIDeviceOrientation.portrait

    assertSnapshot(
      matching: snapshot(TestView()),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )
  }

  func test_snapshot_View_expression_landscape() {

    XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeLeft

    assertSnapshot(
      matching: snapshot({ TestView() }),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )
  }

  func test_snapshot_View_expression_portrait() {

    XCUIDevice.shared.orientation = UIDeviceOrientation.portrait

    assertSnapshot(
      matching: snapshot({ TestView() }),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )
  }

  func test_snapshot_uiView_landscape() {

    XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeLeft

    assertSnapshot(
      matching: snapshot(TestUIView.self),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )
  }

  func test_snapshot_uiView_portrait() {

    XCUIDevice.shared.orientation = UIDeviceOrientation.portrait

    assertSnapshot(
      matching: snapshot(TestUIView.self),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )
  }

  func test_snapshot_uiViewController_landscape() {

    XCUIDevice.shared.orientation = UIDeviceOrientation.landscapeLeft

    assertSnapshot(
      matching: snapshot(TestUIViewController.self),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )
  }

  func test_snapshot_uiViewController_portrait() {

    XCUIDevice.shared.orientation = UIDeviceOrientation.portrait

    assertSnapshot(
      matching: snapshot(TestUIViewController.self),
      as: .imageEx(
        maxAbsoluteComponentDifference: 0.0,
        maxAverageAbsoluteComponentDifference: 0.0,
        scale: nil
      )
    )
  }
}
