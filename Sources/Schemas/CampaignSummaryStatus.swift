import Foundation

/// This is the status of the campaign.
public enum CampaignSummaryStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case scheduled
    case inProgress = "in-progress"
    case ended
    case cancelled
    case archived
}