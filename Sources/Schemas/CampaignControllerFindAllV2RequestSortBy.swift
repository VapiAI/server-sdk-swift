import Foundation

public enum CampaignControllerFindAllV2RequestSortBy: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt
    case duration
    case cost
}