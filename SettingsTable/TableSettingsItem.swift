//  TableSettingsItem.swift
//  Copyright © 2019 Holger Hinzberg. All rights reserved.

import Foundation

// Some other types may be added in the future
enum TableSettingsItemType { case none, switchType}

// This class represents one entry in the TableView

class TableSettingsItem
{
    // Displayed Text in the TableViewCell
    var title = ""
    
    // The identifier is used to sync a switch state with the UserDefaults
    var identifier = "";
    
    // Type of the Item
    var type = TableSettingsItemType.none
    
    convenience init()
    {
        self.init(withTitle: "")
        self.type = .switchType
    }
    
    init(withTitle title:String)
    {
        self.title = title
    }
}
