//
//  ViewController.swift
//  ComplicateAppBuilders
//
//  Created by Vasile Cotovanu on 07/07/15.
//  Copyright © 2015 Vasile Cotovanu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = Data()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 110
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.talks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellTalk", forIndexPath: indexPath) as! TalkTableViewCell
        let talk = data.talks[indexPath.row]
        
        cell.TalkTitle.text = talk.title
        cell.TalkSubtitle.text = talk.subtitle
        cell.TalkSpeaker.text = talk.speaker
        cell.TalkImage.image = UIImage(named: talk.speaker)

        let timeFormatter = NSDateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        cell.TalkTime.text = timeFormatter.stringFromDate(talk.startDate)
        
        return cell
    }

}

