//
//  ViewController.swift
//  NRACLPlacemarkDemo
//
//  Created by Sonoda Yoshinobu on 2016/11/16.
//  Copyright © 2016年 NetrailApps. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {

    
    //動作テストモードフラグ
    //true: 動作確認用print出力あり
    //false:print出力なし
    let testMode:Bool = true
    
    
    @IBOutlet weak var latTextField: UITextField!
    @IBOutlet weak var lonTextField: UITextField!
    @IBOutlet weak var resultTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func getTimeZone(_ sender: Any) {
    
        if self.testMode {print("1.ViewController getTimeZoneメソッド開始")}
        
        self.resultTextView.text = nil
        
        let lat = CLLocationDegrees(self.latTextField.text!)
        let lon = CLLocationDegrees(self.lonTextField.text!)
        let location = CLLocation(latitude: lat!, longitude: lon!)
        
        //CLLocationからTimeZoneを取得する
        NRAPlacemark.shared.getTimeZoneAtLocation(location: location, completionHandler: { (timezone, error) in
            
            if self.testMode {print ("2.NRAPlacemark getTimeZoneAtLocationメソッド TimeZone取得後処理")}
            
            
            
            //以下にtimezone取得後の処理を記述する
            //以下のコードは動作のテスト用のサンプルコード
            if error != nil {
                self.resultTextView.text = String(describing: error)
            } else {
                self.resultTextView.text = String(describing: timezone)
            }
            
            
            
        })
        
        if self.testMode {print ("1.ViewController getTimeZoneメソッド終了")}
    }
}
