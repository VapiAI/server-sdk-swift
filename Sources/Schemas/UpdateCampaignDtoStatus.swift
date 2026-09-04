import Foundation

/// Set to 'cancelled' to stop the campaign ('ended' is a V1 alias). Scheduled
/// calls are deleted; in-progress calls are allowed to finish.
public enum UpdateCampaignDtoStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case ended
    case cancelled
}