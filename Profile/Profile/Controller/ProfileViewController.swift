//
//  ProfileViewController.swift
//  Profile
//
//  Created by Константин Киски on 13.05.2020.
//  Copyright © 2020 Константин Киски. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - UI Elements
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Variables
    
    private var tableData: ProfileTableData?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoad()
    }
    
    // MARK: - Func
    private func startLoad() {
        let user = User()
        tableData = ProfileTableData(user: user)
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData?.getSectionCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData?.getItemsInSectionCount(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableData?.setHeaderView(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableData?.setHeaderInSectionHeight(section: section) ?? CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: (tableData?.getIdentifireCellByIndexPath(path: indexPath))!, for: indexPath)
        return tableData?.setData(to: cell, by: indexPath) ?? cell
    }
}
