import Foundation

public enum CallHealthDashboardTriageRequestDtoAction: String, Codable, Hashable, CaseIterable, Sendable {
    case resolve
    case dismiss
    case restore
}