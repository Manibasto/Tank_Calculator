//
//  AttributesClass.swift
//  SpecaWorx
//
//  Created by Anil Kumar on 17/05/19.
//  Copyright © 2019 Anil Kumar. All rights reserved.
//

import UIKit

class customImageClass: UIImageView{
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class customUIViewClass: UIView{
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class customTableViewClass: UITableView{
    init() {
        super.init(frame: .zero, style: .plain)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class customTextFieldClass: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}


class customCardViewClass: UIView{
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 0.85, green: 0.89, blue: 0.91, alpha: 0.50).cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.cornerRadius = 0
        self.layer.borderColor = UIColor(red: 0.86, green: 0.87, blue: 0.89, alpha: 0.30).cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1)
        self.alpha = 1
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class customLabelClass: UILabel{
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = NSTextAlignment.center
        self.font = UIFont(name: "Montserrat-Medium", size: 13.0)
        self.textColor = .white
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
