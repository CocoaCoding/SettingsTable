#  Settings Table

A UITableView is a versatile control element, but seldom is its full potential fully exploited. Most apps are limited to displaying images or text in a table. But this is by far not all the possibilities that the control offers. With a little development a UITableView is excellently suited to display the settings and options of an app. With clever programming it is even possible to synchronize the settings automatically with the UserDefaults.

## Sample useage

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

## Tech Stack

- Swift
- iOS
- Xcode

