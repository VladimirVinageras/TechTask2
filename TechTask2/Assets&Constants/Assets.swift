//
//  Assets.swift
//  TechTask2
//
//  Created by Vladimir Vinakheras on 01.11.2024.
//

import Foundation
import UIKit

enum Asset {
    enum Images {
        static let bannerImageGirl = UIImage(named: "Image1")
        static let bannerImageSea = UIImage(named: "Image2")
        static let bannerImageUtah = UIImage(named: "Image3")
        static let bannerImageFlower = UIImage(named: "Image4")
    }
    
    
    enum Texts {
        static let bannerTitleText = "Try three days free trial"
        static let bannerSubtitleText = "You will get all premium templates, additional stickers and no ads"
    }
    
    enum Colors {
        static let backgroundColor = UIColor(hex: "#8B67EF")
        static let textColor = UIColor(hex: "#FFFFFF")
    }
    
    enum Fonts {
        static let titleBannerFont = "SFProDisplay-Semibold"
        static let subtitleBannerFont = "SFProDisplay-Regular"
    }
    
    
}
