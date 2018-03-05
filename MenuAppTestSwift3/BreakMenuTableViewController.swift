//
//  BreakMenuTableViewController.swift
//  MenuAppTestSwift3
//
//  Created by creid on 2/5/18.
//  Copyright © 2018 creid. All rights reserved.
//

import UIKit

class BreakMenuTableViewController: UITableViewController {

    var dictMenu=[String:String]()
    var arrayMenu=NSMutableArray()
    let bundle=Bundle.main
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path=bundle.path(forResource: "TU_Break", ofType: "txt")
        
        let filemgr=FileManager.default
        if filemgr.fileExists(atPath: path!){
            do{
                let fullText = try String(contentsOfFile: path!, encoding: .utf8)
                let newLineChars=NSCharacterSet.newlines
                let readings=fullText.components(separatedBy: newLineChars).filter{!$0.isEmpty} as [String]
                for i in 1..<readings.count {
                    let menuInfo=readings[i].components(separatedBy: "\t")
                    
                    
                    if menuInfo.count >= 1 {
                        self.tableView.reloadData()
                    }
                    
                    dictMenu["Day"] = "\(menuInfo[0])"
                    dictMenu["Menu"] = "\(menuInfo[1])"
                    dictMenu["Food"] = "\(menuInfo[2])"
                    
                    arrayMenu.add(dictMenu)
                }
            }catch let error as NSError {
                    print("Error:\(error)")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayMenu.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let menuList = arrayMenu[indexPath.row]
        
        cell.textLabel?.text="\((menuList as AnyObject).object(forKey: "Day") as! String)"
        cell.detailTextLabel?.text="Station: " + "\((menuList as AnyObject).object(forKey: "Menu") as! String) " + "Food: " + "\((menuList as AnyObject).object(forKey: "Food") as! String)"
        
        return cell
    }
    
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
