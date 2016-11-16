//
//  NRAPlacemark.swift
//  NRACLPlacemarkDemo
//
//  Created by Sonoda Yoshinobu on 2016/11/16.
//  Copyright © 2016年 NetrailApps. All rights reserved.
//

import UIKit
import MapKit


class NRAPlacemark: NSObject {

    //動作テストモードフラグ
    //true: 動作確認用print出力あり
    //false:print出力なし
    let testMode:Bool = true
    
    
    //MARK: - LifeCycle
    //シングルトン
    static var shared: NRAPlacemark = {
        return NRAPlacemark()
    }()
    
    private override init() {
        if self.testMode {print("3.NRAPlacemark init()")}
        super.init()
    }
    
    
    //MARK: - Global Methods
    //CLLocationからTimeZoneを取得するメソッド
    func getTimeZoneAtLocation(location: CLLocation, completionHandler:@escaping (TimeZone?, NSError?) -> Void) {
     
        if self.testMode  {print ("4.NRAPlacemark getTimeZoneAtLocationメソッド 開始")}
        
        CLGeocoder().reverseGeocodeLocation(location) {(placemarks, error) in

            if self.testMode  {print ("5.CLGeocoder().reverseGeocodeLocationメソッド 実行")}

            if error != nil {
                if self.testMode  {print ("6.CLGeocoder().reverseGeocodeLocationメソッド error")}
                completionHandler(nil, error as NSError?)
            } else {
                if placemarks?.count != 0 {
                    
                    let retTimeZone = placemarks?.last?.timeZone
                    if self.testMode  {print ("6.CLGeocoder().reverseGeocodeLocationメソッド TimeZone取得")}
                    completionHandler(retTimeZone, nil)
                }
            }
        }

        if self.testMode  {print ("4.NRAPlacemark getTimeZoneAtLocationメソッド 終了")}
    }
}
