import Foundation

/// Who created this allocation. 'system' means Vapi created it automatically, for example when a publish advances a follow-latest allocation.
public enum TrafficAllocationActorType: String, Codable, Hashable, CaseIterable, Sendable {
    case user
    case apiKey = "api-key"
    case system
}