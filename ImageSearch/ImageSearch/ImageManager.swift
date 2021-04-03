import Foundation
import Alamofire
import SwiftyJSON

protocol ImageManagerDelegate {
    func didUpdateImage(_ imageManager: ImageManager, image: ImageModel)
    func didFailWithError(error: Error)
}

struct ImageManager {
    // json 파일 찾아내기
    
    var delegate: ImageManagerDelegate?

    func getjson(keyword: String) {
        let kakaokey = "4cb12b37dea1b5790ed8cb3fa10ed074"
        let url = "https://dapi.kakao.com/v2/search/image?query=\(keyword)"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: ["Authorization": "KakaoAK \(kakaokey)"]
        ).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for i in 0..<json["documents"].count{
                    self.delegate?.didUpdateImage(self, image: parseJSON(data: json, index: i))
                }
                // json을 어떻게 넘겨주어야 하는가??
                // 왜 디코드는 안해도되는거지??
                // urlsession과 다른 것을 한번 알아봐야할듯하다
                //parseJSON(imageData: value)
            case .failure(let error):
                self.delegate?.didFailWithError(error: error)
                DispatchQueue.main.async {
                    print("검색도중 에러발생")
                }
            }
        }
        
    }
    
    func parseJSON(data: JSON, index: Int)->ImageModel{
        let collection = data["documents"][index]["collection"].stringValue
        let imageURL = data["documents"][index]["image_url"].stringValue
        let thumbnailURL = data["documents"][index]["thumbnail_url"].stringValue
        let sitename = data["documents"][index]["display_sitename"].stringValue
        let image = ImageModel(collection: collection, imageURL: imageURL, thumbnailURL: thumbnailURL, sitename: sitename)
        return image
    }
}

