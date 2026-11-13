import Foundation

/// User resolve, dismiss or restore, or the system reopen written when a new match reopens a resolved issue.
public enum CallHealthDashboardIssueActivityDtoAction: String, Codable, Hashable, CaseIterable, Sendable {
    case resolve
    case dismiss
    case restore
    case reopen
}