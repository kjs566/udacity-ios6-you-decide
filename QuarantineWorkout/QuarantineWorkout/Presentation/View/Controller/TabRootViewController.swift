//
//  TabRootViewController.swift
//  QuarantineWorkout
//
//  Created by Jan Skála on 17/04/2020.
//  Copyright © 2020 Jan Skála. All rights reserved.
//

import Foundation

class TabRootViewController<VM: TabRootViewModel, FC: BaseFlowCoordinator>: BaseViewController<VM, FC>{
    override func viewDidLoad(){
        observeProperty(getVM().logoutState) { (value) in
            value?.handle(success: { (_) in
                self.hideLoadingAlert {
                    self.tabBarController?.dismiss(animated: true, completion: nil)
                }
            }, error: { (error) in
                self.hideLoadingAlert()
                self.handleError(error)
            }, loading: {
                self.showLoadingAlert(message: "Logging out...")
            })
        }
    }
    
    func logout(){
        getVM().logout()
    }
}