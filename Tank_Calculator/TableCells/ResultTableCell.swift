//
//  ResultTableCell.swift
//  Tank_Calculator
//
//  Created by Anil Kumar on 24/05/19.
//  Copyright © 2019 Anil Kumar. All rights reserved.
//

import UIKit

class ResultTableCell: UITableViewCell {

    lazy var sideAView         = customUIViewClass()
    lazy var sideBView         = customUIViewClass()
    
    let sideALabel             = UILabelFactory(text: "")
        .textAlignment(with: .center)
        .textColor(with: UIColor(red: 91/255, green: 91/255, blue: 91/255, alpha: 0.9))
        .textFonts(with: UIFont(name: "OpenSans-Semibold", size: 12.0)!)
        .build()
    
    let sideBLabel             = UILabelFactory(text: "")
        .textAlignment(with: .center)
        .textColor(with: UIColor(red: 91/255, green: 91/255, blue: 91/255, alpha: 0.9))
        .textFonts(with: UIFont(name: "OpenSans-Semibold", size: 12.0)!)
        .build()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        sideAView.layer.borderColor         = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1.0).cgColor
        sideAView.layer.borderWidth         = 1.0
        
        sideBView.layer.borderColor         = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1.0).cgColor
        sideBView.layer.borderWidth         = 1.0
        
        addSubview(sideAView)
        sideAView.addSubview(sideALabel)
        addSubview(sideBView)
        sideBView.addSubview(sideBLabel)
        
        setUpConstraintsForLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraintsForLayouts(){
        
        sideAView.layoutAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: frame.size.width/2, height: 0.0, enableInsets: true)
        sideALabel.layoutAnchor(top: nil, left: nil, bottom: nil, right: nil, centerX: sideAView.centerXAnchor, centerY: sideAView.centerYAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 0.0, enableInsets: true)
        sideBView.layoutAnchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: frame.size.width/2, height: 0.0, enableInsets: true)
        sideBLabel.layoutAnchor(top: nil, left: nil, bottom: nil, right: nil, centerX: sideBView.centerXAnchor, centerY: sideBView.centerYAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 0.0, enableInsets: true)
    }
}
