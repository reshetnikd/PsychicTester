//
//  CardViewController.swift
//  PsychicTester
//
//  Created by Dmitry Reshetnik on 23.07.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    weak var delegate: ViewController!
    
    var front: UIImageView!
    var back: UIImageView!
    var isCorrect = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 140)
        front = UIImageView(image: UIImage(named: "cardBack"))
        back = UIImageView(image: UIImage(named: "cardBack"))
        
        view.addSubview(front)
        view.addSubview(back)
        
        front.isHidden = true
        back.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            self.back.alpha = 1
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cardTapped))
        back.isUserInteractionEnabled = true
        back.addGestureRecognizer(tap)
    }
    
    @objc func cardTapped() {
        delegate.cardTapped(self)
    }
    
    @objc func wasntTapped() {
        UIView.animate(withDuration: 0.7) {
            self.view.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
            self.view.alpha = 0
        }
    }
    
    func wasTapped() {
        UIView.transition(with: view, duration: 0.7, options: [.transitionFlipFromRight], animations: { [unowned self] in
            self.back.isHidden = true
            self.front.isHidden = false
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
