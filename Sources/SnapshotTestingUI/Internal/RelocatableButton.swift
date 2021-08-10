//  SnapshotTestingUI/Internal/RelocatableButton.swift
//
//  Created by Jason William Staiert on 8/3/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

import SwiftUI

internal struct RelocatableButton<Label>: View where Label: View {

  private let backgroundColor: Color

  private let foregroundColor: Color

  private var action: () -> Void

  @ViewBuilder private var label: () -> Label

  @State private var offsetLast: CGPoint = .zero

  @State private var offsetNow: CGPoint = .zero

  init(
    backgroundColor: Color,
    foregroundColor: Color,
    action: @escaping () -> Void,
    @ViewBuilder label: @escaping () -> Label
  ) {

    self.backgroundColor = backgroundColor
    self.foregroundColor = foregroundColor
    self.action = action
    self.label = label
  }

  #warning("""
    TOOD: Increase button action area to include entire background. Presently
    it includes only the label text area which is inconveniently small on iPad
    devices.
    """)

  var body: some View {

    GeometryReader {

      gp in

      ZStack {

        RoundedRectangle(
          cornerRadius: gp.size.width / 8,
          style: .circular
        )
        .foregroundColor(
          .gray
        )
        .frame(
          width:  gp.size.width,
          height: gp.size.height
        )
        .shadow(
          color: Color.black.opacity(0.25),
          radius: 4,
          x: 4,
          y: 4
        )
        .position(
          CGPoint(
            x: gp.frame(in: .local).origin.x + self.offsetNow.x,
            y: gp.frame(in: .local).origin.y + self.offsetNow.y
          )
        )
        .gesture(
          DragGesture()
            .onChanged(
              {
                self.offsetNow = CGPoint(
                  x: self.offsetLast.x + $0.translation.width,
                  y: self.offsetLast.y + $0.translation.height
                )
              }
            )
            .onEnded(
              { _ in
                self.offsetLast = self.offsetNow
              }
            )
        )

        Button(action: self.action, label: {
          self.label()
            .font(.system(.headline))
            .foregroundColor(
              self.foregroundColor
            )
        }
        )
        .frame(
          width:  gp.size.width,
          height: gp.size.height
        )
        .background(
          self.backgroundColor
        )
        .cornerRadius(
          gp.size.width / 2
        )
        .padding()
        .position(
          CGPoint(
            x: gp.frame(in: .local).origin.x + self.offsetNow.x,
            y: gp.frame(in: .local).origin.y + self.offsetNow.y + gp.size.height / 2
          )
        )
      }
    }
  }
}
