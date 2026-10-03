import Foundation

public enum TrafficAllocationStaleConflictResponseDtoError: String, Codable, Hashable, CaseIterable, Sendable {
    case staleAllocation = "stale_allocation"
}