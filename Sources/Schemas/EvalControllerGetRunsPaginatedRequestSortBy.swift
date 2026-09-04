import Foundation

public enum EvalControllerGetRunsPaginatedRequestSortBy: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt
    case duration
    case cost
}