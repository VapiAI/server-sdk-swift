import Foundation

public enum CallHealthDashboardIssueSummaryDtoStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case resolved
    case dismissed
}