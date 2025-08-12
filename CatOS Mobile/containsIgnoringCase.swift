//
//  containsIgnoringCase.swift
//  CatOS Mobile
//
//  Created by Daniel on 12/8/2025.
//

import Foundation

extension String {
    /// 检查字符串是否包含另一个字符串，忽略大小写
    /// - Parameter substring: 要检查的子字符串
    /// - Returns: 如果包含则返回true，否则返回false
    func containsIgnoringCase(_ substring: String) -> Bool {
        // 转换为小写后进行比较
        return self.lowercased().contains(substring.lowercased())
        
        // 也可以使用 uppercase()
        // return self.uppercased().contains(substring.uppercased())
    }
}
