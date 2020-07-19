//
//  HomeHomeInitializer.swift
//  Wubba Lubba Dub Dub
//
//  Created by Vince Santos on 14/05/2020.
//  Copyright © 2020 Vince Santos. All rights reserved.
//

import UIKit

class HomeModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var homeViewController: HomeViewController!

    override func awakeFromNib() {

        let configurator = HomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: homeViewController)
    }

}
