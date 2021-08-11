//  SnapshotTestingUI/Internal/RelocatableUI.swift
//
//  Created by Jason William Staiert on 8/3/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

import SwiftUI

internal struct RelocatableUI: View {

  @EnvironmentObject var model: RootViewModel

  var body: some View {

    GeometryReader {

      gp in

      let oneUnit = max(gp.size.width, gp.size.height) / 10

      ZStack {

        RelocatableButton(
          backgroundColor: Color.green,
          foregroundColor: Color.white,
          action: { model.pass() },
          label: { Text("PASS") }
        )
        .frame(
          width: oneUnit,
          height: oneUnit,
          alignment: .center
        )
        .position(
          CGPoint(
            x: gp.frame(in: .local).width - 0.5 * oneUnit,
            y: gp.frame(in: .local).height - 1.5 * oneUnit
          )
        )

        RelocatableButton(
          backgroundColor: Color.red,
          foregroundColor: Color.white,
          action: { model.fail() },
          label: { Text("FAIL") }
        )
        .frame(
          width: oneUnit,
          height: oneUnit,
          alignment: .center
        )
        .position(
          CGPoint(
            x: 1.5 * oneUnit,
            y: gp.frame(in: .local).height - 1.5 * oneUnit
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
