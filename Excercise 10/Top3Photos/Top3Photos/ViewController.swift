//
//  ViewController.swift
//  Top3Photos
//
//  Created by Dimitar Stoyanov on 20.12.18.
//  Copyright © 2018 Dimitar Stoyanov. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var photos = [PHAsset]()
    var height: CGFloat {
        return 3/4 * tableView.frame.width
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell")! as! ImageCell
        PHCachingImageManager.default().requestImage(for: photos[indexPath.row], targetSize: CGSize(width: tableView.frame.width, height: height), contentMode: .aspectFill, options: nil) { (image, _) in
            cell.tableViewCell.image = image
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return height
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch PHPhotoLibrary.authorizationStatus() {
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) in
            }
        case .authorized:
            let collection = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil).firstObject
            PHAsset.fetchAssets(in: collection!, options: nil).enumerateObjects { (asset, _, _) in
                if self.photos.count < 3 {
                    self.photos.append(asset)
                }
            }
            tableView.reloadData()
        case .denied:
            break
        default:
            break
        }         // Do any additional setup after loading the view, typically from a nib.
    }


}

