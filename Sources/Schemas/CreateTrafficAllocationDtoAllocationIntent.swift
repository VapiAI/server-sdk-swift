import Foundation

/// 'explicit' splits calls across targets, and is inferred when targets is sent. 'follow-latest' sends every call to the newest published version and is how you stop splitting; it must be sent explicitly.
public enum CreateTrafficAllocationDtoAllocationIntent: String, Codable, Hashable, CaseIterable, Sendable {
    case followLatest = "follow-latest"
    case explicit
}