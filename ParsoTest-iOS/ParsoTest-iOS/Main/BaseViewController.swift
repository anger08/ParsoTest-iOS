//
//  ViewController.swift
//  ParsoTest-iOS
//
//  Created by Angelber Castro on 7/7/22.
//

import UIKit

class BaseViewController: UIViewController {

    var loadingVC: LoadingIndicatorViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Alert
extension BaseViewController {
    func displaySimpleAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func hideLoading() {
        loadingVC?.remove()
        loadingVC = nil
    }
    
    func showLoading() {
        loadingVC = LoadingIndicatorViewController()
        add(loadingVC!)
        loadingVC?.view.frame = view.bounds
    }
}
