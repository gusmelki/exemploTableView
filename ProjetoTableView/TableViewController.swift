//
//  TableViewController.swift
//  ProjetoTableView
//
//  Created by Usuário Convidado on 25/02/16.
//  Copyright © 2016 Usuário Convidado. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var arrItens:[[String: String]] = [["nome":"Fusca", "cod":"0"],["nome":"Fiat 147","cod":"1"],["nome":"Landal", "cod":"2"], ["nome":"Ferrari","cod":"3"], ["nome": "Golf" ,"cod":"4"], ["nome":"Mercedes","cod":"5"], ["nome":"Porche","cod":"6"], ["nome":"BMW" ,"cod":"7"], ["nome":"Audi" ,"cod":"8"]]
    
    var arrSections : [[[String:String]]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        for (var i = 0; i < self.tableView.numberOfSections; i++){
            self.arrSections.append(self.getItensToSection(i))
    
        }
        
        
        // Registra o refresh control
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: "doRefresh", forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl?.tintColor = UIColor.grayColor()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.arrSections[section].count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath) as! MyTableViewCell
        
        let secArr : [[String:String]] = self.arrSections[indexPath.section]
        let carro = secArr[indexPath.row]
        cell.myTitleLabel.text = carro["nome"]
//        cell.textLabel?.text = carro["nome"]
//        cell.imageView?.image = UIImage(named: "carro")
//        cell.detailTextLabel?.text = "texto secundario"
//        cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        
        
        return cell
    }
    

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
//        if (indexPath.row == 2){
//            return 20
//        }
        
        return 100
    }
    
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        
        let alert: UIAlertController = UIAlertController(title: "Accessory", message: "Indice: \(indexPath.row)", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header: UIImageView = UIImageView(image: UIImage(named: "header"))
        
        return header
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer: UIImageView = UIImageView(image: UIImage(named: "footer"))
        return footer
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("listToDetailSegue", sender: indexPath)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "listToDetailSegue"){
        
//            let vc : DetailViewController = segue.destinationViewController as! DetailViewController
//            vc.index = (sender?.row)!
        }
    }
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            tableView.beginUpdates()
            self.arrSections[indexPath.section].removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            tableView.endUpdates()
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    func getItensToSection(aSectionNum: Int) -> [[String:String]]{
        
        var arrRet:[[String:String]] = []
        
        if (aSectionNum == 0){
            for dic in self.arrItens{
                if(Int(dic["cod"]!) < 4){
                    arrRet.append(dic)
                }
            }
        }else{
            for dic in self.arrItens{
                if(Int(dic["cod"]!) >= 4){
                    arrRet.append(dic)
                }
            }
    
        }
    return arrRet
    
    }
    
    
    func doRefresh(){
       
         arrSections[0].append(["nome":"GOLETA" ,"cod":"9"])
         self.tableView.reloadData()
         self.refreshControl?.endRefreshing()
        
    }
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
