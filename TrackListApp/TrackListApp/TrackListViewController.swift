//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by dzmitry on 4.11.22.
//

import UIKit

class TrackListViewController: UITableViewController {
        
        var trackList = [
            "Alberto Ruiz - 7 Elements (Original Mix)",
            "Dave Wincent - Red Eye (Original Mix)",
            "E-Spectro - End Station (Original Mix)",
            "Edna Ann - Phasma (Konstantin Yoodza Remix)",
            "Ilija Djokovic - Delusion (Original Mix)",
            "John Baptiste - Mycelium (Original Mix)",
            "Lane 8 - Fingerprint (Original Mix)",
            "Mac Vaughn - Pink Is My Favorite Color (Alex Stein Remix)",
            "Metodi Hristov, Gallya - Badmash (Original Mix)",
            "Veerus, Maxie Devine - Nightmare (Original Mix)",
            "I'm Falling in Love (Instrumental Version) - Wildflowers",
            "Theme from Gladiator (Elysium) - Movie Sounds Unlimited, Hans Zimmer",
            "I Get a Little Starstruck (Instrumental Version) - Wildflowers",
            "Russia - SXGXVX",
            "Slavianka - Jan Janko Močnik",
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackName", for: indexPath)

        // Настройка ячейки
        // по индексу подставляем все треки в ячейки (принцип метода For in)
        cell.textLabel?.text = trackList[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.image = UIImage(named: trackList[indexPath.row])

        return cell
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // меняем местами треки
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(currentTrack, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    // скрываем кнопки боковой панели удаления треков
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .none
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! DetailViewController
            detailVC.trackName = trackList[indexPath.row]
        }
    }
    

}
