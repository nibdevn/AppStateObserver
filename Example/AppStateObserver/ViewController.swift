//
//  ViewController.swift
//  AppStateObserver
//
//  Created by nibdevn@gmail.com on 11/27/2020.
//  Copyright (c) 2020 nibdevn@gmail.com. All rights reserved.
//

import UIKit
import AppStateObserver

class ViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    
    var disposeBag: AppStateDisposeBag?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTappedSubscribeButton(_ sender: UIButton) {
        disposeBag?.dispose()
        disposeBag = AppStateObserver.subscribe({ (state) in
            switch state {
            case .didBecomeActive:
                self.statusLabel.text = "didBecomeActive"
            case .willResignActive:
                self.statusLabel.text = "willResignActive"
            case .willEnterForeground:
                self.statusLabel.text = "willEnterForeground"
            case .didEnterBackground:
                self.statusLabel.text = "didEnterBackground"
            case .willTerminate:
                self.statusLabel.text = "willTerminate"
            }
        })
    }

    @IBAction func onTappedDisposeButton(_ sender: UIButton) {
        disposeBag?.dispose()
        statusLabel.text = "Disposed"
    }
}
