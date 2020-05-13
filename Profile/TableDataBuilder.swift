//
//  TableDataBuilder.swift
//  Profile
//
//  Created by Константин Киски on 13.05.2020.
//  Copyright © 2020 Константин Киски. All rights reserved.
//

import UIKit

struct STableData {
    
    var sectionHeader: String?
    var rowsIndentifier: [String]? = []
    var indentifier: String?
    
    init() {}
    
    init(sectionHeader: String?) {
        self.sectionHeader = sectionHeader
    }
}

class TableDataBuilder: NSObject {
    
    private var tableDataArray: [STableData]! = []
    private var tableData: STableData? = nil
    
    override init() {
    }
    
    func addSection() {
        if (tableData != nil) {
            tableDataArray.append(tableData!)
        }
        tableData = STableData.init()
    }
    
    func addSection(sectionName: String) {
        if(tableData != nil) {
            tableDataArray.append(tableData!)
        }
        tableData = STableData.init(sectionHeader: sectionName)
    }
    
    func addRows(rowsIndentifire: [String]) {
        tableData?.rowsIndentifier?.append(contentsOf: rowsIndentifire)
    }
    
    func addRow(rowIndentifier: String) {
        tableData?.rowsIndentifier?.append(rowIndentifier)
    }
    
    func addRows(indentifier: String? = nil, count: Int = 0){
        guard indentifier != nil else {
            return
        }
        guard count != 0 else {
            tableData?.rowsIndentifier?.append(indentifier!)
            return
        }
        for _ in 1...count {
            tableData?.rowsIndentifier?.append(indentifier!)
        }
    }
    
    func setIndentifier(indentifier: String) {
        tableData?.indentifier = indentifier
    }
    
    func generateTableData() -> [STableData] {
        if tableData != nil {
            tableDataArray.append(tableData!)
        }
        return tableDataArray
    }
}
