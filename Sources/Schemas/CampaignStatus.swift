import Foundation

/// This is the status of the campaign.
public enum CampaignStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case scheduled
    case inProgress = "in-progress"
    case ended
}