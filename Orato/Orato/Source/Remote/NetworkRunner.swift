import SwiftUI
import Alamofire


struct VoidResponse : Decodable{}
struct VoidParameter : Encodable{}


final class NetworkRunner: ObservableObject {
    
    static let share = NetworkRunner()
    
    
    
    public let Secretkey = "https://scrutinizingly-lanceolate-legend.ngrok-free.dev/"
    
    let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 1000
        configuration.timeoutIntervalForResource = 1000
        let session = Session(configuration: configuration)
        return session
    }()
    
    
    // ✅ 일반 요청
    func request<Parameters: Encodable, Response: Decodable>(
        _ path: String,
        method: HTTPMethod,
        parameters: Parameters? = VoidParameter(),
        headers: HTTPHeaders? = nil,
        isAuthorization: Bool = true,
        response: Response.Type = VoidResponse.self
    ) async throws -> Response { // 아래의 파싱 과정에서 result가 nil일 수 있기에 try를 사용하기에 함수를 선언할 때  throws를 명시함
        
        var finalHeaders = headers ?? HTTPHeaders()
        
        if isAuthorization{
            if let token = UserDefaults.standard.string(forKey: "access") {
                finalHeaders.add(name: "Authorization", value: "Bearer \(token)")
            }
        }
        
        let result = session.request(
            Secretkey + path,
            method: method,
            parameters : method == .get ? nil : parameters,
            encoder: JSONParameterEncoder.default,
            headers: finalHeaders
        )
        .validate()
        // result는 requst를 통해 반환받은 데이터를 가지고 있는데, 이경우 JSON을 가지기 때문에 이를 디코딩하여 decodedresponse에 넣는 것이다.
        
        let decodedResponse = try await result.serializingDecodable(response.self).value
        return decodedResponse
    }
    
    
    // ✅ 파일 업로드
    func upload<param : Encodable>(_ endpoint: String, fileURL: URL?, parameter : param) async {
        guard let fileURL else {
            print("⚠️ fileURL이 nil입니다. 업로드 중단.")
            return
        }
        
        let uploadURL = "http://58.237.36.59:8000/assess_pronunciation_md"
        print("📤 업로드 시작: \(uploadURL)")
        
        await withCheckedContinuation { continuation in
            session.upload(
                multipartFormData: { formData in
                    formData.append(fileURL, withName: "file")
                    formData.append(try! JSONEncoder().encode(parameter), withName: "parameter")
                },
                to: uploadURL
            )
            .response { response in
                switch response.result {
                case .success(let data):
                    if let data, let str = String(data: data, encoding: .utf8) {
                        print("✅ 업로드 성공: \(str)")
                    } else {
                        print("✅ 업로드 성공 (no response body)")
                    }
                case .failure(let error):
                    print("❌ 업로드 실패: \(error.localizedDescription)")
                }
                continuation.resume()   
            }
        }
    }
}









