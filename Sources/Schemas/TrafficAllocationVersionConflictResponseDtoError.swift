import Foundation

public enum TrafficAllocationVersionConflictResponseDtoError: String, Codable, Hashable, CaseIterable, Sendable {
    case versionInGoverningAllocation = "version_in_governing_allocation"
}