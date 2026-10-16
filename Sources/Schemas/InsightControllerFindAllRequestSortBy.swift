import Foundation

public enum InsightControllerFindAllRequestSortBy: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt
    case duration
    case cost
}