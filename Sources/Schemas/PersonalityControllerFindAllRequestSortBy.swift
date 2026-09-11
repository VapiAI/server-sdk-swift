import Foundation

public enum PersonalityControllerFindAllRequestSortBy: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt
    case duration
    case cost
}