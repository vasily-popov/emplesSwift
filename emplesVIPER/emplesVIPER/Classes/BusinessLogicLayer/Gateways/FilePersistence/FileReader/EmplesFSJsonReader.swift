//
//  EmplesFSJsonReader.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/7/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//
import ObjectMapper

enum EmplesFileReaderError: Error {
    case fileNotFound
    case parseError
}

extension EmplesFileReaderError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "file not found".localized
        case .parseError:
            return "parse error".localized
        }
    }
}

class EmplesFSJsonReader {
    
    func readFile(name: String) -> Result<String> {
        guard let path = Bundle.main.path(forResource: name, ofType: "json") else {
            return Result(error: EmplesFileReaderError.fileNotFound)
        }
        do {
            let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return Result(content)
        }
        catch {
            return Result(error: error)
        }
    }
    
}

extension EmplesFSJsonReader: DataRequestProtocol {

    func fetchAllAreas(with response: ((Result<[Mappable]>) -> Void)) {
        
        let result = self.readFile(name: FileNamesStrings.kRecAreaFileName)
        switch result {
            case .failure(let error):
                response(Result(error: error))
            case .success(let jsonString):
                if let areas = Mapper<EmplesRecAreaMappable>().mapArray(JSONString: jsonString) {
                    response(Result(areas))
                }
                else {
                    response(Result(error: EmplesFileReaderError.parseError))
                }
        }
    }
}
