//
//  AppDelegate.swift
//  AppKitified
//
//  Created by StuFF mc on 25.05.20.
//  Copyright © 2020 Manuel @StuFFmc Carrasco Molina. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		#if targetEnvironment(macCatalyst)
		if let bundle = Bundle(path: Bundle.main.builtInPlugInsPath!.appending("/AppKitGlue.bundle")) {
			bundle.load()
			// https://blog.pendowski.com/plugin-architecture-in-swift-ish/
			if let principalClass = bundle.principalClass as? NSObject.Type,
				let appKit = principalClass.init() as? AppKitProtocol  {
					appKit.addStatusBar()
			}
		}
		#endif
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}


}

