//
//  DetailViewController.swift
//  TrackListApp
//
//  Created by dzmitry on 4.11.22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var trackNameLabel: UILabel!
    
    // публичное св-во в которое передаем название композиции
    var trackName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fon.png")!)
        imageView.image = UIImage(named: trackName)
        trackNameLabel.text = trackName
        trackNameLabel.numberOfLines = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
