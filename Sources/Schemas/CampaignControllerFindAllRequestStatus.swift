import Foundation

public enum CampaignControllerFindAllRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case scheduled
    case inProgress = "in-progress"
    case ended
}