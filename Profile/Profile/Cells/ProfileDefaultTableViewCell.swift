//
//  ProfileDefaultTableViewCell.swift
//  Profile
//
//  Created by Константин Киски on 13.05.2020.
//  Copyright © 2020 Константин Киски. All rights reserved.
//

import Foundation
import UIKit

class ProfileDefaultTableViewCell: UITableViewCell {

    // MARK: - Structure
    
    struct DataDefaultCell {
        var title: String?
        var descriptionText: String?
    }
    
    // MARK: - UI Elements
    
    @IBOutlet private weak var titleCell: UILabel!
    @IBOutlet private weak var descriptionCell: UILabel!
    
    // MARK: - Variables
    
    var hideShortSeparator: Bool = true {
        didSet {
            shortSeparator?.isHidden = hideShortSeparator
        }
    }
    
    var hideBottomLine: Bool = true {
        didSet {
            bottomLine?.isHidden = hideBottomLine
        }
    }
    
    private var shortSeparator: UIView?
    private var bottomLine: UIView?

    // MARK: - Set data
    
    func setData(data: DataDefaultCell) {
        self.titleCell.text = data.title
        self.descriptionCell.text = data.descriptionText
    }
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        shortSeparator = UIView.init(frame: CGRect(x: 120.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 0.5))
        shortSeparator?.isHidden = true
        shortSeparator?.backgroundColor = .separator
        self.contentView.addSubview(shortSeparator!)
        
        bottomLine = UIView.init(frame: CGRect(x: 15.0, y: contentView.frame.height-0.5, width: UIScreen.main.bounds.size.width, height: 0.5))
        bottomLine?.isHidden = true
        bottomLine?.backgroundColor = .separator
        self.contentView.addSubview(bottomLine!)
    }
}
