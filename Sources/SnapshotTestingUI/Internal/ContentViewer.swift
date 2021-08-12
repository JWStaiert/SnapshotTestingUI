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

    let viewDismissedExpectation = XCTestExpectation(description: "Waiting for dismiss.")
    rootViewModel.expectation = viewDismissedExpectation

    let rootView = view.environmentObject(rootViewModel)

    rootViewController = ContentHostingController(rootView: rootView)
    rootViewController!.modalPresentationStyle = .fullScreen
    rootViewController!.modalTransitionStyle = .crossDissolve
    rootViewModel.controller = rootViewController!

    let scene = UIApplication.shared.connectedScenes.first!
    let sceneDelegate = scene.delegate as! UIWindowSceneDelegate
    let sceneViewController = sceneDelegate.window!!.rootViewController!

    let viewPresentedExpectation = XCTestExpectation(description: "Waiting for presentation.")
    sceneViewController.present(rootViewController!, animated: false, completion: { viewPresentedExpectation.fulfill() })
    XCTWaiter().wait(for: [viewPresentedExpectation], timeout: .greatestFiniteMagnitude)

    if (waitForUserInput) {

      XCTWaiter().wait(for: [viewDismissedExpectation], timeout: .greatestFiniteMagnitude)
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

  func snapshot() -> UIImage {

    rootViewController?.loadView()

    let view = rootViewController?.viewIfLoaded!

    let renderer = UIGraphicsImageRenderer(size: view!.bounds.size)

    let image = renderer.image {

      _ in

      view!.drawHierarchy(in: view!.bounds, afterScreenUpdates: true)
    }

    return image
  }

  func dismiss() {

    rootViewController?.dismiss(animated: false)
  }
}
