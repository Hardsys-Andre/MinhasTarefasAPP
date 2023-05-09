//
//  UIView.swift
//  MinhasTarefasAPP
//
//  Created by user226298 on 5/8/23.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(cornerRadius: Double, typeCorners: CACornerMask){
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.maskedCorners = typeCorners
    }
}
