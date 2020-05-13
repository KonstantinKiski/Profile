//
//  CommunicationViewCell.swift
//  Profile
//
//  Created by Константин Киски on 13.05.2020.
//  Copyright © 2020 Константин Киски. All rights reserved.
//

import Foundation
import UIKit

class CommunicationViewCell: UIView {
    
    // MARK: - UI Elements
    
    @IBOutlet private weak var titleView: UILabel!
    @IBOutlet private weak var emailView: UIView!
    @IBOutlet private weak var phoneView: UIView!
    @IBOutlet private weak var phoneButton: UIButton!
    @IBOutlet private weak var emailButton: UIButton!
    
    // MARK: - Variable
    
    private var isEnabled = true // If isEnabled is true, this means that the phoneView is show, in the opposite is show mail
    
    var view: UIView!
    
    // MARK: - UI Actions

    @IBAction private func phoneButtonAction(_ sender: Any) {
        isEnabled = !isEnabled
        buttonActions()
    }
    
    @IBAction private func emailButtonAction(_ sender: Any) {
        isEnabled = !isEnabled
        buttonActions()
    }
    
    // MARK: - Set data
    
    func setData(communication: Communication) {
        titleView.text = isEnabled ? "Phone:" : "Email:"
        buttonActions()
    }
    
    private func buttonActions() {
        
        phoneView.isHidden = !isEnabled
        emailView.isHidden = isEnabled
        
        titleView.text = isEnabled ? "Phone:" : "Email:"
        if #available(iOS 13.0, *) {
            let emailImage = isEnabled ? UIImage(systemName: "circle") : UIImage(systemName: "checkmark.circle")
            emailButton.setImage(emailImage, for: .normal)
        } else {
            let emailImage = isEnabled ? UIImage(named: "circle") : UIImage(named: "checkmark")
            emailButton.setImage(emailImage, for: .normal)
        }
        if #available(iOS 13.0, *) {
            let phoneImage = isEnabled ? UIImage(systemName: "checkmark.circle") : UIImage(systemName: "circle")
            phoneButton.setImage(phoneImage, for: .normal)
        } else {
            let phoneImage = isEnabled ? UIImage(named: "checkmark") : UIImage(named: "circle")
            phoneButton.setImage(phoneImage, for: .normal)
        }
        view.layoutIfNeeded()
    }
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    // MARK: - Functions

    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CommunicationViewCell", bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        view?.prepareForInterfaceBuilder()
    }
}

