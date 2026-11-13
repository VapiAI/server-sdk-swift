import Foundation

public enum CallHealthDashboardSweepCoverageDtoState: String, Codable, Hashable, CaseIterable, Sendable {
    case idle
    case enumerating
    case processing
    case deduplicating
    case blocked
}