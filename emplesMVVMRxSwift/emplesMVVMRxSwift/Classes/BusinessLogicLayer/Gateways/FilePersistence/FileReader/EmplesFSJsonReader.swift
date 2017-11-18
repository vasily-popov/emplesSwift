//
//  EmplesFSJsonReader.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/7/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import RxSwift

enum EmplesFileReaderError: Error {
    case fileNotFound
    case invalidJSON(String)
}

extension EmplesFileReaderError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "file not found".localized
        case .invalidJSON (let value):
            return value
        }
    }
}

class EmplesFSJsonReader {
    
    init() {
        
    }
    
    deinit {
        
    }
    
    private func readFile(name: String) -> Observable<Data> {
        
        return Observable
            .just(Bundle.main.url(forResource: name, withExtension: "json"))
            .map { (url) -> Data in
                guard let url = url else {
                    throw EmplesFileReaderError.fileNotFound
                }
                return try Data(contentsOf: url)
            }
    }

    func fetchAllAreas() -> Observable<[RecArea]> {
        return self.readFile(name: FileNamesStrings.kRecAreaFileName)
            .map({ data in
                guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
                      let result = jsonObject as? [[String: Any]] else {
                        throw EmplesFileReaderError.invalidJSON(FileNamesStrings.kRecAreaFileName)
                }
                return result.flatMap(RecArea.init)
            })
    }
}
