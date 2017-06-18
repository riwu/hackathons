import UIKit

class ActivityViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!        
    @IBOutlet var activityCell: ActivityCell!
    
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var hostLabel: UILabel!
    @IBOutlet var signUpsLabel: UILabel!
    var activity: Activity!
    
    
    private func updateSignUpLabel() {
        signUpsLabel.text = "\(activity.signUps) / \(activity.vacancy)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityCell.setActivity(activity)
        imageView.image = UIImage(named: activity.title)
        hostLabel.text = activity.host
        locationLabel.text = activity.location
        updateSignUpLabel()
    }
    
    @IBAction func onSignupPress(_ sender: UIButton) {
        activity.incrementSignUps()
        updateSignUpLabel()
        
        let alertController = UIAlertController(title: "Successfully signed up!", message: nil, preferredStyle: .alert)
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in 
            alertController.dismiss(animated: true) 
            self.dismiss(animated: true) 
        }
        present(alertController, animated: true)

    }
    
    @IBAction func onBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

