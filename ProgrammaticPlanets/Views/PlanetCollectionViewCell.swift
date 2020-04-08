//
//  PlanetCollectionViewCell.swift
//  ProgrammaticPlanets
//
//  Created by Spencer Curtis on 9/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    private var imageView = UIImageView()
    private var nameLabel = UILabel()
    
    var planet: Planet? {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
    }
    
    private func updateViews() {
        guard let planet = planet else { return }
        imageView.image = planet.image
        nameLabel.text = planet.name
    }
    
    private func setUpSubviews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        //this is the y
        NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 4).isActive = true
        
        //this is the x
        NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 4).isActive = true
        
        //this is the width, implicit width constraint using the .trailing
        NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -4).isActive = true
        
        //this is the height
        NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 1, constant: 0).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        addSubview(nameLabel)
        
        //height and width are intrinsic on lables because it depends on font and how many letters there are
        
        // puts label at bottom of the imageView, this is the y
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        
        //this is the x
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        
        //this is the width
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
    }
    
}
