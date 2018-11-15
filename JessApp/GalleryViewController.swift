//
//  GalleryViewController.swift
//  JessApp
//
//  Created by Wojciech Augustyn on 11/11/2018.
//  Copyright © 2018 Wojciech Augustyn. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let t1 = UITapGestureRecognizer(target: self, action: #selector(GalleryViewController.prevPressed))
        
        prevRef.addGestureRecognizer(t1)
        
        let t2 = UITapGestureRecognizer(target: self, action: #selector(GalleryViewController.nextPressed))
        
        nextRef.addGestureRecognizer(t2)
    }
    var actual = 1
   @objc func prevPressed(){
        actual -= 1
    if actual == 0 {
        actual = 24
    }
    self.imgDisplay.image = UIImage(named: "\(actual)")
    }
    @objc func nextPressed(){
        actual += 1
        if actual == 25 {
            actual = 1
        }
         self.imgDisplay.image = UIImage(named: "\(actual)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var prevRef: UIImageView!
    @IBOutlet weak var nextRef: UIImageView!
    
    @IBOutlet weak var imgDisplay: UIImageView!
    

}
