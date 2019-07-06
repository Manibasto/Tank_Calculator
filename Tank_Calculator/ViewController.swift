//
//  ViewController.swift
//  Tank_Calculator
//
//  Created by Anil Kumar on 23/05/19.
//  Copyright © 2019 Anil Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var appLogo             = customImageClass()
    lazy var topCustomView       = customUIViewClass()
    lazy var bottomCustomView    = customUIViewClass()
    lazy var horizontalView      = customUIViewClass()
    lazy var verticalView        = customUIViewClass()
    lazy var rectangularView     = customUIViewClass()
    lazy var groupedStackView    = UIStackView()
    lazy var lineView            = customUIViewClass()
    lazy var infoView            = customUIViewClass()
    lazy var diameterTextfield   = customTextFieldClass()
    lazy var lengthTextfield     = customTextFieldClass()
    lazy var incrementTextfield  = DropDown()
    lazy var lineView2           = customUIViewClass()
    lazy var additionalTextfield = customTextFieldClass()
    lazy var conditionalView     = customUIViewClass()
    lazy var heightTextfield     = customTextFieldClass()
    
    var tankTypeValue            = 0
    var tankType: String         = ""
    
    let numberToolbar             = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.alwaysBounceVertical = true
        v.alwaysBounceHorizontal = false
        return v
    }()
    
    private let titleLabel  = UILabelFactory(text: "Select type of tank:")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 1.0))
        .fontSize(of: 16.0)
        .build()
    
    let calculateButton          = UIButtonFactory(title: "CALCULATE")
        .textColor(with: .white)
        .textFonts(with: UIFont(name: "OpenSans-ExtraBold", size: 20.0)!)
        .addTarget(self, action: #selector(didTapCalculate), for: .touchUpInside)
        .build()
    
    let horizontalButton         = UIButtonFactory(title: "")
        .build()
    
    let verticalButton           = UIButtonFactory(title: "")
        .build()
    
    let rectangularButton        = UIButtonFactory(title: "")
        .build()
    
    private let horizontalLabel  = UILabelFactory(text: "Horizantal")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 73/255, green: 74/255, blue: 73/255, alpha: 1.0))
        .fontSize(of: 11.0)
        .build()
    
    private let verticalLabel    = UILabelFactory(text: "Vertical")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 73/255, green: 74/255, blue: 73/255, alpha: 1.0))
        .fontSize(of: 11.0)
        .build()
    
    private let rectangularLabel = UILabelFactory(text: "Rectangular")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 73/255, green: 74/255, blue: 73/255, alpha: 1.0))
        .fontSize(of: 11.0)
        .build()
    
    private let titleLabel1      = UILabelFactory(text: "Enter in Inches:")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 1.0))
        .fontSize(of: 16.0)
        .build()
    
    private let textTitle1       = UILabelFactory(text: "Inches Diameter: (width)")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 75/255, green: 74/255, blue: 74/255, alpha: 1.0))
        .fontSize(of: 14.0)
        .build()
    
    private let infoLabel        = UILabelFactory(text: "*Chart Accuracy Not Guaranteed")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 61/255, green: 62/255, blue: 62/255, alpha: 1.0))
        .fontSize(of: 8.0)
        .build()
    
    private let textTitle2       = UILabelFactory(text: "Inches Length:")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 75/255, green: 74/255, blue: 74/255, alpha: 1.0))
        .fontSize(of: 14.0)
        .build()
    
    private let textTitle4       = UILabelFactory(text: "Striker Plates: ")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 75/255, green: 74/255, blue: 74/255, alpha: 1.0))
        .fontSize(of: 14.0)
        .build()
    
    private let textTitle3       = UILabelFactory(text: "Increments: (in inches)")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 75/255, green: 74/255, blue: 74/255, alpha: 1.0))
        .fontSize(of: 14.0)
        .build()
    
    let checkBoxButton           = UIButtonFactory(title: "")
        .build()
    
    private let titleLabel2      = UILabelFactory(text: "Reference")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 1.0))
        .fontSize(of: 16.0)
        .build()
    
    private let titleLabel3      = UILabelFactory(text: "For Rectangular tanks only:")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 1.0))
        .fontSize(of: 16.0)
        .build()
    
    private let textTitle5       = UILabelFactory(text: "Inches Height: ")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 75/255, green: 74/255, blue: 74/255, alpha: 1.0))
        .fontSize(of: 14.0)
        .build()
    
    var horizontalFlag  = true
    var verticalFlag    = false
    var rectangularFlag = false
    var checkBoxFlag    = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor             = UIColor(red: 235/255, green: 239/255, blue: 241/255, alpha: 1.0)
        infoView.backgroundColor         = UIColor(red: 235/255, green: 239/255, blue: 241/255, alpha: 1.0)
        appLogo.image                    = UIImage(named: "AppLogo")
        topCustomView.backgroundColor    = UIColor(red: 41/255, green: 47/255, blue: 105/255, alpha: 1.0)
        scrollView.backgroundColor       = UIColor(red: 235/255, green: 239/255, blue: 241/255, alpha: 1.0)
        bottomCustomView.backgroundColor = UIColor(red: 216/255, green: 52/255, blue: 41/255, alpha: 1.0)
        horizontalButton.setImage(UIImage(named: "Radio_On"), for: .normal)
        verticalButton.setImage(UIImage(named: "Radio_Off"), for: .normal)
        rectangularButton.setImage(UIImage(named: "Radio_Off"), for: .normal)
        checkBoxButton.setImage(UIImage(named: "Unchecked_Box"), for: .normal)
        lineView.layer.borderColor       = UIColor(red: 215/255, green: 218/255, blue: 220/255, alpha: 1.0).cgColor
        lineView.layer.borderWidth       = 1.0
        lineView2.layer.borderColor      = UIColor(red: 215/255, green: 218/255, blue: 220/255, alpha: 1.0).cgColor
        lineView2.layer.borderWidth      = 1.0
        conditionalView.backgroundColor  = UIColor.black.withAlphaComponent(0.4)
        scrollView.showsVerticalScrollIndicator = false
        let arrayView                    = [horizontalView,verticalView,rectangularView]
        groupedStackView = UIStackViewFactory(view: arrayView)
            .build()
        
        let horizontalGesture = UITapGestureRecognizer(target: self, action: #selector(horizontalViewTapped))
        horizontalView.isUserInteractionEnabled = true
        horizontalView.addGestureRecognizer(horizontalGesture)
        let verticalGesture = UITapGestureRecognizer(target: self, action: #selector(verticalViewTapped))
        verticalView.isUserInteractionEnabled = true
        verticalView.addGestureRecognizer(verticalGesture)
        let rectangularGesture = UITapGestureRecognizer(target: self, action: #selector(rectangularViewTapped))
        rectangularView.isUserInteractionEnabled = true
        rectangularView.addGestureRecognizer(rectangularGesture)
        numberToolbar.barStyle = .default
        numberToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(didTabDoneBarButton))]
        numberToolbar.sizeToFit()
        checkBoxButton.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        setUpViews()
        setUpConstraintsForLayoutViews()
        textFieldProperties()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        switch UIDevice().type {
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSmax, .iPhone6plus, .iPhone7plus, .iPhone8plus, .iPhone6Splus :
            let screensize: CGRect = UIScreen.main.bounds
            let screenWidth = screensize.width
            let screenHeight = screensize.height
            scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight)
        default:
            let screensize: CGRect = UIScreen.main.bounds
            let screenWidth = screensize.width
            let screenHeight = screensize.height
            scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight)
        }
        
        
        
        
        
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight)
    }
    
    @objc func horizontalViewTapped(){
        if !horizontalFlag {
            horizontalFlag = true
            verticalFlag = false
            rectangularFlag = false
            tankTypeValue = 0
            horizontalButton.setImage(UIImage(named: "Radio_On"), for: .normal)
            verticalButton.setImage(UIImage(named: "Radio_Off"), for: .normal)
            rectangularButton.setImage(UIImage(named: "Radio_Off"), for: .normal)
            conditionalView.isHidden = false
        }
    }
    
    @objc func verticalViewTapped(){
        if !verticalFlag {
            verticalFlag = true
            horizontalFlag = false
            rectangularFlag = false
            tankTypeValue = 1
            horizontalButton.setImage(UIImage(named: "Radio_Off"), for: .normal)
            verticalButton.setImage(UIImage(named: "Radio_On"), for: .normal)
            rectangularButton.setImage(UIImage(named: "Radio_Off"), for: .normal)
            conditionalView.isHidden = false
        }
    }
    
    @objc func rectangularViewTapped(){
        if !rectangularFlag {
            rectangularFlag = true
            horizontalFlag = false
            verticalFlag = false
            tankTypeValue = 2
            horizontalButton.setImage(UIImage(named: "Radio_Off"), for: .normal)
            verticalButton.setImage(UIImage(named: "Radio_Off"), for: .normal)
            rectangularButton.setImage(UIImage(named: "Radio_On"), for: .normal)
            conditionalView.isHidden = true
        }
    }
    
    @objc func didTabDoneBarButton(){
        diameterTextfield.resignFirstResponder()
        lengthTextfield.resignFirstResponder()
        additionalTextfield.resignFirstResponder()
        heightTextfield.resignFirstResponder()
    }
    
    @objc func checkBoxTapped(){
        if !checkBoxFlag{
            checkBoxFlag = true
            checkBoxButton.setImage(UIImage(named: "Checked_Box"), for: .normal)
        }else{
            checkBoxFlag = false
            checkBoxButton.setImage(UIImage(named: "Unchecked_Box"), for: .normal)
        }
    }
    
    @objc func didTapCalculate(){
        calculateButton.loadingIndicator(show: true)
        calculateButton.setTitle("", for: .normal)
        if Reachability.isConnectedToNetwork() {
            let result = validateTextField()
            if result{
                Networking.shared.calculation(TankValues.type, TankValues.increments, TankValues.diameter, TankValues.length) { (success, error, diameter, length, capacity, inches, gallons) in
                    if success {
                        diameterReturnedValue = diameter
                        lengthReturnedValue   = length
                        capacityReturnedValue = capacity
                        let inchesStrings = inches
                        let inchesDoubles = inchesStrings.compactMap(Double.init)
                        let doubleInchesValue = inchesDoubles.sorted()
                        let inchesStr = doubleInchesValue.compactMap(String.init)
                        let gallonsStrings = gallons
                        let gallonsDoubles = gallonsStrings.compactMap(Double.init)
                        let doubleGallonsValue = gallonsDoubles.sorted()
                        let inchesStr2 = doubleGallonsValue.compactMap(String.init)
                        inchesReturnedValue   = inchesStr
                        gallonsReturnedValue  = inchesStr2
                        self.diameterTextfield.text = ""
                        self.lengthTextfield.text   = ""
                        self.incrementTextfield.text = ""
                        self.calculateButton.loadingIndicator(show: false)
                        self.calculateButton.setTitle("CALCULATE", for: .normal)
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CalculatorResultContoller") as? CalculatorResultContoller
                        self.navigationController?.pushViewController(vc!, animated: true)
                    }else{
                        
                        self.showConfirmAlert(title: "", message: error, buttonTitle: "Dismiss", buttonStyle: .default, confirmAction: nil)
                    }
                }
            }
        }else{
            calculateButton.loadingIndicator(show: false)
            calculateButton.setTitle("CALCULATE", for: .normal)
            showConfirmAlert(title: "", message: "Check Your Internet Connection", buttonTitle: "Ok", buttonStyle: .default, confirmAction: nil)
        }
    }
    
    func validateTextField() -> Bool{
        if tankTypeValue == 0{
            TankValues.type = "h"
        }else if tankTypeValue == 1{
            TankValues.type = "v"
        }
        
        if incrementTextfield.text != ""{
            TankValues.increments = incrementTextfield.text!
        }else {
            calculateButton.loadingIndicator(show: false)
            calculateButton.setTitle("CALCULATE", for: .normal)
            showConfirmAlert(title: "", message: "Select Increments", buttonTitle: "Dismiss", buttonStyle: .default, confirmAction: nil)
            return false
        }
        
        if diameterTextfield.text?.count != 0 && diameterTextfield.text != "."{
            TankValues.diameter = diameterTextfield.text!
        }else{
            calculateButton.loadingIndicator(show: false)
            calculateButton.setTitle("CALCULATE", for: .normal)
            showConfirmAlert(title: "", message: "Diameter Field Can not be empty", buttonTitle: "Dismiss", buttonStyle: .default, confirmAction: nil)
            return false
        }
        
        if lengthTextfield.text?.count != 0 && lengthTextfield.text != "."{
            TankValues.length = lengthTextfield.text!
        }else{
            calculateButton.loadingIndicator(show: false)
            calculateButton.setTitle("CALCULATE", for: .normal)
            showConfirmAlert(title: "", message: "Length Field Can not be empty", buttonTitle: "Dismiss", buttonStyle: .default, confirmAction: nil)
            return false
        }
        
        return true
    }
}

extension ViewController: UITextFieldDelegate{
    
    func setUpViews(){
        view.addSubview(appLogo)
        view.addSubview(topCustomView)
        view.sendSubviewToBack(topCustomView)
        view.addSubview(bottomCustomView)
        bottomCustomView.addSubview(calculateButton)
        view.addSubview(infoView)
        infoView.addSubview(infoLabel)
        view.addSubview(titleLabel)
        view.addSubview(groupedStackView)
        view.addSubview(horizontalButton)
        view.addSubview(horizontalLabel)
        view.addSubview(verticalButton)
        view.addSubview(verticalLabel)
        view.addSubview(rectangularButton)
        view.addSubview(rectangularLabel)
        view.addSubview(lineView)
        view.addSubview(scrollView)
        scrollView.addSubview(titleLabel1)
        scrollView.addSubview(textTitle1)
        scrollView.addSubview(diameterTextfield)
        scrollView.addSubview(textTitle2)
        scrollView.addSubview(lengthTextfield)
        scrollView.addSubview(textTitle3)
        scrollView.addSubview(incrementTextfield)
        scrollView.bringSubviewToFront(incrementTextfield)
        scrollView.addSubview(textTitle4)
        scrollView.sendSubviewToBack(textTitle4)
        scrollView.addSubview(checkBoxButton)
        scrollView.sendSubviewToBack(checkBoxButton)
        scrollView.addSubview(lineView2)
        scrollView.sendSubviewToBack(lineView2)
        scrollView.addSubview(titleLabel2)
        scrollView.sendSubviewToBack(titleLabel2)
        scrollView.addSubview(additionalTextfield)
        scrollView.sendSubviewToBack(additionalTextfield)
        scrollView.addSubview(titleLabel3)
        scrollView.addSubview(textTitle5)
        scrollView.addSubview(heightTextfield)
        scrollView.addSubview(conditionalView)
        textTitle5.bringSubviewToFront(conditionalView)
        titleLabel3.bringSubviewToFront(conditionalView)
        heightTextfield.bringSubviewToFront(conditionalView)
        
        horizontalView.widthAnchor.constraint(equalToConstant: view.frame.size.width/3.2).isActive = true
        horizontalView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        verticalView.widthAnchor.constraint(equalToConstant: view.frame.size.width/3.2).isActive = true
        verticalView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        rectangularView.widthAnchor.constraint(equalToConstant: view.frame.size.width/3.2).isActive = true
        rectangularView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
    }
    
    func textFieldProperties(){
        diameterTextfield.delegate                = self
        diameterTextfield.autocorrectionType      = .no
        diameterTextfield.keyboardType            = .decimalPad
        diameterTextfield.inputAccessoryView      = numberToolbar
        diameterTextfield.borderStyle             = .line
        diameterTextfield.backgroundColor         = .white
        diameterTextfield.layer.borderColor       = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1.0).cgColor
        diameterTextfield.layer.borderWidth       = 2.0
        diameterTextfield.attributedPlaceholder   = NSAttributedString(string: "Diameter - (ex. 96)", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 179/255, green: 179/255, blue: 179/255, alpha: 1.0)])
        lengthTextfield.delegate                  = self
        lengthTextfield.autocorrectionType        = .no
        lengthTextfield.keyboardType              = .decimalPad
        lengthTextfield.inputAccessoryView        = numberToolbar
        lengthTextfield.borderStyle               = .line
        lengthTextfield.backgroundColor           = .white
        lengthTextfield.layer.borderColor         = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1.0).cgColor
        lengthTextfield.layer.borderWidth         = 2.0
        lengthTextfield.attributedPlaceholder     = NSAttributedString(string: "Length/Height(Verticals) - (ex. 96)", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 179/255, green: 179/255, blue: 179/255, alpha: 1.0)])
        
        incrementTextfield.optionArray            = ["0.125","0.25","0.5","1"]
        incrementTextfield.optionIds              = [1,2,3,4]
        incrementTextfield.arrow.backgroundColor  = UIColor.gray
        incrementTextfield.didSelect{(selectedText , index ,id) in
            self.incrementTextfield.text = "\(selectedText)"
        }
        incrementTextfield.inputView              = UIView()
        incrementTextfield.tintColor              = UIColor.clear
        incrementTextfield.borderStyle            = .line
        incrementTextfield.backgroundColor        = .white
        incrementTextfield.layer.borderColor      = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1.0).cgColor
        incrementTextfield.layer.borderWidth      = 2.0
        incrementTextfield.attributedPlaceholder  = NSAttributedString(string: "1", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 179/255, green: 179/255, blue: 179/255, alpha: 1.0)])
        additionalTextfield.delegate               = self
        additionalTextfield.autocorrectionType     = .no
        additionalTextfield.keyboardType           = .default
        additionalTextfield.borderStyle            = .line
        additionalTextfield.backgroundColor        = .white
        additionalTextfield.layer.borderColor      = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1.0).cgColor
        additionalTextfield.layer.borderWidth      = 2.0
        additionalTextfield.attributedPlaceholder  = NSAttributedString(string: "Additional Field", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 179/255, green: 179/255, blue: 179/255, alpha: 1.0)])
        heightTextfield.delegate                   = self
        heightTextfield.autocorrectionType         = .no
        heightTextfield.keyboardType               = .decimalPad
        heightTextfield.inputAccessoryView         = numberToolbar
        heightTextfield.borderStyle                = .line
        heightTextfield.backgroundColor            = .white
        heightTextfield.layer.borderColor          = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1.0).cgColor
        heightTextfield.layer.borderWidth          = 2.0
        heightTextfield.attributedPlaceholder      = NSAttributedString(string: "Height - (ex. 96)", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 179/255, green: 179/255, blue: 179/255, alpha: 1.0)])
    }
    
    func setUpConstraintsForLayoutViews(){
        switch UIDevice().type {
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSmax :
            appLogo.layoutAnchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, centerX: view.centerXAnchor, centerY: nil, paddingTop: 45.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 300.0, height: 100.0, enableInsets: true)
            topCustomView.layoutAnchor(top: appLogo.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 50.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 100.0/1.5, enableInsets: true)
            bottomCustomView.layoutAnchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: view.frame.size.height/9, enableInsets: true)
        default:
            appLogo.layoutAnchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, centerX: view.centerXAnchor, centerY: nil, paddingTop: 25.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 280.0, height: 80.0, enableInsets: true)
            topCustomView.layoutAnchor(top: appLogo.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 40.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 80.0/1.5, enableInsets: true)
            bottomCustomView.layoutAnchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: view.frame.size.height/9.5, enableInsets: true)
        }
        titleLabel.layoutAnchor(top: topCustomView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 10.0, paddingBottom: 0.0, paddingRight: 10.0, width: 0.0, height: 20.0, enableInsets: true)
        groupedStackView.layoutAnchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: titleLabel.rightAnchor, centerX: nil, centerY: nil, paddingTop: 5.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 30.0, enableInsets: true)
        horizontalButton.layoutAnchor(top: nil, left: horizontalView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: horizontalView.centerYAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 20.0, height: 20.0, enableInsets: true)
        horizontalLabel.layoutAnchor(top: nil, left: horizontalButton.rightAnchor, bottom: nil, right: horizontalView.rightAnchor, centerX: nil, centerY: horizontalButton.centerYAnchor, paddingTop: 0.0, paddingLeft: 10.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 0.0, enableInsets: true)
        verticalButton.layoutAnchor(top: nil, left: verticalView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: verticalView.centerYAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 20.0, height: 20.0, enableInsets: true)
        verticalLabel.layoutAnchor(top: nil, left: verticalButton.rightAnchor, bottom: nil, right: verticalView.rightAnchor, centerX: nil, centerY: verticalButton.centerYAnchor, paddingTop: 0.0, paddingLeft: 10.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 0.0, enableInsets: true)
        rectangularButton.layoutAnchor(top: nil, left: rectangularView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: rectangularView.centerYAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 20.0, height: 20.0, enableInsets: true)
        rectangularLabel.layoutAnchor(top: nil, left: rectangularButton.rightAnchor, bottom: nil, right: rectangularView.rightAnchor, centerX: nil, centerY: rectangularButton.centerYAnchor, paddingTop: 0.0, paddingLeft: 10.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 0.0, enableInsets: true)
        lineView.layoutAnchor(top: groupedStackView.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: titleLabel.rightAnchor, centerX: nil, centerY: nil, paddingTop: 5.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 1.0, enableInsets: true)
        scrollView.layoutAnchor(top: lineView.bottomAnchor, left: view.leftAnchor, bottom: infoView.topAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 0.0, enableInsets: true)
        titleLabel1.layoutAnchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 10.0, paddingBottom: 0.0, paddingRight: 10.0, width: 10.0, height: 20.0, enableInsets: true)
        textTitle1.layoutAnchor(top: titleLabel1.bottomAnchor, left: titleLabel1.leftAnchor, bottom: nil, right: titleLabel1.rightAnchor, centerX: nil, centerY: nil, paddingTop: 15.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 18.0, enableInsets: true)
        diameterTextfield.layoutAnchor(top: textTitle1.bottomAnchor, left: titleLabel1.leftAnchor, bottom: nil, right: titleLabel1.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 50.0, enableInsets: true)
        textTitle2.layoutAnchor(top: diameterTextfield.bottomAnchor, left: titleLabel1.leftAnchor, bottom: nil, right: titleLabel1.rightAnchor, centerX: nil, centerY: nil, paddingTop: 15.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 18.0, enableInsets: true)
        lengthTextfield.layoutAnchor(top: textTitle2.bottomAnchor, left: titleLabel1.leftAnchor, bottom: nil, right: titleLabel1.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 50.0, enableInsets: true)
        textTitle3.layoutAnchor(top: lengthTextfield.bottomAnchor, left: titleLabel1.leftAnchor, bottom: nil, right: titleLabel1.rightAnchor, centerX: nil, centerY: nil, paddingTop: 15.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 18.0, enableInsets: true)
        incrementTextfield.layoutAnchor(top: textTitle3.bottomAnchor, left: titleLabel1.leftAnchor, bottom: nil, right: titleLabel1.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 50.0, enableInsets: true)
        textTitle4.layoutAnchor(top: incrementTextfield.bottomAnchor, left: titleLabel1.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 15.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 100.0, height: 18.0, enableInsets: true)
        checkBoxButton.layoutAnchor(top: nil, left: textTitle4.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: textTitle4.centerYAnchor, paddingTop: 0.0, paddingLeft: 15.0, paddingBottom: 0.0, paddingRight: 0.0, width: 20.0, height: 20.0, enableInsets: true)
        lineView2.layoutAnchor(top: textTitle4.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: titleLabel.rightAnchor, centerX: nil, centerY: nil, paddingTop: 15.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 1.0, enableInsets: true)
        titleLabel2.layoutAnchor(top: lineView2.bottomAnchor, left: titleLabel1.leftAnchor, bottom: nil, right: titleLabel1.rightAnchor, centerX: nil, centerY: nil, paddingTop: 15.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 18.0, enableInsets: true)
        additionalTextfield.layoutAnchor(top: titleLabel2.bottomAnchor, left: titleLabel1.leftAnchor, bottom: nil, right: titleLabel1.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 50.0, enableInsets: true)
        conditionalView.layoutAnchor(top: additionalTextfield.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 5.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 130.0, enableInsets: true)
        titleLabel3.layoutAnchor(top: additionalTextfield.bottomAnchor, left: titleLabel1.leftAnchor, bottom: nil, right: titleLabel1.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 18.0, enableInsets: true)
        textTitle5.layoutAnchor(top: titleLabel3.bottomAnchor, left: titleLabel1.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 100.0, height: 15.0, enableInsets: true)
        heightTextfield.layoutAnchor(top: textTitle5.bottomAnchor, left: titleLabel1.leftAnchor, bottom: nil, right: titleLabel1.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 50.0, enableInsets: true)
        infoView.layoutAnchor(top: nil, left: view.leftAnchor, bottom: bottomCustomView.topAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 15.0, enableInsets: true)
        infoLabel.layoutAnchor(top: nil, left: nil, bottom: nil, right: infoView.rightAnchor, centerX: nil, centerY: infoView.centerYAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 10.0, width: 0.0, height: 0.0, enableInsets: true)
        calculateButton.layoutAnchor(top: nil, left: nil, bottom: nil, right: nil, centerX: bottomCustomView.centerXAnchor, centerY: bottomCustomView.centerYAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 0.0, enableInsets: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField != incrementTextfield{
            switch string {
            case "0","1","2","3","4","5","6","7","8","9":
                return true
            case ".":
                var decimalCount = 0
                if textField.keyboardType == .decimalPad {
                    let array = Array(textField.text!)
                    for character in array {
                        if character == "." {
                            decimalCount = decimalCount + 1
                        }
                    }
                }
                if decimalCount >= 1 {
                    return false
                } else {
                    return true
                }
            default:
                let array = Array(string)
                if array.count == 0 {
                    return true
                }
                return false
            }
        }else{
            return false
        }
    }
    
    @objc func keyboardWillShow(notification:NSNotification){
        
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}
