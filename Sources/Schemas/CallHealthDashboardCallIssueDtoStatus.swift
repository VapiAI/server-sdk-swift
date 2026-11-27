import Foundation

public enum CallHealthDashboardCallIssueDtoStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case resolved
    case dismissed
}