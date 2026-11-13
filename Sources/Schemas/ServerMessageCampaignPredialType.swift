import Foundation

/// This is the type of the message. "campaign.predial" is sent to the campaign's server before each contact is dialed, so the server can decide whether the contact is eligible to be called. It is only sent when the campaign's `predialPlan` is set (and not disabled).
public enum ServerMessageCampaignPredialType: String, Codable, Hashable, CaseIterable, Sendable {
    case campaignPredial = "campaign.predial"
}