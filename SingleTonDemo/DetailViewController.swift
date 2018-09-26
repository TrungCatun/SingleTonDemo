//
//  ViewController.swift
//  SingleTonDemo
//
//  Created by trung on 2018/08/20.
//  Copyright © 2018 trung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textFieldDetailViewController: UITextField!
    var dataTake: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if dataTake != nil {
            textFieldDetailViewController.text = dataTake
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        dataTake = textFieldDetailViewController.text
    }


}

