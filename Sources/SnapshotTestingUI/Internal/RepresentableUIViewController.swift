//  SnapshotTestingUI/Internal/RepresentableUIViewController.swift
//
//  Created by Jason William Staiert on 8/3/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

import SwiftUI
import UIKit

internal struct RepresentableUIViewController<Content>: UIViewControllerRepresentable where Content: UIViewController {

  typealias UIViewControllerType = Content

  func makeUIViewController(context: Context) -> Content {

    Content()
  }

  func updateUIViewController(_ uiViewController: Content, context: Context) {

  }
}
