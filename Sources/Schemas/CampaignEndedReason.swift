import Foundation

/// This is the explanation for how the campaign ended.
public enum CampaignEndedReason: String, Codable, Hashable, CaseIterable, Sendable {
    case campaignScheduledEndedByUser = "campaign.scheduled.ended-by-user"
    case campaignInProgressEndedByUser = "campaign.in-progress.ended-by-user"
    case campaignEndedSuccess = "campaign.ended.success"
}