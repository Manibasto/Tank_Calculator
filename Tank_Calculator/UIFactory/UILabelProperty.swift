//
//  UILabelProperty.swift
//  Haggle
//
//  Created by Anil Kumar on 03/05/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import Foundation
import UIKit

final class UILabelFactory {
  private let label: UILabel
  private let defultFontSize: CGFloat = 20
  
  // MARK: - Inits
  init(text: String) {
    label = UILabel()
    label.textAlignment = .center
    label.text = text
    label.font = label.font.withSize(defultFontSize)
    label.translatesAutoresizingMaskIntoConstraints = false
  }
  
  // MARK: - Public methods
  func fontSize(of size: CGFloat) -> Self {
    label.font = label.font.withSize(size)
    
    return self
  }
  
  func textAlignment(with Alignment: NSTextAlignment)-> Self{
    label.textAlignment = Alignment
    
    return self
  }
  
  func textColor(with color: UIColor) -> Self {
    label.textColor = color
    
    return self
  }
  
  func textFonts(with font: UIFont) -> Self {
    label.font = font
    
    return self
  }
  
  func numberOf(lines: Int) -> Self {
    label.numberOfLines = lines
    
    return self
  }
  
  func build() -> UILabel {
    return label
  }
}
