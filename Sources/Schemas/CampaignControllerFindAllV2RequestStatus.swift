import Foundation

public enum CampaignControllerFindAllV2RequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case scheduled
    case inProgress = "in-progress"
    case ended
    case cancelled
    case archived
}