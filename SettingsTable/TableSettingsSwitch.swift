//  TableSettingsSwitch.swift
//  Copyright © 2019 Holger Hinzberg. All rights reserved.

import UIKit

class TableSettingsSwitch: UISwitch
{
    private var settingsItem: TableSettingsItem? = nil
    
    override init(frame: CGRect)
    {
       super.init(frame:frame)
       self.addTarget(self, action: #selector(switchValueChanged(sender:)), for: .valueChanged)
    }
    
    func setTableSettingsItem(item : TableSettingsItem)
    {
        self.settingsItem = item
        self.isOn = UserDefaults.standard.bool(forKey: item.identifier)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func switchValueChanged(sender : TableSettingsSwitch)
    {
        if let item = sender.settingsItem
        {
            print("changed \(item.title) \(sender.isOn)")
            UserDefaults.standard.set(sender.isOn, forKey: item.identifier)
        }
    }
}
