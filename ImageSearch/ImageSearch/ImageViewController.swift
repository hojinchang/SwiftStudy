//
//  ImageViewController.swift
//  ImageSearch
//
//  Created by abc on 2021/04/12.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    var imageURL: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string:imageURL!){
            let data = try? Data(contentsOf: url)
            if let realdata = data {
                imageview.image = UIImage(data: realdata)
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
