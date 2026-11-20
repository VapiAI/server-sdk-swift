import Foundation

public enum CallHealthDashboardFacetsDtoStatusesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case resolved
    case dismissed
}