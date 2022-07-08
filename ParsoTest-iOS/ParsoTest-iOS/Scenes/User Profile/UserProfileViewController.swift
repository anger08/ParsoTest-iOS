//
//  UserProfileViewController.swift
//  ParsoTest-iOS
//
//  Created by Angelber Castro on 7/7/22.
//

import UIKit

protocol ProfileDisplayLogic: AnyObject {
    func displayProfile(viewModel: ProfileUser.Profile.ViewModel, on queu: DispatchQueue)
    func displayError(viewModel: ProfileUser.Error.ViewModel, on queu: DispatchQueue)
}

class UserProfileViewController: BaseViewController {

    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    let cellNibName = "ProfileCollectionViewCell"
    var profileData = [Results]()
    
    var interactor: ProfileBusinessLogic?
    var router: (NSObjectProtocol & ProfileRoutingLogic & ProfileDataPassing)?
    
    // MARK: - Object lifecycle -
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup -
    private func setup() {
        let viewController = self
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter()
        let router = ProfileRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsCollectionView()
        showLoading()
        loadData()
    }

    // MARK: - Methods -
    func settingsCollectionView(){
        profileCollectionView.register(UINib(nibName: cellNibName, bundle: nil),
                                forCellWithReuseIdentifier: ProfileCollectionViewCell.reuseIdentifier)
        profileCollectionView.layer.cornerRadius = 40
    }

    func loadData() {
        let request = ProfileUser.Profile.Request()
        interactor?.profile(request: request)
    }
}

// MARK: - ProfileDisplayLogic -
extension UserProfileViewController: ProfileDisplayLogic {
    func displayProfile(viewModel: ProfileUser.Profile.ViewModel, on queu: DispatchQueue) {
        hideLoading()
        profileData = viewModel.results
        let infoData = viewModel.infoData
        versionLabel.text = "Version \(infoData.version ?? "")"
        profileCollectionView.reloadData()
    }
    
    // Show an simple alert error
    func displayError(viewModel: ProfileUser.Error.ViewModel, on queu: DispatchQueue = .main) {
        displaySimpleAlert(with: "Error", message: viewModel.error.description)
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout -
extension UserProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.reuseIdentifier, for: indexPath) as? ProfileCollectionViewCell else {
            fatalError()
            
        }
        let resultDate = profileData[indexPath.row]
        cell.configUI(profile: resultDate)
        return cell
    }
}
