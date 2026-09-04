import Foundation

public enum PhoneNumberControllerFindAllPaginatedRequestSortBy: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt
    case duration
    case cost
}