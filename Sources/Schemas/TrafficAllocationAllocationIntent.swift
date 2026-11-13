import Foundation

/// 'explicit' splits calls across this allocation's targets. 'follow-latest' sends every call to the newest published version.
public enum TrafficAllocationAllocationIntent: String, Codable, Hashable, CaseIterable, Sendable {
    case followLatest = "follow-latest"
    case explicit
}