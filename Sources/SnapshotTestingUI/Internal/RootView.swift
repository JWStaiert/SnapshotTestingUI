//  SnapshotTestingUI/Internal/RootView.swift
//
//  Created by Jason William Staiert on 8/3/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

import SwiftUI

internal struct RootView<Content>: View where Content: View {

  //@EnvironmentObject var model: RootViewModel

  @ViewBuilder var content: () -> Content

  init(@ViewBuilder _ content: @escaping () -> Content) {

    self.content = content
  }

  var body: some View {

    GeometryReader {

      gp in

      ZStack {

        content()

        RelocatableUI()
      }
      .position(
        CGPoint(
          x: gp.size.width / 2,
          y: gp.size.height / 2
        )
      )
      .frame(
        maxWidth: .greatestFiniteMagnitude,
        maxHeight: .greatestFiniteMagnitude,
        alignment: .center
      )
    }
  }
}
