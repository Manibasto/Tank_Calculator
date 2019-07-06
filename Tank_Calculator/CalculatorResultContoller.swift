//
//  CalculatorResultContoller.swift
//  Tank_Calculator
//
//  Created by Anil Kumar on 23/05/19.
//  Copyright © 2019 Anil Kumar. All rights reserved.
//

import UIKit
import MessageUI

class CalculatorResultContoller: UIViewController {

    lazy var appLogo             = customImageClass()
    lazy var topCustomView       = customUIViewClass()
    lazy var titleView           = customUIViewClass()
    lazy var infoView            = customUIViewClass()
    lazy var bottomCustomView    = customUIViewClass()
    lazy var resultTable         = customTableViewClass()
    
    private let headerLabel      = UILabelFactory(text: "CALCULATOR RESULTS")
        .textAlignment(with: .left)
        .textColor(with: .white)
        .textFonts(with: UIFont(name: "OpenSans-Semibold", size: 13.0)!)
        .build()
    
    let sendEmailButton          = UIButtonFactory(title: "")
        .backgroundImage(with: UIImage(named: "SendEmail")!)
        .addTarget(self, action: #selector(didEmailTap), for: .touchUpInside)
        .build()
    
    private let titleLabel       = UILabelFactory(text: "HORIZONTAL TANK CALIBRATION CHART")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 91/255, green: 91/255, blue: 91/255, alpha: 1.0))
        .textFonts(with: UIFont(name: "OpenSans-Semibold", size: 13.0)!)
        .build()
    
    private let diameterLabel    = UILabelFactory(text: "")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 91/255, green: 91/255, blue: 91/255, alpha: 0.9))
        .textFonts(with: UIFont(name: "Montserrat-Medium", size: 12.0)!)
        .build()
    
    private let lengthLabel      = UILabelFactory(text: "")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 91/255, green: 91/255, blue: 91/255, alpha: 0.9))
        .textFonts(with: UIFont(name: "Montserrat-Medium", size: 12.0)!)
        .build()
    
    private let capacityLabel    = UILabelFactory(text: "")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 91/255, green: 91/255, blue: 91/255, alpha: 0.9))
        .textFonts(with: UIFont(name: "Montserrat-Medium", size: 12.0)!)
        .build()
    
    private let infoLabel        = UILabelFactory(text: "*Chart Accuracy Not Guaranteed")
        .textAlignment(with: .left)
        .textColor(with: UIColor(red: 61/255, green: 62/255, blue: 62/255, alpha: 1.0))
        .fontSize(of: 8.0)
        .build()
    
    let doneButton               = UIButtonFactory(title: "DONE")
        .textColor(with: .white)
        .textFonts(with: UIFont(name: "OpenSans-ExtraBold", size: 18.0)!)
        .addTarget(self, action: #selector(didTapDone), for: .touchUpInside)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        appLogo.image                    = UIImage(named: "AppLogo")
        view.backgroundColor             = UIColor(red: 235/255, green: 239/255, blue: 241/255, alpha: 1.0)
        topCustomView.backgroundColor    = UIColor(red: 41/255, green: 47/255, blue: 105/255, alpha: 1.0)
        titleView.backgroundColor        = UIColor(red: 56/255, green: 62/255, blue: 108/255, alpha: 1.0)
        bottomCustomView.backgroundColor = UIColor(red: 216/255, green: 52/255, blue: 41/255, alpha: 1.0)
        setUpViews()
        setUpConstraintsForLayoutViews()
        tableProperties()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        diameterLabel.text = "Tank Diameter \(diameterReturnedValue) inches"
        lengthLabel.text = "Tank Length \(lengthReturnedValue) inches"
        capacityLabel.text = "Total Tank Capacity \(capacityReturnedValue) inches"
    }
    
    @objc func didEmailTap(){
        sendEmailTapped()
    }
    
    @objc func didTapDone(){
        navigationController?.popToRootViewController(animated: true)
    }
}

extension CalculatorResultContoller{
    
    func setUpViews(){
        view.addSubview(appLogo)
        view.addSubview(topCustomView)
        view.sendSubviewToBack(topCustomView)
        view.addSubview(titleView)
        titleView.addSubview(sendEmailButton)
        titleView.addSubview(headerLabel)
        view.addSubview(titleLabel)
        view.addSubview(diameterLabel)
        view.addSubview(lengthLabel)
        view.addSubview(capacityLabel)
        view.addSubview(resultTable)
        view.addSubview(infoView)
        infoView.addSubview(infoLabel)
        view.addSubview(bottomCustomView)
        bottomCustomView.addSubview(doneButton)
    }
    
    func tableProperties(){
        
        resultTable.register(resultHeaderTableCell.self, forCellReuseIdentifier: "resultHeaderTableCell")
        resultTable.register(ResultTableCell.self, forCellReuseIdentifier: "ResultTableCell")
        resultTable.dataSource      = self
        resultTable.delegate        = self
        resultTable.tableFooterView = UIView()
        resultTable.separatorStyle  = .none
        resultTable.allowsSelection = true
        resultTable.isScrollEnabled = true
    }
    
    func setUpConstraintsForLayoutViews(){
        switch UIDevice().type {
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSmax :
            appLogo.layoutAnchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, centerX: view.centerXAnchor, centerY: nil, paddingTop: 45.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 300.0, height: 100.0, enableInsets: true)
            topCustomView.layoutAnchor(top: appLogo.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 50.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 100.0/1.5, enableInsets: true)
            bottomCustomView.layoutAnchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: view.frame.size.height/9.5, enableInsets: true)
        default:
            appLogo.layoutAnchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, centerX: view.centerXAnchor, centerY: nil, paddingTop: 25.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 280.0, height: 80.0, enableInsets: true)
            topCustomView.layoutAnchor(top: appLogo.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 40.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 80.0/1.5, enableInsets: true)
            bottomCustomView.layoutAnchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: view.frame.size.height/10, enableInsets: true)
        }
        titleView.layoutAnchor(top: topCustomView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 40.0, enableInsets: true)
        headerLabel.layoutAnchor(top: nil, left: titleView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: titleView.centerYAnchor, paddingTop: 0.0, paddingLeft: 20.0, paddingBottom: 0.0, paddingRight: 0.0, width: view.frame.size.width/2, height: 0.0, enableInsets: true)
        sendEmailButton.layoutAnchor(top: nil, left: nil, bottom: nil, right: titleView.rightAnchor, centerX: nil, centerY: titleView.centerYAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 10.0, width: view.frame.size.width/4, height: 30.0, enableInsets: true)
        titleLabel.layoutAnchor(top: titleView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 20.0, paddingBottom: 0.0, paddingRight: 20.0, width: 0.0, height: 0.0, enableInsets: true)
        diameterLabel.layoutAnchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: titleLabel.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 0.0, enableInsets: true)
        lengthLabel.layoutAnchor(top: diameterLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: titleLabel.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 0.0, enableInsets: true)
        capacityLabel.layoutAnchor(top: lengthLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: titleLabel.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 0.0, enableInsets: true)
        resultTable.layoutAnchor(top: capacityLabel.bottomAnchor, left: view.leftAnchor, bottom: infoView.topAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 10.0, paddingLeft: 20.0, paddingBottom: 0.0, paddingRight: 20.0, width: 0.0, height: 0.0, enableInsets: true)
        infoView.layoutAnchor(top: nil, left: view.leftAnchor, bottom: bottomCustomView.topAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 15.0, enableInsets: true)
        infoLabel.layoutAnchor(top: nil, left: nil, bottom: nil, right: infoView.rightAnchor, centerX: nil, centerY: infoView.centerYAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 10.0, width: 0.0, height: 0.0, enableInsets: true)
        doneButton.layoutAnchor(top: nil, left: nil, bottom: nil, right: nil, centerX: bottomCustomView.centerXAnchor, centerY: bottomCustomView.centerYAnchor, paddingTop: 0.0, paddingLeft: 0.0, paddingBottom: 0.0, paddingRight: 0.0, width: 0.0, height: 0.0, enableInsets: true)
    }
}

extension CalculatorResultContoller: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
}

extension CalculatorResultContoller: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !inchesReturnedValue.isEmpty{
            return inchesReturnedValue.count + 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell  = tableView.dequeueReusableCell(withIdentifier: "resultHeaderTableCell", for: indexPath) as? resultHeaderTableCell
            cell?.selectionStyle = .none
            return cell!
        }else {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "ResultTableCell", for: indexPath) as? ResultTableCell
            cell?.sideALabel.text = inchesReturnedValue[indexPath.row - 1]
            cell?.sideBLabel.text = gallonsReturnedValue[indexPath.row - 1]
            cell?.selectionStyle = .none
            return cell!
        }
    }
}

extension CalculatorResultContoller: MFMailComposeViewControllerDelegate{
    
    @objc func sendEmailTapped() {
                let mailComposeViewController = configureMailComposer()
                if MFMailComposeViewController.canSendMail(){
                    self.present(mailComposeViewController, animated: true, completion: nil)
                }
    }
    
    func configureMailComposer() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients([])
        mailComposeVC.setCcRecipients(["shines@newberrytanks.com"])
        mailComposeVC.setBccRecipients(["shines@newberrytanks.com"])
        mailComposeVC.setSubject("CalculatedInformation")
        mailComposeVC.setMessageBody(mobileData, isHTML: true)
        return mailComposeVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        print(result.rawValue)
        self.dismiss(animated: true, completion: nil)
    }
}


