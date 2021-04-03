//
//  ViewController.swift
//  ImageSearch
//
//  Created by abc on 2021/04/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var textfield: UITextField!
    
    
    var arr = [String]()
    var imagesURL = [String]()

    
    var imageManager = ImageManager()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        imageManager.delegate = self
        textfield.delegate = self
        tableview.reloadData()
    }
}
//MARK: - TableviewDelegate, TableviewDatasource

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesURL.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableview.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        if let url = URL(string: imagesURL[indexPath.row]){
            let data = try? Data(contentsOf: url)
            if let realdata = data {
                cell.imageView?.image = UIImage(data: realdata)
            }
            cell.textLabel?.text = "sitename: \(arr[indexPath.row])"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print(imagesURL.count)
        default:
            print(imagesURL[indexPath.row])
        }
    }
    
}
//MARK: - UITextFieldDelegate


extension ViewController: UITextFieldDelegate {
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        textfield.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let keyword = textfield.text else {
            return
        }
        imagesURL.removeAll()
        arr.removeAll()
        imageManager.getjson(keyword: keyword)
        textfield.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textfield.text != "" {
            return true
        } else {
            textfield.placeholder = "Search Image"
            return false
        }
    }
}


//MARK: - ImageManagerDelegate

extension ViewController: ImageManagerDelegate{
    func didUpdateImage(_ imageManager: ImageManager, image: ImageModel) {
        DispatchQueue.main.async {
            self.imagesURL.append(image.imageURL)
            self.arr.append(image.sitename)
            self.tableview.reloadData()
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

