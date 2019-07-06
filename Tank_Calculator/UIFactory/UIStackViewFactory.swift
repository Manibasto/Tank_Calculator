//
//  UIStackViewFactory.swift
//  Haggle
//
//  Created by Anil Kumar on 03/05/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import Foundation
import UIKit

final class UIStackViewFactory {
  
  private let stackview: UIStackView
 
  init(view: [UIView]) {
    stackview = UIStackView()
    stackview.translatesAutoresizingMaskIntoConstraints = false
    stackview.axis = .horizontal
    stackview.alignment = .fill
    stackview.distribution = .fillEqually
    stackview.spacing = 10
    view.forEach { (btns) in
      stackview.addArrangedSubview(btns)
    }
  }
  
  func addsubview(array view : UIView)  {
    stackview.addArrangedSubview(view)
//    return self
  }
  
  func build() -> UIStackView {
    return stackview
  }
  
}
