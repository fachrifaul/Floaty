//
//  ViewController.swift
//  KCFloatingActionButton
//
//  Created by LeeSunhyoup on 2015. 10. 4..
//  Copyright © 2015년 kciter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FloatyDelegate {
    
    var floaty = Floaty()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        layoutFAB()
        
        let uiview = UIView()
        
        let inter = "International"
        let lokas = "Lokal"
        let font = UIFont.systemFont(ofSize: 14)
        let interwidth = inter.size(OfFont: font).width
        let interheight = inter.size(OfFont: font).height
        let width = interwidth + 20
        let height = interheight + 10
        
        print("#inter \(inter.size(OfFont: font).width)")
        print("#lokal \(lokas.size(OfFont: font).width)")
        
        uiview.frame = CGRect(x: 64, y: 64, width: width, height: height)
        
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: width, height: height), cornerRadius: 20).cgPath
        layer.fillColor = UIColor.red.cgColor
        
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: width/2 - interwidth/2, y: height/2 - interheight/2, width: width, height: height)
        textLayer.string = inter
        textLayer.foregroundColor = UIColor.darkGray.cgColor
        textLayer.fontSize = 14
        textLayer.isWrapped = true
        textLayer.alignmentMode = kCAAlignmentLeft
        textLayer.contentsScale = UIScreen.main.scale
        
        uiview.layer.addSublayer(layer)
        uiview.layer.addSublayer(textLayer)
        uiview.center.x = self.view.center.x
        self.view.addSubview(uiview)
    }

    @IBAction func endEditing() {
        view.endEditing(true)
    }
    
    @IBAction func customImageSwitched(_ sender: UISwitch) {
        if sender.isOn == true {
            floaty.buttonImage = UIImage(named: "custom-add")
        } else {
            floaty.buttonImage = nil
        }
    }
    
    func layoutFAB() {
        let item = FloatyItem()
        item.hasShadow = false
        item.buttonColor = UIColor.blue
        item.circleShadowColor = UIColor.red
        item.titleShadowColor = UIColor.blue
        item.titleLabelPosition = .right
        item.title = "titlePosition right"
        item.handler = { item in
            
        }
        
        let item0 = FloatyItem()
        item0.itemTextType = .text
        item0.itemType = .rounded
        item0.buttonColor = UIColor.orange
        item0.titleColor = UIColor.white
        item0.titleText = "International"
        
        let item1 = FloatyItem()
        item1.itemTextType = .text
        item1.itemType = .rounded
        item1.buttonColor = UIColor.orange
        item1.titleColor = UIColor.white
        item1.titleText = "Lokal"

        floaty.buttonImageAnimated = false
        floaty.hasShadow = false
//        floaty.addItem(title: "I got a title")
//        floaty.addItem("I got a icon", icon: UIImage(named: "icShare"))
//        floaty.addItem("I got a handler", icon: UIImage(named: "icMap")) { item in
//            let alert = UIAlertController(title: "Hey", message: "I'm hungry...", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Me too", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        }
//        floaty.addItem(item: item)
        floaty.addItem(item: item0)
        floaty.addItem(item: item1)
        floaty.paddingX = self.view.frame.width/2 - floaty.frame.width/2
        floaty.fabDelegate = self
        
        self.view.addSubview(floaty)

    }
    
    // MARK: - Floaty Delegate Methods
    func floatyWillOpen(_ floaty: Floaty) {
        print("Floaty Will Open")
    }
    
    func floatyDidOpen(_ floaty: Floaty) {
        print("Floaty Did Open")
    }
    
    func floatyWillClose(_ floaty: Floaty) {
        print("Floaty Will Close")
    }
    
    func floatyDidClose(_ floaty: Floaty) {
        print("Floaty Did Close")
    }
}
