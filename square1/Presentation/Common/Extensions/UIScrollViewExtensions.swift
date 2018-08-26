//
//  UIScrollViewExtensions.swift
//  square1
//
//  Created by Ricardo Antolin on 26/8/18.
//  Copyright © 2018 rantolin. All rights reserved.
//

import UIKit

extension UIScrollView {
    func  isNearBottomEdge(edgeOffset: CGFloat = 20.0) -> Bool {
        return self.contentOffset.y + self.frame.size.height + edgeOffset > self.contentSize.height
    }
}
