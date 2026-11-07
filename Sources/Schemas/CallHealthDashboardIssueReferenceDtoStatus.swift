import Foundation

public enum CallHealthDashboardIssueReferenceDtoStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case resolved
    case dismissed
}