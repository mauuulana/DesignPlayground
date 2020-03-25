//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    let backgroundView = UIImageView()
    let labelTitle = UILabel()
    let labelCaption = UILabel()
    let labelDescription = UILabel()
    let card = UIView()
    let backgroundCard = UIImageView()
    let closedButton = UIButton()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        backgroundView.image = UIImage(named: "Screen.png")
        backgroundView.frame = CGRect(x: 0, y: 0, width: 375, height: 667)

        labelTitle.frame = CGRect(x: 16, y: 16, width: 272, height: 38)
        labelTitle.text = "Swift Playground"
        labelTitle.numberOfLines = 2
        labelTitle.textColor = .white
        labelTitle.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        
        labelCaption.frame = CGRect(x: 16, y: 204, width: 272, height: 40)
        labelCaption.text = "Design on Playground"
        labelCaption.textColor = .white
        
        labelDescription.frame = CGRect(x: 20, y: 400, width: 335, height: 250)
        labelDescription.numberOfLines = 15
        labelDescription.textColor = .black
        labelDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        labelDescription.alpha = 0
        
        closedButton.frame = CGRect(x: 328, y: 20, width: 28, height: 28)
        closedButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        closedButton.layer.cornerRadius = 14
        closedButton.setImage(#imageLiteral(resourceName: "Action-Close.png"), for: .normal)
        closedButton.clipsToBounds = true
        closedButton.alpha = 0
        closedButton.addTarget(self, action: #selector(closedTap), for: .touchUpInside)
        
        card.frame = CGRect(x: 20, y: 255, width: 300, height: 250)
        card.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        card.layer.cornerRadius = 14
        card.layer.shadowOpacity = 0.25
        card.layer.shadowOffset = CGSize(width: 0, height: 10)
        card.layer.shadowRadius = 10
        
        let tapped = UITapGestureRecognizer(target: self, action: #selector(cardTap))
        card.addGestureRecognizer(tapped)
        card.isUserInteractionEnabled = true
        
        backgroundCard.image = UIImage(named: "ios11.jpg")
        backgroundCard.contentMode = .scaleAspectFill
        backgroundCard.frame = CGRect(x: 0, y: 0, width: 300, height: 250)
        backgroundCard.clipsToBounds = true
        backgroundCard.layer.cornerRadius = 14
        
        view.addSubview(backgroundView)
        view.addSubview(card)
        card.addSubview(backgroundCard)
        card.addSubview(labelTitle)
        card.addSubview(labelCaption)
        card.addSubview(labelDescription)
        card.addSubview(closedButton)
        self.view = view
    }
    
    @objc func cardTap() {
        let animator = UIViewPropertyAnimator(duration: 0.8, dampingRatio: 0.8) {
            self.labelTitle.frame = CGRect (x: 20, y: 20, width: 374, height: 38)
            self.labelCaption.frame = CGRect (x: 20, y: 370, width: 272, height: 40)
            self.card.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
            self.backgroundCard.frame = CGRect(x: 0, y: 0, width: 375, height: 420)
            self.card.layer.cornerRadius = 0
            self.backgroundCard.layer.cornerRadius = 0
            self.closedButton.alpha = 1
            self.labelDescription.alpha = 1
                   
        }
            animator.startAnimation(afterDelay: 1)
    }
    
    @objc func closedTap() {
        let animator = UIViewPropertyAnimator(duration: 0.8, dampingRatio: 0.8) {
            self.labelTitle.frame = CGRect (x: 16, y: 16, width: 272, height: 38)
            self.labelCaption.frame = CGRect (x: 16, y: 204, width: 272, height: 40)
            self.card.frame = CGRect(x: 20, y: 255, width: 300, height: 250)
            self.backgroundCard.frame = CGRect(x: 0, y: 0, width: 300, height: 250)
            self.card.layer.cornerRadius = 14
            self.backgroundCard.layer.cornerRadius = 14
            self.closedButton.alpha = 0
            self.labelDescription.alpha = 0
            
        }
        animator.startAnimation(afterDelay: 1)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
