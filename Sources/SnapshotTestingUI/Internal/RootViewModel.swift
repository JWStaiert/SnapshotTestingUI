//  SnapshotTestingUI/RootViewModel.swift
//
//  Created by Jason William Staiert on 8/7/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

import UIKit
import XCTest

internal class RootViewModel: ObservableObject {

  enum ScreenLayout {

    case landscape

    case portrait
  }

  struct ScreenProperties {

    /// Layout of screen on which window is visible.
    let layout: ScreenLayout

    /// Width of screen in points on which window is visible.
    let width: Int

    /// Height of screen in points on which window is visible.
    let height: Int

    /// Size in points of one "standard unit" on the screen. Effectively one
    /// tenth of the largest dimension.
    let oneU: Int

    init(_ size: CGSize) {

      layout = (size.width > size.height) ? .landscape : .portrait
      width = Int(size.width)
      height = Int(size.height)
      oneU = Int(max(size.width, size.height) / 10)
    }
  }

  /// Properties of screen on which window is visible.
  @Published var screenProperties: ScreenProperties

  var controller: UIViewController?

  var expectation: XCTestExpectation?

  init() {

    screenProperties = ScreenProperties(UIScreen.main.bounds.size)

    NotificationCenter.default.addObserver(
      self,
      selector: #selector(onViewWillTransition(notification:)),
      name: .screenPropertiesChanged,
      object: nil
    )
  }

  func dismiss() {

    controller?.dismiss(animated: true)
    expectation?.fulfill()
  }

  @objc func onViewWillTransition(notification: Notification) {

    guard let size = notification.userInfo?["size"] as? CGSize else { return }

    #warning("TODO: Remove next line.")
    print("RootViewModel: \(size)")

    screenProperties = ScreenProperties(size)
  }
}
