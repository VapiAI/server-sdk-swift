import Foundation

public enum CampaignContactWithOutcomeStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case contactPending = "contact.pending"
    case contactDispatched = "contact.dispatched"
    case contactCompleted = "contact.completed"
    case contactFailed = "contact.failed"
    case contactSkipped = "contact.skipped"
    case contactPredialFailed = "contact.predial-failed"
}