//  ViewController.swift
//  SettingsTable
//
//  Copyright © 2019 Holger Hinzberg. All rights reserved.

import UIKit

class TableViewCtrl: UITableViewController
{
    let settingsRepository = TableSettingsRepository()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Add some Switches to the settings
        
        let appearanceSection = TableSettingsSection(withTitle: "Appearance")
        
        let settings1 = TableSettingsItem();
        settings1.title = "Settings 1"
        settings1.identifier = "switchValue1";
        settings1.type = .switchType
        appearanceSection.items.append(settings1)
        
        let settings2 = TableSettingsItem();
        settings2.title = "Settings 2"
        settings2.identifier = "switchValue2";
        settings2.type = .switchType
        appearanceSection.items.append(settings2)
        
        let settings3 = TableSettingsItem();
        settings3.title = "Settings 3"
        settings3.identifier = "switchValue3";
        settings3.type = .switchType
        appearanceSection.items.append(settings3)
        
        settingsRepository.tableSections.append(appearanceSection)

        // Add a sceonds section to the settings

        let performanceSection = TableSettingsSection(withTitle: "Performance")
        
        let settings4 = TableSettingsItem();
        settings4.title = "Settings 4"
        settings4.identifier = "switchValue4";
        performanceSection.items.append(settings4)
        
        let settings5 = TableSettingsItem();
        settings5.title = "Settings 5"
        settings5.identifier = "switchValue5";
        performanceSection.items.append(settings5)
        
        settingsRepository.tableSections.append(performanceSection)
    }
   
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return self.settingsRepository.tableSections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
       return self.settingsRepository.tableSections[section].sectionTitle
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.settingsRepository.tableSections[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let settingsItem = self.settingsRepository.tableSections[indexPath.section].items[indexPath.row];
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = settingsItem.title
        cell?.accessoryType = .none
        
        switch settingsItem.type
        {
            case .switchType:
                
                let switchCtrl = TableSettingsSwitch()
                switchCtrl.setTableSettingsItem(item: settingsItem)
                cell?.accessoryView = switchCtrl
                break
            
            default:
                // Some other types may be added in the future
                break
        }
        
        return cell!
    }
 
    
}

