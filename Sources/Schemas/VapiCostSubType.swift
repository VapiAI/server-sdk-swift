import Foundation

/// This is the sub type of the cost.
public enum VapiCostSubType: String, Codable, Hashable, CaseIterable, Sendable {
    case normal
    case overage
}