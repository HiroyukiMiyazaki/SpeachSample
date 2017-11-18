//
//  SettingViewControlloer.swift
//  SpeachSample
//
//  Created by 宮崎裕之 on 2017/11/05.
//  Copyright © 2017年 Hiroyuki Miyazaki. All rights reserved.
//

import UIKit
import  AVFoundation

class SettingViewControlloer: UITableViewController {

    var rate:Float = AVSpeechUtteranceDefaultSpeechRate
    var pitchMultiplier:Float = 1.0
    var volume:Float = 1.0
    var preUtternceDelay:TimeInterval = 0.0
    
    @IBOutlet weak var rateSlider:UISlider!
    @IBOutlet weak var pitchMultiplierSlider : UISlider!
    @IBOutlet weak var volumeSlider : UISlider!
    @IBOutlet weak var preUtteranceDelyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        rateSlider.maximumValue = AVSpeechUtteranceMaximumSpeechRate
        rateSlider.minimumValue = AVSpeechUtteranceMinimumSpeechRate
        rateSlider.value = rate
        
        pitchMultiplierSlider.value = pitchMultiplier
        volumeSlider.value = volume
        preUtteranceDelyTextField.text = String(preUtternceDelay)
        
        self.navigationItem.title = "設定"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        var preUtteranceDely: Float = 0.0
        if let text = preUtteranceDelyTextField.text{
            if let floatValue = Float(text){
                preUtteranceDely = floatValue
            }
        }

        let userDefaults = UserDefaults.standard
        
        userDefaults.set(rateSlider.value, forKey:"rate")
        userDefaults.set(pitchMultiplierSlider.value, forKey: "pitchMultiplier")
        userDefaults.set(volumeSlider.value, forKey:"volume")
        userDefaults.set(preUtteranceDely, forKey: "preUtteranceDelay")
        
        userDefaults.synchronize()
        
        let viewController:ViewController = segue.destination as! ViewController
        viewController.rate = rateSlider.value
        viewController.pitchMultiplier = pitchMultiplierSlider.value
        viewController.volume = volumeSlider.value
        viewController.preUtternceDelay = TimeInterval(preUtteranceDely)
        
        
    }
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
