//
//  ViewController.swift
//  mushroom
//
//  Created by akira on 2019/09/18.
//  Copyright © 2019 akira. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // アプリ起動後にカメラ起動
    override func viewDidAppear(_ animated: Bool) {
        // Do any additional setup after loading the view.
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print("カメラは利用できます")
            // UIImagePickerControllerのインスタンス作成
            let imagePickerController = UIImagePickerController()
            // sourceTypeにcameraを設定
            imagePickerController.sourceType = .camera
            // delegate設置
            imagePickerController.delegate = self
            // モーダルビューで表示
            present(imagePickerController, animated: true, completion: nil)
        } else {
            print("カメラは利用できません")
        }
    }
    
    @IBOutlet weak var pictureImage: UIImageView!

    // カメラ撮影後の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let urlString: String = "http://172.20.10.2/cgi-bin/mushroom.py"
        let parameters: Parameters = ["foo": "bar"]
        
        // 撮影した写真を、配置したpictureImageに渡す
        pictureImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        // モーダルビューを閉じる
        dismiss(animated: true, completion: nil)
        
        // 判定用にサーバーに画像をアップロード
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                // 送信する値の指定をここでします
                multipartFormData.append(data, withName: "mushroom", fileName: "test.jpeg", mimeType: "image/jpeg")
                multipartFormData.append(sendSTR.data(using: String.Encoding.utf8)!, withName: "userId")
            },
            to: "http://~~~.com/image-upload/",
            encodingCompletion: { encodingResult in
                switch encodingResult {
                    case .success(let upload, _, _):
                        upload.responseJSON { response in
                            // 成功
                            let responseData = response
                            print(responseData)
                        }
                    case .failure(let encodingError):
                        // 失敗
                        print(encodingError)
                }
            }
        )
        
        // 判定後の結果をget
        Alamofire.request(urlString, method: .get, parameters: parameters)
        .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
            print("Progress: \(progress.fractionCompleted)")
        }
        .validate { request, response, data in
            // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
            return .success
        }
        .responseJSON { response in
            debugPrint(response)
            switch response.result {
            case .success:
                print("Success!")
            case .failure:
                print("Failure!")
            }
        }
    }
}

