import Foundation

public enum CreateCampaignDtoServerMessagesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case campaignStarted = "campaign.started"
    case campaignCancelled = "campaign.cancelled"
    case campaignEnded = "campaign.ended"
    case campaignArchived = "campaign.archived"
    case campaignUnarchived = "campaign.unarchived"
    case contactDispatched = "contact.dispatched"
    case contactCompleted = "contact.completed"
    case contactFailed = "contact.failed"
    case contactSkipped = "contact.skipped"
    case contactPredialFailed = "contact.predial-failed"
    case campaignJobContinued = "campaign.job.continued"
}