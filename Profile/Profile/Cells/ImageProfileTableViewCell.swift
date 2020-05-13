//
//  ImageProfileTableViewCell.swift
//  Profile
//
//  Created by Константин Киски on 13.05.2020.
//  Copyright © 2020 Константин Киски. All rights reserved.
//

import Foundation
import UIKit

class ImageProfileTableViewCell: ProfileDefaultTableViewCell {
    
    // MARK: - UI Elements
    
    @IBOutlet private weak var imageUser: UIImageView!
    @IBOutlet private weak var editButton: UIButton!
    
    // MARK: - Closure
    
    private var editProfile: () -> () = { }

    // MARK: - UI Actions
    
    @IBAction private func editButton(_ sender: Any) {
        editProfile()
    }
    
    // MARK: - Set data
    
    func setData(image: UIImage, editAction: @escaping () -> ()) {
        imageUser.image = image
        editProfile = editAction
    }
}
