import Foundation

public enum EvalControllerGetPaginatedRequestSortBy: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt
    case duration
    case cost
}