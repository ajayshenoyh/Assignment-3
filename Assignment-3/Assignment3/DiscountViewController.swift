//
//  DiscountViewController.swift
//  Assignment3
//
//  Created by Ajay Shenoy on 3/8/17.
//  Copyright © 2017 Ajay Shenoy. All rights reserved.
//

import UIKit
class DiscountViewController: UIViewController, UITextFieldDelegate{
    let shared:DiscountCalc=DiscountCalc.DiscountData
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction=UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
        // Do any additional setup after loading the view.
    }
   /*
    @IBOutlet var priceValue: UITextField!
    @IBOutlet var dollarOffValue: UITextField!
    @IBOutlet var otherdiscountValue: UITextField!
    @IBOutlet var discountValue: UITextField!
    @IBOutlet var taxValue: UITextField!
 */
    func grabTextFieldValue()
    {
        if((priceValue.text)?.isEmpty)!
        {
            shared.first(price: 0)
        }
        else
        {
            shared.first(price: Double(priceValue.text!)!)
        }
        if((dollarOffValue.text)?.isEmpty)!
        {
            shared.second(dollaroff: 0)
        }
        else
        {
            shared.second(dollaroff: Double(dollarOffValue.text!)!)
        }
        if((discountValue.text)?.isEmpty)!
        {
            shared.third(discount: 0)
        }
        else
        {
            shared.third(discount: Double(discountValue.text!)!)
        }
        if(otherDiscountValue.text?.isEmpty)!
        {
            shared.fourth(otherdiscount: 0)
        }
        else
        {
            shared.fourth(otherdiscount: Double(otherDiscountValue.text!)!)
        }
        if((taxValue.text)?.isEmpty)!
        {
            shared.fifth(tax: 0)
        }
        else
        {
            shared.fifth(tax: Double(taxValue.text!)!)
        }
    }
    func didTapView(){
        self.view.endEditing(true)
    }

  
    @IBOutlet weak var discountPriceValue: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var taxValue: UITextField!
    @IBOutlet weak var otherDiscountValue: UITextField!
    @IBOutlet weak var discountValue: UITextField!
    @IBOutlet weak var dollarOffValue: UITextField!
    @IBOutlet weak var priceValue: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var count:Int=1
    @IBAction func textFieldDidEnd(_ sender: UITextField) {
        switch sender.tag {
        case 1:
            if((priceValue.text)?.isEmpty)!
            {
                shared.first(price: 0)
            }
            else
            {
            shared.first(price: Double(priceValue.text!)!)
            }
            grabValue()
        
            
        case 2:
           
            if((dollarOffValue.text)?.isEmpty)!
            {
              shared.second(dollaroff: 0)
            }
            else
            {
            shared.second(dollaroff: Double(dollarOffValue.text!)!)
            }
            grabValue()
            
           
        case 3:
            if((discountValue.text)?.isEmpty)!
            {
                shared.third(discount: 0)
            }
            else
            {
            shared.third(discount: Double(discountValue.text!)!)
            }
            grabValue()
        
            
        case 4:
            if(otherDiscountValue.text?.isEmpty)!
            {
                shared.fourth(otherdiscount: 0)
            }
            else
            {
            shared.fourth(otherdiscount: Double(otherDiscountValue.text!)!)
            }
            grabValue()
          
            
        case 5:
            if((taxValue.text)?.isEmpty)!
            {
                shared.fifth(tax: 0)
            }
            else
            {
            shared.fifth(tax: Double(taxValue.text!)!)
            }
            grabValue()
        
        default:
            grabValue()
        }

    }
    

    @IBAction func TaxDidEdit(_ sender: UITextField) {
        if((taxValue.text)?.isEmpty)!
        {
            shared.fifth(tax: 0)
        }
        else
        {
            shared.fifth(tax: Double(taxValue.text!)!)
        }
        grabValue()
    }
    
    func grabValue()
    {
        shared.result()
        view.endEditing(true)
        originalPriceLabel.text="$"+String(format: "%.2f",shared.OriginalPrice)
        discountPriceValue.text="$"+String(format: "%.2f",shared.DiscountPrice)
    }
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
            }
    func handleSwipe(_ sender:UIGestureRecognizer){
        grabTextFieldValue()
        grabValue()
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    // Enable unwinding other views

    @IBAction func unwindToCalc(segue:UIStoryboardSegue){
       grabTextFieldValue()
        grabValue()



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
