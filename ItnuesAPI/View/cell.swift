//
//  cell.swift
//  ItnuesAPI
//
//  Created by Preeti Priyam on 3/30/21.
//

import UIKit

class cell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var kind: UILabel!
    
    static let identifier = "cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func getNib() -> UINib{
        return UINib(nibName: cell.identifier, bundle: nil)
    }
    
}
