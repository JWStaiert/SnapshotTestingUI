//  SnapshotTestingUI/RootViewModel.swift
//
//  Created by Jason William Staiert on 8/7/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

import UIKit
import XCTest

internal class RootViewModel: ObservableObject {

  let oneGridUnit: CGFloat

  var controller: UIViewController?

  var expectation: XCTestExpectation?

  init() {

    let size = UIScreen.main.bounds.size

    oneGridUnit = max(size.width, size.height) / 10
  }

  private func dismiss() {

    controller?.dismiss(animated: true)
    expectation?.fulfill()
  }

  func pass() {

    dismiss()
  }

  func fail() {

    dismiss()
  }
}
