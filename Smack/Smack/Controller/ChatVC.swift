//
//  ChatVC.swift
//  Smack
//
//  Created by omrobbie on 20/01/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)

        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:))))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:))))
    }
}
