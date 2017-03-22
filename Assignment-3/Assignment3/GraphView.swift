//
//  GraphView.swift
//  MVC-Example
//
//  Created by Ajay Shenoy on 3/6/17.
//  Copyright © 2017 Ajay Shenoy. All rights reserved.
//

import UIKit
extension CGContext {
    func setFillColor(_ hex:Int) {
        //Mask different values of the hex code
        //0xFF0000 - Red
        //0x00FF00 - Green
        //0x0000FF - Blue
        let redColor:CGFloat = CGFloat((hex>>16)&0xFF)/255.0
        let greenColor:CGFloat = CGFloat((hex>>8)&0xFF)/255.0
        let blueColor:CGFloat = CGFloat((hex)&0xFF)/255.0
        setFillColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }
}
class GraphView: UIView {
    //let CalcData: DiscountCalc = DiscountCalc.shared
    let ResultShared:DiscountCalc=DiscountCalc.DiscountData
    override func draw(_ rect: CGRect)
    {
        let context:CGContext=UIGraphicsGetCurrentContext()!
        let screenWidth=UIScreen.main.bounds.width
        let screenHeight=UIScreen.main.bounds.height
        let leftGuide:CGFloat=16.0
        let topGuide:CGFloat=80.0 //64.0+16.0
        //let rightGuide:CGFloat=screenWidth-16.0
        //let bottomGuide:CGFloat=screenHeight-16.0
        //context.setFillColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let saveRatio=(ResultShared.OriginalPrice-ResultShared.DiscountPrice)/ResultShared.OriginalPrice
        context.setFillColor(0x84516D)
        context.fill(CGRect(x:leftGuide , y: topGuide, width: screenWidth*50/100-leftGuide, height: screenHeight-96.0))
        
        context.setFillColor(0xA26DEB)
        context.fill(CGRect(x:screenWidth*50/100 , y: topGuide, width: screenWidth*50/100-leftGuide, height: (screenHeight-96.0)*CGFloat(saveRatio)))
        
        context.setFillColor(0x8451BB)
        context.fill(CGRect(x:screenWidth*50/100 , y: topGuide+(screenHeight-96)*CGFloat((ResultShared.OriginalPrice-ResultShared.DiscountPrice)/ResultShared.OriginalPrice) , width: screenWidth*50/100-leftGuide, height: (screenHeight-96.0-(screenHeight-96.0)*CGFloat(saveRatio))))
        
        let myText1 = "Original Price"
        let subText1="$"+String(format: "%.2f",ResultShared.OriginalPrice)
        let myText2 = "You saved"
        let subText2="$"+String(format: "%.2f",ResultShared.OriginalPrice-ResultShared.DiscountPrice)
        let myText3 = "You paid"
        let subText3="$"+String(format: "%.2f",ResultShared.DiscountPrice)
        //Text Attribute
        let textAttribute = [
            NSFontAttributeName: UIFont(name:"Helvetica Bold",size: 16.0)!,
            NSForegroundColorAttributeName: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ]
        
        let myTextPos:CGPoint=CGPoint(x:leftGuide+16.0,y: topGuide+16.0)
        myText1.draw(at: myTextPos, withAttributes: textAttribute)
        subText1.draw(at: CGPoint(x:leftGuide+16.0,y: topGuide+32.0), withAttributes:textAttribute)
        
        
         if(ResultShared.DiscountPrice>ResultShared.OriginalPrice-ResultShared.OriginalPrice*15/100)
        {
            print("In case 1")
            let myTextPos2:CGPoint=CGPoint(x:leftGuide+screenWidth*50/100,y: topGuide+16.0)
            myText2.draw(at: myTextPos2, withAttributes: textAttribute)
            subText2.draw(at: CGPoint(x:leftGuide+screenWidth*50/100,y: topGuide+32.0), withAttributes:textAttribute)
            
            let myTextPos3:CGPoint=CGPoint(x:leftGuide+screenWidth*50/100,y: topGuide+96.0+(screenHeight-96)*CGFloat(saveRatio))
            myText3.draw(at: myTextPos3, withAttributes: textAttribute)
            subText3.draw(at: CGPoint(x:leftGuide+screenWidth*50/100,y: topGuide+96.0+16.0+(screenHeight-96)*CGFloat(saveRatio)), withAttributes:textAttribute)
        }
        else if(ResultShared.DiscountPrice<=ResultShared.OriginalPrice-ResultShared.OriginalPrice*90/100){
            print("In case 2")
            let myTextPos2:CGPoint=CGPoint(x:leftGuide+screenWidth*50/100,y: topGuide+16.0)
            myText2.draw(at: myTextPos2, withAttributes: textAttribute)
            subText2.draw(at: CGPoint(x:leftGuide+screenWidth*50/100,y: topGuide+32.0), withAttributes:textAttribute)
            let myTextPos3:CGPoint=CGPoint(x:leftGuide+screenWidth*50/100,y: topGuide-188.0+(screenHeight-96)*CGFloat(saveRatio))
            myText3.draw(at: myTextPos3, withAttributes: textAttribute)
            subText3.draw(at: CGPoint(x:leftGuide+screenWidth*50/100,y: topGuide-188.0+16.0+(screenHeight-96)*CGFloat(saveRatio)), withAttributes:textAttribute)
        }
        else
        {
            print("In case 3")
            let myTextPos2:CGPoint=CGPoint(x:leftGuide+screenWidth*50/100,y: topGuide+16.0)
            myText2.draw(at: myTextPos2, withAttributes: textAttribute)
            subText2.draw(at: CGPoint(x:leftGuide+screenWidth*50/100,y: topGuide+32.0), withAttributes:textAttribute)
            
            let myTextPos3:CGPoint=CGPoint(x:leftGuide+screenWidth*50/100,y: topGuide+16.0+(screenHeight-96)*CGFloat(saveRatio))
            myText3.draw(at: myTextPos3, withAttributes: textAttribute)
            subText3.draw(at: CGPoint(x:leftGuide+screenWidth*50/100,y: topGuide+32.0+(screenHeight-96)*CGFloat(saveRatio)), withAttributes:textAttribute)
        }
        
    }
    
}
