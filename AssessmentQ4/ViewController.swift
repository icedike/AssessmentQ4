//
//  ViewController.swift
//  AssessmentQ4
//
//  Created by LIN TINGMIN on 09/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var isRed = false
    
    let pedoMeter = CMPedometer()
    
    @IBOutlet weak var sixFunctionCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sixFunctionCollectionView.delegate = self
        sixFunctionCollectionView.dataSource = self
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

