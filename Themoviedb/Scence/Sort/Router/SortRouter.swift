//
//  SortRouter.swift
//  Themoviedb
//
//  Created by Ahmed Elmemy on 15/08/2021.
//

import UIKit


protocol SortRouter {
  
}

class SortRouterImplementation: SortRouter {
    fileprivate weak var SortViewController: SortViewController?
    
    init(SortViewController: SortViewController) {
        self.SortViewController = SortViewController
    }
    
    
}
