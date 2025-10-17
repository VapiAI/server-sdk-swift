import Foundation

public enum GladiaTranscriberModel: String, Codable, Hashable, CaseIterable, Sendable {
    case fast
    case accurate
    case solaria1 = "solaria-1"
}