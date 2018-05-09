//
//  CellInfoable.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 09/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

protocol CellInfoable : NSObjectProtocol
{
    static var cellID  : String { get }
    static var cellNib : UINib  { get }
}

extension CellInfoable
{
    static var cellID  : String
    {
        return String(describing: Self.self)
    }
    
    static var cellNib : UINib
    {
        return UINib(nibName: cellID, bundle: nil)
    }
}

