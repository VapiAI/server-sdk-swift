import Foundation

public enum CallHealthDashboardIssueCoverageDtoState: String, Codable, Hashable, CaseIterable, Sendable {
    case complete
    case partial
    case sweeping
    case blocked
}