import Alamofire

private let baseAPI = "https://www.howmanypeopleareinspacerightnow.com/peopleinspace.json"

struct RequestInputs {
    let params: [String: Any]?
    let path: String?
    let method: Alamofire.HTTPMethod
    let onSuccess: (Any?) -> Void
    let onFailure: (ErrorType) -> Void
    
    init(params: [String: Any]? = nil,
         path: String? = nil,
         method: Alamofire.HTTPMethod = .get,
         onSuccess: @escaping (Any?) -> Void,
         onFailure: @escaping (ErrorType) -> Void) {
        self.params = params
        self.path = path
        self.method = method
        self.onSuccess = onSuccess
        self.onFailure = onFailure
    }
}

struct Request {
    init(inputs: RequestInputs) {
        if !isReachable {
            inputs.onFailure(.connection)
            
            return
        }
        guard let url = URL(string: baseAPI) else {
            inputs.onFailure(.undefined)
            
            return
        }
        request(with: inputs, url: url)
    }
    
    private func request(with inputs: RequestInputs, url: URL) {
        
        var url = url
        if let path = inputs.path {
            url = url.appendingPathComponent(path)
        }
        
        Alamofire.request(url,
                          method: inputs.method,
                          parameters: inputs.params,
                          encoding: JSONEncoding.default).responseString(encoding: String.Encoding.utf8, completionHandler: { (response) in
                            switch response.result {
                            case .success: inputs.onSuccess(response.value)
                            case .failure: inputs.onFailure(.request(response.error))
                            }
                          })
    }
}
