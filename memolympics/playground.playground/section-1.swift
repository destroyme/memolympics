// Playground - noun: a place where people can play

import Foundation
import UIKit

/*
func createList(){
    let bundle = NSBundle.mainBundle()
    let filePath = bundle.pathForResource("dictutf8", ofType:"txt")
    var data = NSString(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding, error: nil)
    println(String.componentsSeparatedByString("\n"))
}

createList() */

var label = UILabel()
var text = "hey pal"


//// sideScrollingLabelContainer Drawing
let labelContainerRect = CGRectMake(40, 30, 240, 40)
let labelContainerStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as NSMutableParagraphStyle
labelContainerStyle.alignment = NSTextAlignment.Center



let labelContainerFontAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 22)!, NSForegroundColorAttributeName: "black", NSParagraphStyleAttributeName: labelContainerStyle]

let labelContainerTextHeight: CGFloat = NSString(string: text).boundingRectWithSize(CGSizeMake(labelContainerRect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: labelContainerFontAttributes, context: nil).size.height

NSString(string: text).drawInRect(CGRectMake(labelContainerRect.minX, labelContainerRect.minY + (labelContainerRect.height - labelContainerTextHeight) / 2, labelContainerRect.width, labelContainerTextHeight), withAttributes: labelContainerFontAttributes)

view.addsubView()

