//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Sagar Duhan on 28/05/18.
//  Copyright © 2018 Sagar Duhan. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {
    
    @IBOutlet weak var VideoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(partyRock : PartyRock) {
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.VideoPreviewImage.image = UIImage(data: data)
                }
            }catch {
                //handle the error
            }
        }
    }

}
