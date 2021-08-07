//  SnapshotTestingUI/Internal/RepresentableUIView.swift
//
//  Created by Jason William Staiert on 8/3/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

import SwiftUI
import UIKit

internal struct RepresentableUIView<Content>: UIViewRepresentable where Content: UIView {

  typealias UIViewType = Content

  func makeUIView(context: Context) -> Content {

    Content()
  }

  func updateUIView(_ uiView: Content, context: Context) {

  }
}
