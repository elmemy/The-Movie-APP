//
//  MovieDetailsViewController.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 14/08/2021.
//

import UIKit
import Kingfisher
import RealmSwift

final class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var taglineLabel: UITextView!

    var configurator = MovieDetailsConfiguratorImplementation()
    
    var presenter: MovieDetailsPresenter?
    
    // MARK: - UIViewController Events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        imageView.applyshadowWithCorner(containerView: imageView, cornerRadious: 20)
        presenter?.checkIsFav()
        
    }
    
    @IBAction func favAction(_ sender: Any) {
        self.presenter?.isFav()
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}



extension MovieDetailsViewController: MovieDetailsView {
    func displayTitle(title: String) {
        self.titleLabel.text = title
    }
    
    func displayImage(image: String) {
        
        let url = URL(string:URLs.BaseImage + (image) )
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
            |> RoundCornerImageProcessor(cornerRadius: 0)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        
        
    }
    
    func displayDesc(Desc: String) {
        descTextView.text = Desc
    }
    
    
    func displayTagline(Tagline: String) {
        taglineLabel.text = Tagline
    }
    
    func showInteractor() {
        self.startAnimating()
    }
    
    func hideInteractor() {
        self.stopAnimating()
    }
    
    
    
    
    func showEror(error: String) {
        print(error)
        self.stopAnimating()
    }
    
    
    
    func NoData() {
        print("noData")
    }
    
    
    func isFav(isFav: Bool) {
        
        if isFav == true{
            favouriteButton.setImage(#imageLiteral(resourceName: "star"), for: .normal)
        }else{
            favouriteButton.setImage(#imageLiteral(resourceName: "star-2"), for: .normal)
        }
    }
    
    
    
}
