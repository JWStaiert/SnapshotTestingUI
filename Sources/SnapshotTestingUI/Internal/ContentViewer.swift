//  SnapshotTestingUI/Internal/ContentViewer.swift
//
//  Created by Jason William Staiert on 8/5/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

import XCTest
import SwiftUI

internal class ContentViewer {

  init<Content>(
    @ViewBuilder _ content: @escaping () -> Content
  ) where Content: View {

    let rootViewModel = RootViewModel()

    let expectation = XCTestExpectation(description: "Waiting for dismiss.")
    rootViewModel.expectation = expectation

    let rootView = RootView(content).environmentObject(rootViewModel)

    let rootViewController = ContentHostingController(rootView: rootView)
    rootViewController.modalPresentationStyle = .overCurrentContext
    rootViewController.modalTransitionStyle = .crossDissolve
    rootViewModel.controller = rootViewController

    let scene = UIApplication.shared.connectedScenes.first!
    let sceneDelegate = scene.delegate as! UIWindowSceneDelegate
    let sceneViewController = sceneDelegate.window!!.rootViewController!

    sceneViewController.present(rootViewController, animated: true, completion: nil)

    XCTWaiter().wait(for: [expectation], timeout: .greatestFiniteMagnitude)
  }

  init<Content>(
    _ content: Content
  ) where Content: UIView {

    let rootViewModel = RootViewModel()

    let expectation = XCTestExpectation(description: "Waiting for dismiss.")
    rootViewModel.expectation = expectation

    let rootView = RootView({ RepresentableUIView<Content>() }).environmentObject(rootViewModel)

    let rootViewController = ContentHostingController(rootView: rootView)
    rootViewController.modalPresentationStyle = .overCurrentContext
    rootViewController.modalTransitionStyle = .crossDissolve
    rootViewModel.controller = rootViewController

    let scene = UIApplication.shared.connectedScenes.first!
    let sceneDelegate = scene.delegate as! UIWindowSceneDelegate
    let sceneViewController = sceneDelegate.window!!.rootViewController!

    sceneViewController.present(rootViewController, animated: true, completion: nil)

    XCTWaiter().wait(for: [expectation], timeout: .greatestFiniteMagnitude)
  }

  init<Content>(
    _ content: Content
  ) where Content: UIViewController {

    let rootViewModel = RootViewModel()

    let expectation = XCTestExpectation(description: "Waiting for dismiss.")
    rootViewModel.expectation = expectation

    let rootView = RootView({ RepresentableUIViewController<Content>() }).environmentObject(rootViewModel)

    let rootViewController = ContentHostingController(rootView: rootView)
    rootViewController.modalPresentationStyle = .overCurrentContext
    rootViewController.modalTransitionStyle = .crossDissolve
    rootViewModel.controller = rootViewController

    let scene = UIApplication.shared.connectedScenes.first!
    let sceneDelegate = scene.delegate as! UIWindowSceneDelegate
    let sceneViewController = sceneDelegate.window!!.rootViewController!

    sceneViewController.present(rootViewController, animated: true, completion: nil)

    XCTWaiter().wait(for: [expectation], timeout: .greatestFiniteMagnitude)
  }
}
