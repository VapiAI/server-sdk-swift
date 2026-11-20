import Foundation

/// Whether a replacement can be recommended for this configuration.
public enum ModelDeprecationNoticeReplacementStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case available
    case manualActionRequired = "manual-action-required"
}