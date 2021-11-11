//
//  DataManager.swift
//  tab-test
//
//  Created by Navid on 11/11/21.
//

import Foundation

class DataManager {
    
    typealias result<T> = (Result<T, DataError>) -> Void
    
    func loadData<T: Decodable>(of _: T.Type, from data: Data, completion: @escaping result<T>) {
        do {
            let decodedData: T = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(DataError.decodingFailed))
        }
    }
    
    @discardableResult
    func dataOfFile(fileName: String, bundle: Bundle) throws -> Data {
        guard let path = bundle.path(forResource: fileName, ofType: "json") else { throw DataError.fileNotFound }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else { throw DataError.invalidData }
        return data
    }
}

public enum DataError: Error {
    case fileNotFound
    case invalidData
    case decodingFailed
    
    var errorDescription: String {
        switch self {
        case .fileNotFound: return "file not found"
        case .invalidData: return "malformatted data in file"
        case .decodingFailed: return "cannot decode/map data to object"
        }
    }
}
