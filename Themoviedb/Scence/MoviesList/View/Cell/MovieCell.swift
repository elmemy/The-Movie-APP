//
//  MovieCell.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 13/08/2021.
//
import UIKit
import Kingfisher
class MovieCell: UITableViewCell ,MoviesListCellView{

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var imageFilm: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        selectionStyle = .none
        
        imageFilm?.applyshadowWithCorner(containerView: imageFilm, cornerRadious: 10)
        

    }

 
    
    
    func displayTitle(name: String) {
        self.titleLabel.text = name
    }
    
    func displayRate(rate: String) {
        self.rateLabel.text = rate
    }
    
    func displayImage(image: String) {
        
        let url = URL(string:URLs.BaseImage + image)
        let processor = DownsamplingImageProcessor(size: imageFilm.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 0)
        imageFilm.kf.indicatorType = .activity
        imageFilm.kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
