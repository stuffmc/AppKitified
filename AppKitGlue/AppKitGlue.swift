//
//  Created by StuFF mc on 26.05.20.
//  Copyright © 2020 Manuel @StuFFmc Carrasco Molina. All rights reserved.
//

import Cocoa

class AppKitGlue : NSObject, AppKitProtocol {
	var statusItem: NSStatusItem?
	var menuImage: NSImage?

	public func addStatusBar() {
		let statusBar = NSStatusBar.system
		statusItem = statusBar.statusItem(withLength: NSStatusItem.variableLength)
		menuImage = NSImage(named: "GreenMenu")
		statusItem!.button!.image = menuImage
		let menu = NSMenu()
		let showMenuItem = NSMenuItem(title:"Status", action:#selector(show), keyEquivalent:",")
		menu.addItem(showMenuItem)
		statusItem!.menu = menu
	}

	@objc func show(sender: Any) {
		print("showed")
	}
}
