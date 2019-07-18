//  TableSettingsSection.swift
//  Copyright © 2019 Holger Hinzberg. All rights reserved.

import Foundation

// This class represents a Section/Group in the TableView
// A Section can have several TableSettingsItems

class TableSettingsSection
{
    var sectionTitle = ""
    var items = [TableSettingsItem]()
    
    convenience init()
    {
        self.init(withTitle: "")
    }
    
    init(withTitle title:String)
    {
       self.sectionTitle = title
    }
}




