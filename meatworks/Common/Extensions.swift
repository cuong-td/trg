//
//  Extensions.swift
//  TRG
//
//  Created by Cuong Thai on 6/11/18.
//  Copyright © 2018 PQT. All rights reserved.
//

import Foundation

extension String {
    func getBase64() -> String {
        if let data = self.data(using: String.Encoding.utf8) {
            return data.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        }
        return ""
    }
    func format(parameters: CVarArg...) -> String {
        return String(format: self, arguments: parameters)
    }
    func sha1() -> String {
        let data = self.data(using: String.Encoding.utf8)!
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA1($0, CC_LONG(data.count), &digest)
        }
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
    func sha256() -> String {
        let data: Data = self.data(using: String.Encoding.utf8)! as Data
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0, CC_LONG(data.count), &hash)
        }
        let hexBytes = hash.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
//        return Data(bytes: hash).description
    }
    func md5() -> String {
        let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
        var digest = Array<UInt8>(repeating:0, count:Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5_Init(context)
        CC_MD5_Update(context, self, CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8)))
        CC_MD5_Final(&digest, context)
        context.deallocate(capacity: 1)
        var hexString = ""
        for byte in digest {
            hexString += String(format:"%02x", byte)
        }
        return hexString
    }
}
