//
//  CommunicationTableViewCell.swift
//  Profile
//
//  Created by Константин Киски on 13.05.2020.
//  Copyright © 2020 Константин Киски. All rights reserved.
//

import Foundation
import UIKit

class CommunicationTableViewCell: ProfileDefaultTableViewCell {
    
    // MARK: - UI Elements
    
    @IBOutlet private weak var communicationView: CommunicationViewCell!
    
    // MARK: - Set data
    
    func setData(communication: Communication) {
        communicationView.setData(communication: communication)
    }
}
