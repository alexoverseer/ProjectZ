import Foundation

protocol SpacePeopleProtocol {
    func requestSpacePeopleDetails(onSuccess: @escaping (PeopleInSpaceRightNow) -> Void,
                                   onFailure: @escaping (ErrorType) -> Void)
}

struct SpacePeople: SpacePeopleProtocol {
    
    func requestSpacePeopleDetails(onSuccess: @escaping (PeopleInSpaceRightNow) -> Void,
                                   onFailure: @escaping (ErrorType) -> Void) {
        
        let onRequestSuccess: (Any?) -> Void = { response in
            guard let stringResponse = response as? String,
                let jsonData = stringResponse.data(using: .utf8) else {
                    return onFailure(.responseParse)
            }
            do {
                let spaceDetails = try JSONDecoder().decode(PeopleInSpaceRightNow.self, from: jsonData)
                onSuccess(spaceDetails)
            } catch let error {
                print(error)
                onFailure(.responseParse)
            }
        }
        
        let inputs = RequestInputs(method: .get,
                                   onSuccess: onRequestSuccess,
                                   onFailure: onFailure)
        _ = Request(inputs: inputs, encoding: .string)
    }
}
