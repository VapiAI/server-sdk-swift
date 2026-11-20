import Foundation

public enum TrafficTabStructuredOutputDtoType: String, Codable, Hashable, CaseIterable, Sendable {
    case number
    case string
    case boolean
    case unknown
}