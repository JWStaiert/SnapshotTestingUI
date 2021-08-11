//  SnapshotTestingUI/RootViewModel.swift
//
//  Created by Jason William Staiert on 8/7/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

import UIKit
import XCTest

internal class RootViewModel: ObservableObject {

  var controller: UIViewController?

  var expectation: XCTestExpectation?

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
