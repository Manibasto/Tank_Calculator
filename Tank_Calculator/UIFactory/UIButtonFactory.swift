//
//  UIButtonFactory.swift
//  Haggle
//
//  Created by Anil Kumar on 03/05/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import Foundation
import UIKit

final class UIButtonFactory {
    private let button: UIButton
    
    enum Style {
        case normal
        case especial
    }
    
    // MARK: - Inits
    init(title: String, style: Style = .normal) {
        button = UIButton()
        button.setTitle(title, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        switch style {
        case .normal: normalStyle()
        case .especial: especialStyle()
        }
    }
    
    // MARK: - Public methods
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event) -> Self {
        button.addTarget(target, action: action, for: event)
        
        return self
    }
    
    func textColor(with color: UIColor) -> Self {
        button.titleLabel?.textColor = color
        
        return self
    }
    
    func textAlignmentButton(with Alignment: NSTextAlignment) -> Self{
        button.titleLabel?.textAlignment = Alignment
        
        return self
    }
    
    func setTitileColour(with color: UIColor)-> Self{
        button.setTitleColor(color, for: .normal)
        return self
    }
    
    func cornerRadious(with radious: CGFloat) -> Self{
        button.layer.cornerRadius = radious
        return self
    }
    
    func textFonts(with font: UIFont) -> Self {
        button.titleLabel?.font = font
        return self
    }
    
    func borderColor(with color: CGColor) -> Self {
        button.layer.borderColor = color
        return self
    }
    
    func textFontSize(with font: UIFont) -> Self {
        button.titleLabel?.font = font
        return self
    }
    
    func borderThick(with radius: CGFloat)-> Self {
        button.layer.borderWidth = radius
        return self
    }
    
    func backgroundImage(with image: UIImage)-> Self {
        button.setImage(image, for: .normal)
        return self
    }
    
    func backgroundColour(with color: UIColor)-> Self {
        button.backgroundColor = color
        return self
    }
    
    func build() -> UIButton {
        return button
    }
    
    // MARK: - Private methods
    private func especialStyle() {
        button.layer.cornerRadius = 10
        button.backgroundColor = .green
        button.setTitleColor(.red, for: .normal)
        button.setTitleColor(.white, for: .highlighted)
    }
    
    private func normalStyle() {
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.white, for: .highlighted)
    }
}
