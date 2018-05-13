//
//  DataControllerDelegate.swift
//  ArticlesApp
//
//  Created by Ron Haimovich on 08/05/2018.
//  Copyright © 2018 Ron Haimovich. All rights reserved.
//

import UIKit

protocol DataControllerDelegate:class
{
    func refreshUI()
    func performSegue(withIdentifier identifier: String, sender: Any?)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}
