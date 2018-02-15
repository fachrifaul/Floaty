//
//  String+Extensions.swift
//  KCFloatingActionButton-Sample
//
//  Created by Fachri Work on 2/15/18.
//  Copyright © 2018 kciter. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func size(OfFont font: UIFont) -> CGSize {
        return (self as NSString).size(attributes: [NSFontAttributeName: font])
    }
}
