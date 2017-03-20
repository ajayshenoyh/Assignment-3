//
//  ResultViewController.swift
//  Assignment3
//
//  Created by Ajay Shenoy on 3/8/17.
//  Copyright © 2017 Ajay Shenoy. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeRight:UISwipeGestureRecognizer=UISwipeGestureRecognizer(target: self, action: #selector(HandleSwipe))
        // let swipeLeft:UISwipeGestureRecognizer=UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction=UISwipeGestureRecognizerDirection.right
        //swipeLeft.direction=UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeRight)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func HandleSwipe(_ sender:UIGestureRecognizer){
        self.performSegue(withIdentifier: "unwindToCalc", sender: self)
    }
    /*func handleSwipe(_ sender:UIGestureRecognizer){
     self.performSegue(withIdentifier: "showTest", sender: self)
     }
     
     */
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
