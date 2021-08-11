//  SnapshotTestingUI/Internal/ContentViewer.swift
//
//  Created by Jason William Staiert on 8/5/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

import XCTest
import SwiftUI

internal class ContentViewer {

  var rootViewController: UIViewController?

  private func present<Content>(view: Content, waitForUserInput: Bool) where Content: View {

    let rootViewModel = RootViewModel()

    let expectation = XCTestExpectation(description: "Waiting for dismiss.")
    rootViewModel.expectation = expectation

    let rootView = view.environmentObject(rootViewModel)

    rootViewController = ContentHostingController(rootView: rootView)
    rootViewController!.modalPresentationStyle = .fullScreen
    rootViewController!.modalTransitionStyle = .crossDissolve
    rootViewModel.controller = rootViewController!

    let scene = UIApplication.shared.connectedScenes.first!
    let sceneDelegate = scene.delegate as! UIWindowSceneDelegate
    let sceneViewController = sceneDelegate.window!!.rootViewController!

    if (waitForUserInput) {

      sceneViewController.present(rootViewController!, animated: true, completion: nil)

      XCTWaiter().wait(for: [expectation], timeout: .greatestFiniteMagnitude)
    }
  }

  func present<Content>(
    @ViewBuilder _ content: @escaping () -> Content,
    waitForUserInput: Bool = true
  ) where Content: View {

    present(
      view: RootView(content),
      waitForUserInput: waitForUserInput
    )
  }

  func present<Content>(
    _ type: Content.Type,
    waitForUserInput: Bool = true
  ) where Content: UIView {

    present(
      view: RootView({ RepresentableUIView<Content>() }),
      waitForUserInput: waitForUserInput
    )
  }

  func present<Content>(
    _ type: Content.Type,
    waitForUserInput: Bool = true
  ) where Content: UIViewController {

    present(
      view: RootView({ RepresentableUIViewController<Content>() }),
      waitForUserInput: waitForUserInput
    )
  }
}
