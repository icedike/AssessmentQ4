//
//  ViewControllerExtension.swift
//  AssessmentQ4
//
//  Created by LIN TINGMIN on 09/01/2017.
//  Copyright © 2017 MarkRobotDesignTEST. All rights reserved.
//
import UIKit
import CoreMotion
extension ViewController:UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{

    // DataSource
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 6
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        //set border line for cell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        
        switch (indexPath.item){
        case 0 :
            cell.menuLabel.text = "Show Alert"
        case 1 :
            //check the present color
            if isRed {
                cell.backgroundColor = UIColor.red
                cell.menuLabel.text = "tap to turn Blue"
            }else{
                cell.backgroundColor = UIColor.blue
                cell.menuLabel.text = "tap to turn Red"
            }
        case 2 :
            countStepToday(cell: cell)
            
        case 3 :
            cell.menuLabel.text = "Go to setting"
        case 4 :
            cell.menuLabel.text = "Navi to AC"
        default:
            break
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected \(indexPath.item)")
        switch (indexPath.item){
        case 0 :
            showAlert()
        case 1 :
            changeColor(cell: collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell)
        case 3 :
            openSetting()
        case 4 :
            openGoogleMap()
        default:
            break
        }
    }
}

extension ViewController{
    //will show alert
    func showAlert(){
        let alert = UIAlertController(title:"This is a alert", message: "Touch the first cell", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated:true, completion: nil)
    }
    //will change color from blue to red or red to blue
    func changeColor(cell:CustomCollectionViewCell){
        if isRed {
            cell.backgroundColor = UIColor.blue
            cell.menuLabel.text = "tap to turn Red"
            isRed = false
        }else{
            cell.backgroundColor = UIColor.red
            cell.menuLabel.text = "tap to turn Blue"
            isRed = true
        }
    }
    // update steps after showing the cell
    func countStepToday(cell:CustomCollectionViewCell){
        var cal = Calendar.current
        var comps = cal.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
        comps.hour = 0
        comps.minute = 0
        comps.second = 0
        let timeZone = TimeZone.current
        cal.timeZone = timeZone
        
        let midnightOfToday = cal.date(from: comps)!
        
        //show the steps from mid night
        if CMPedometer.isStepCountingAvailable(){
            print("It's available")
            // initial steps
            pedoMeter.queryPedometerData(from: midnightOfToday, to: Date(), withHandler: { (data, error) in
                if error != nil {
                    print("error:\(error?.localizedDescription)")
                }else{
                    print("did updated")
                    print("\(String(data!.numberOfSteps.intValue))")
                    DispatchQueue.main.async {
                        if let steps = data?.numberOfSteps.intValue{
                            cell.menuLabel.text = "Today's stpes:\(steps)"
                        }
                    }
                }
            })
            
            //update steps
            pedoMeter.startUpdates(from: midnightOfToday, withHandler: { (data, error) in
                if error != nil {
                    print("error:\(error?.localizedDescription)")
                }else{
                    print("did updated")
                    print("\(String(data!.numberOfSteps.intValue))")
                    DispatchQueue.main.async {
                        if let steps = data?.numberOfSteps.intValue{
                            cell.menuLabel.text = "Today's stpes:\(steps)"
                        }
                    }
                }
            })
        }else{
            print("Step counter is not available")
            cell.menuLabel.text = "Can't get motion status"
        }
    }
    //open the setting
    func openSetting(){
        let alertController = UIAlertController (title: "Information", message: "Go to Settings?", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                        print("Settings opened: \(success)") // Prints true
                    })
                } else {
                    UIApplication.shared.openURL(settingsUrl)
                }
            }else{
                print("Can't open setting")
            }
        }
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    //open google map
    func openGoogleMap(){
        guard let openGoogleMapUrl = URL(string: "comgooglemaps://?saddr=&daddr=25.052522,121.532259&directionsmode=driving") else {
            return
        }
        if UIApplication.shared.canOpenURL(openGoogleMapUrl){
            UIApplication.shared.openURL(openGoogleMapUrl)
        }else{
            print("Can't open Google map")
        }
    }
}
