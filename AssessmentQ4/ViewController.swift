//
//  ViewController.swift
//  AssessmentQ4
//
//  Created by LIN TINGMIN on 09/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sixFunctionCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sixFunctionCollectionView.delegate = self
        sixFunctionCollectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

