//
//  ProfileTableData.swift
//  Profile
//
//  Created by Константин Киски on 13.05.2020.
//  Copyright © 2020 Константин Киски. All rights reserved.
//

import UIKit
import Foundation

class ProfileTableData {
    
    // MARK: - Enums
    
    /// Cells for Profile view
    ///
    /// profileImageCell: cell with user image and edit button
    /// communicationCell: cell with choice preffered contact methods
    /// infoCell: Universal cell with 2 labels(title and description)
    enum ProfileCells: String {
        case profileImageCell = "profileImageCell"
        case communicationCell = "communicationCell"
        case infoCell = "infoCell"
    }
    
    // MARK: - Variables
    
    private var cachedData: [STableData]! = []
    private var user: User?
    
    // MARK: - Initilized
    
    required init(user: User) {
        self.user = user
        
        update()
    }
    
    // MARK: - Functions
    
    func update() {
        let tableDataBuilder : TableDataBuilder = TableDataBuilder()
        cachedData.removeAll()
        
        tableDataBuilder.addSection()
        tableDataBuilder.addRows(rowsIndentifire: [ProfileCells.profileImageCell.rawValue])
        
        tableDataBuilder.addSection()
        tableDataBuilder.addRows(indentifier: ProfileCells.infoCell.rawValue, count: 3)
        
        tableDataBuilder.addSection()
        tableDataBuilder.addRows(indentifier: ProfileCells.infoCell.rawValue, count: 4)
        tableDataBuilder.addRows(rowsIndentifire: [ProfileCells.communicationCell.rawValue])
        tableDataBuilder.addRows(indentifier: ProfileCells.infoCell.rawValue, count: 6)
        
        cachedData = tableDataBuilder.generateTableData()
    }
    
    // MARK: - UITableViewDelegate & UITableViewDataSource
    
    func getSectionCount() -> Int {
        return cachedData.filter({$0.rowsIndentifier!.count > 0}).count
    }
    
    func cachedDataElementNotEmpty(cachedData: STableData) -> Bool! {
        let notEmpty: Bool = cachedData.rowsIndentifier!.count > 0 ? true : false
        return notEmpty
    }
    
    func getItemsInSectionCount(section: Int) -> Int {
        let currentCount: Int = cachedDataElementNotEmpty(cachedData: cachedData[section]) ? cachedData[section].rowsIndentifier!.count : 0
        return currentCount
    }
    
    func getIdentifireCellByIndexPath(path: IndexPath) -> String? {
        if cachedData.filter({($0.rowsIndentifier?.count)! > 0})[path.section].rowsIndentifier?.count != 0  {
            return cachedData.filter({($0.rowsIndentifier?.count)! > 0})[path.section].rowsIndentifier?[path.row]
        }
        return cachedData.filter({($0.rowsIndentifier?.count)! > 0})[path.section].indentifier
    }
    
    func setHeaderView(section: Int) -> UIView? {
        switch section {
        case 2:
            let headerView = HeaderTableView()
            headerView.titleHeader.text = "Professional Information:"
            return headerView
        default:
            return UIView()
        }
    }
    
    func setHeaderInSectionHeight(section: Int) -> CGFloat {
        switch section {
        case 2:
            return 60.0
        default:
            return CGFloat.leastNonzeroMagnitude
        }
    }
    
    func setData(to cell: UITableViewCell, by indexPath: IndexPath) -> UITableViewCell? {
        let cellType = ProfileCells(rawValue: cell.reuseIdentifier ?? "")
        switch cellType {
        case .profileImageCell?:
            let profileImageCell = cell as? ImageProfileTableViewCell
            let action = {
                print("editAction")
            }
            if #available(iOS 13.0, *) {
                profileImageCell?.setData(image: UIImage(systemName: "person")!, editAction: action)
            } else {
                profileImageCell?.setData(image: UIImage(named: "person")!, editAction: action)
            }
            if indexPath.row == 0 && indexPath.section == 0 {
                profileImageCell?.hideBottomLine = false
            } else {
                profileImageCell?.hideBottomLine = true
            }
            return profileImageCell
        case .communicationCell?:
            let communicationCell = cell as? CommunicationTableViewCell
            communicationCell?.setData(communication: user!.communication)
            communicationCell?.hideShortSeparator = false
            return communicationCell
        case .infoCell?:
            let infoCell = cell as? ProfileDefaultTableViewCell
            infoCell?.hideShortSeparator = false
            switch indexPath.section {
            case 1:
                switch indexPath.row {
                case 0:
                    infoCell?.setData(data: ProfileDefaultTableViewCell.DataDefaultCell(title: "Name:", descriptionText: user?.fullname))
                case 1:
                    infoCell?.setData(data: ProfileDefaultTableViewCell.DataDefaultCell(title: "Username:", descriptionText: user?.userName))
                case 2:
                    infoCell?.setData(data: ProfileDefaultTableViewCell.DataDefaultCell(title: "Email:", descriptionText: user?.email))
                    if indexPath.row == 2 && indexPath.section == 1 {
                        infoCell?.hideBottomLine = false
                    } else {
                        infoCell?.hideBottomLine = true
                    }
                default:
                    break
                }
            case 2:
                switch indexPath.row {
                case 0:
                    infoCell?.setData(data: ProfileDefaultTableViewCell.DataDefaultCell(title: "Profession", descriptionText: user?.profession.name))
                case 1:
                    infoCell?.setData(data: ProfileDefaultTableViewCell.DataDefaultCell(title: "Industry", descriptionText: user?.profession.industry))
                case 2:
                    infoCell?.setData(data: ProfileDefaultTableViewCell.DataDefaultCell(title: "Skills", descriptionText: user?.profession.skills))
                case 3:
                    infoCell?.setData(data: ProfileDefaultTableViewCell.DataDefaultCell(title: "Profession details:", descriptionText: user?.profession.details))
                case 5:
                    infoCell?.setData(data: ProfileDefaultTableViewCell.DataDefaultCell(title: "Location of Services:", descriptionText: user?.location.locationOfServices))
                case 6:
                    infoCell?.setData(data: ProfileDefaultTableViewCell.DataDefaultCell(title: "Instagram:", descriptionText: user?.communication.instagram))
                case 7:
                    infoCell?.setData(data: ProfileDefaultTableViewCell.DataDefaultCell(title: "Facebook:", descriptionText: user?.communication.facebook))
                case 8:
                    infoCell?.setData(data: ProfileDefaultTableViewCell.DataDefaultCell(title: "Website:", descriptionText: user?.communication.website))
                case 9:
                    infoCell?.setData(data: ProfileDefaultTableViewCell.DataDefaultCell(title: "Company:", descriptionText: user?.location.company))
                case 10:
                    infoCell?.setData(data: ProfileDefaultTableViewCell.DataDefaultCell(title: "Address:", descriptionText: user?.location.address))
                default:
                    break
                }
            default:
                break
            }
            return infoCell
        default:
            return cell
        }
    }
}

