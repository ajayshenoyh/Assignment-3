
//
//  ClassFile.swift
//  Assignment3
//
//  Created by Ajay Shenoy on 3/10/17.
//  Copyright © 2017 Ajay Shenoy. All rights reserved.
//

import Foundation
class DiscountCalc{
    var Price:Double
    var DollarOff:Double
    var Discount:Double
    var Tax:Double
    var OtherDiscount:Double
    var OriginalPrice:Double
    var DiscountPrice:Double
    init(price: Double, dollaroff:Double, discount:Double, otherdiscount:Double, tax:Double, originalp:Double, discountp:Double){
        self.Price=price
        self.DollarOff=dollaroff
        self.Discount=discount
        self.Tax=tax
        self.OtherDiscount=otherdiscount
        self.OriginalPrice=originalp
        self.DiscountPrice=discountp
    }
    func first(price:Double){
        self.Price=price
    }
    func second(dollaroff:Double){
        self.DollarOff=dollaroff
        //self.DiscountPrice=self.Price-dollaroff
    }
    func third(discount:Double){
        self.Discount=discount
        //let temp = self.Price-self.DollarOff
        //self.DiscountPrice=temp-temp*self.Discount/100
    }
    
    func fourth(otherdiscount:Double) {
        self.OtherDiscount=otherdiscount
        //self.DiscountPrice-=self.DiscountPrice*otherdiscount/100
        
    }
    
    func fifth(tax:Double) {
        self.Tax=tax
        //self.OriginalPrice+=self.OriginalPrice*tax/100
        //self.DiscountPrice+=self.DiscountPrice*tax/100
        
    }
    func result()
    {
    
        var DP=Price-DollarOff
        DP-=DP*Discount/100
        DP-=DP*OtherDiscount/100
        if(DP<=0)
        {
            DP=0
        }
        DP+=DP*Tax/100
        if(DollarOff>Price)
        {
            DP=0
        }
        DiscountPrice=DP
        
        OriginalPrice=Price
        OriginalPrice+=OriginalPrice*Tax/100
        
    }
    static let DiscountData:DiscountCalc = DiscountCalc(price: 0.0, dollaroff: 0.0, discount: 0.0, otherdiscount: 0.0, tax: 0.0, originalp: 0.0, discountp: 0.0)
   
}
