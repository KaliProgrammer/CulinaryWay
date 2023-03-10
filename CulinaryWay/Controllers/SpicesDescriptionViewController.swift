
import UIKit

class SpicesDescriptionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigation()
    }
    
    func setupNavigation() {
        view.backgroundColor = .white
        self.navigationItem.title = "Главная"
        self.navigationItem.largeTitleDisplayMode = .always
    }

}
