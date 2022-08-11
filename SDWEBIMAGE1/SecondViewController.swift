//
//  SecondViewController.swift
//  SDWEBIMAGE1
//
//  Created by Prince's Mac on 30/07/22.
//

import UIKit
import SDWebImage

class SecondViewController: UIViewController {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var fetchedImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
  //  @IBOutlet weak var rateLabel: UILabel!
    
  //  @IBOutlet weak var countLabel: UILabel!
    
    
    var dataFromFirstViewController: FetchedData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchedImageView.sd_setImage(with: URL(string: dataFromFirstViewController!.image), placeholderImage: UIImage(named: "placeholder.png"))
        self.idLabel.textColor = UIColor.systemBlue
        self.idLabel.text = "id: " + String(dataFromFirstViewController!.id)
        self.titleLabel.textColor = UIColor.systemBlue
        self.titleLabel.text = "title: " + dataFromFirstViewController!.title
        self.priceLabel.textColor = UIColor.systemBlue
        self.priceLabel.text = "price: " + String(dataFromFirstViewController!.price)
        self.descriptionLabel.textColor = UIColor.systemBlue
        self.descriptionLabel.text = "Description:  " + dataFromFirstViewController!.description
        self.categoryLabel.textColor = UIColor.systemBlue
        self.categoryLabel.text = "Category: "  + dataFromFirstViewController!.category
//        self.rateLabel.textColor = UIColor.systemBlue
//        self.rateLabel.text = "rate: " + String(dataFromFirstViewController!.rate)
//        self.countLabel.textColor = UIColor.systemBlue
//        self.countLabel.text = "count: " + dataFromFirstViewController!.count
    }
}
