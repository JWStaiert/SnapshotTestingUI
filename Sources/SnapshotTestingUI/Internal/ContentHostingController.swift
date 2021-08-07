//  SnapshotTestingUI/Internal/ContentHostingController.swift
//
//  Created by Jason William Staiert on 8/5/21.
//
//  Copyright © 2021 by Jason William Staiert. All Rights Reserved.

import UIKit
import SwiftUI

internal extension Notification.Name {

  static let screenPropertiesChanged = Notification.Name("ContentHostingController_screenPropertiesChanged")
}

internal class ContentHostingController<Content>
: UIHostingController<Content> where Content: View {

  override func viewWillTransition(
    to size: CGSize,
    with coordinator: UIViewControllerTransitionCoordinator
  ) {

    #warning("TODO: Remove next line.")
    print("ContentHostingController: \(size)")

    NotificationCenter.default.post(
      name: .screenPropertiesChanged,
      object: nil,
      userInfo: [ "size": size ]
    )

    super.viewWillTransition(to: size, with: coordinator)
  }
}
