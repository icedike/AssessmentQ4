# AssessmentQ4
**Custom collection view cell**  
Created a new collection view cell class named "CustomCollectionViewCell". Then, putted a label in the center of the cell in order to show corresponding messages for different functions. Moreover, implement the delegate method in the UICollectionViewDelegate class to call corresponding functions when the different cells were selected.
  
**Alert View**  
Make a function named "showAlert" and show alert when the first cell was selected.  
  
**Change Background Color**  
Make a function named "changeColor" and use a variable to remember the current background color. When the second cell was selected, it would check the variable and turn to different background color.  
  
**Count Steps**  
Reference : <http://shrikar.com/ios-swift-development-step-counter-app-using-pedometer-data/>  
Basically, show steps from mid night and will update according to users movement. Need to set the motion usage description in the Info.plist to make users agree to access data.  
  
**Open Setting**  
Reference : <http://stackoverflow.com/questions/28152526/how-do-i-open-phone-settings-when-a-button-is-clicked-ios>  
Show alert and open setting. iOS 10 provided a new way to open the application. 

**Open Google Map**  
Reference : <http://stackoverflow.com/questions/32039816/how-to-open-google-maps-to-show-route-using-swift>  
It was similar to open another application. However, need to navigate to the specified destination. Therefore, we put the latitude and longitude into URL. Finally, set Info.plist in order to access google map.
``
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>comgooglemaps</string>
</array>
``

**Send Mail**  
Import MessageUI to send mail. Use "MFMailComposeViewController" to set subject and implement the delegate method in the MFMailComposeViewControllerDelegate class to handle the finishing editing. 