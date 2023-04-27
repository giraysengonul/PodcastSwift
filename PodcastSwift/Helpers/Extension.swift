//
//  Extension.swift
//  PodcastSwift
//
//  Created by hakkı can şengönül on 27.04.2023.
//

import UIKit
extension UIImageView{
    func customMode(){
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
