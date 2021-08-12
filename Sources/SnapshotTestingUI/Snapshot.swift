//  SnapshotTestingUI/Extensions/Snapshot.swift
//
//  Created by Jason William Staiert on 8/12/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

import SwiftUI
import UIKit
import XCTest

internal func _snapshot<T>(
  _ view: T
) -> UIImage where T: SwiftUI.View {

  let scene = UIApplication.shared.connectedScenes.first!
  let sceneDelegate = scene.delegate as! UIWindowSceneDelegate
  let sceneViewController = sceneDelegate.window!!.rootViewController!

  let controller = UIHostingController(rootView: view)
  controller.modalPresentationStyle = .fullScreen
  controller.modalTransitionStyle = .crossDissolve

  let controllerPresentationExpectation = XCTestExpectation(
    description: "Waiting for controller presentation."
  )

  sceneViewController.present(
    controller,
    animated: false,
    completion: { controllerPresentationExpectation.fulfill() }
  )

  XCTWaiter().wait(
    for: [controllerPresentationExpectation],
    timeout: .greatestFiniteMagnitude
  )

  controller.loadView()

  let view = controller.viewIfLoaded!

  let renderer = UIGraphicsImageRenderer(size: view.bounds.size)

  let image = renderer.image {

    _ in

    view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
  }

  let controllerDismissExpectation = XCTestExpectation(
    description: "Waiting for controller dismiss."
  )

  controller.dismiss(
    animated: false,
    completion: { controllerDismissExpectation.fulfill() }
  )

  XCTWaiter().wait(
    for: [controllerDismissExpectation],
    timeout: .greatestFiniteMagnitude
  )

  return image
}

/// Generates a snapshot of a View object.
public func snapshot<T>(
  _ view: T
) -> UIImage where T: SwiftUI.View {

  _snapshot(
    view
  )
}

/// Generates a snapshot of a ViewBuilder expression.
public func snapshot<T>(
  @ViewBuilder _ view: @escaping () -> T
) -> UIImage where T: SwiftUI.View {

  _snapshot(
    view()
  )
}

/// Generates a snapshot of a UIView type.
public func snapshot<T>(
  _ type: T.Type
) -> UIImage where T: UIView {

  _snapshot(
    RepresentableUIView<T>()
  )
}

/// Generates a snapshot of a UIViewController type.
func snapshot<T>(
  _ type: T.Type
) -> UIImage where T: UIViewController {

  _snapshot(
    RepresentableUIViewController<T>()
  )
}
