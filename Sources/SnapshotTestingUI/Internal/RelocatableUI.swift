//  SnapshotTestingUI/Internal/RelocatableUI.swift
//
//  Created by Jason William Staiert on 8/3/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

import SwiftUI

internal struct RelocatableUI: View {

  @EnvironmentObject var model: RootViewModel

  #warning("""
    TOOD: Look into removing the oneGridUnit constant from RootViewModel. Would
    prefer it to be a constant defined within body.
    """)

  var body: some View {

    GeometryReader {

      gp in

      ZStack {

        RelocatableButton(
          backgroundColor: Color.green,
          foregroundColor: Color.white,
          action: { model.pass() },
          label: { Text("PASS") }
        )
        .frame(
          width: model.oneGridUnit,
          height: model.oneGridUnit,
          alignment: .center
        )
        .position(
          CGPoint(
            x: gp.frame(in: .local).width - 0.5 * model.oneGridUnit,
            y: gp.frame(in: .local).height - model.oneGridUnit
          )
        )

        RelocatableButton(
          backgroundColor: Color.red,
          foregroundColor: Color.white,
          action: { model.fail() },
          label: { Text("FAIL") }
        )
        .frame(
          width: model.oneGridUnit,
          height: model.oneGridUnit,
          alignment: .center
        )
        .position(
          CGPoint(
            x: 1.5 * model.oneGridUnit,
            y: gp.frame(in: .local).height - model.oneGridUnit
          )
        )
      }
      .frame(
        maxWidth: .greatestFiniteMagnitude,
        maxHeight: .greatestFiniteMagnitude,
        alignment: .center
      )
    }
  }
}
