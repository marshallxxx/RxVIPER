//
//  RestClient.swift
//  VIPER
//
//  Created by Evghenii Nicolaev on 08/02/2018.
//  Copyright © 2018 Tigerspike. All rights reserved.
//

import Foundation

public typealias RestResultCallback = (Data?, URLResponse?, Error?) -> ()

public protocol RestClient {
    var globalHeaders: [String: String] { get }

    func doGet(url: String,
               parameters: [String: String]?,
               headers: [String: String]?,
               onResponse: @escaping RestResultCallback)
    func doPost(url: String,
                parameters: [String: String]?,
                headers: [String: String]?,
                body: Data?,
                onResponse: @escaping RestResultCallback)
    func doDelete(url: String,
                  parameters: [String: String]?,
                  headers: [String: String]?,
                  body: Data?,
                  onResponse: @escaping RestResultCallback)
    func doPut(url: String,
               parameters: [String: String]?,
               headers: [String: String]?,
               body: Data?,
               onResponse: @escaping RestResultCallback)
}
