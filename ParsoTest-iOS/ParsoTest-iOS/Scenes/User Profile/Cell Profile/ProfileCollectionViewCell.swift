//
//  ProfileCollectionViewCell.swift
//  ParsoTest-iOS
//
//  Created by Angelber Castro on 7/7/22.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewSeparator: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var ageUserLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailUserLabel: UILabel!
    @IBOutlet weak var offsetLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    static let reuseIdentifier = "ProfileViewCell"
    static let cellHeight: CGFloat = 150
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configUI(profile: Results) {
        profilePictureImageView.setImage(urlString: "\( profile.picture.large ?? "")", imageView: profilePictureImageView)
        nameLabel.text = "\(profile.name?.title ?? "") \(profile.name?.first ?? "") \(profile.name?.last ?? "")".capitalized
        userNameLabel.text = profile.login.username?.capitalized
        emailUserLabel.text = profile.email?.capitalized
        genderLabel.text = profile.gender?.capitalized
        ageUserLabel.text =  "\(profile.dob.age ?? 0)"
        phoneNumberLabel.text = profile.cell
        countryLabel.text = profile.location.country?.capitalized
        stateLabel.text = profile.location.state?.capitalized
        idLabel.text = profile.id.value
        timeZoneLabel.text = profile.location.timezone.description?.capitalized
        offsetLabel.text = profile.location.timezone.offset
    }
}
