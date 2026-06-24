import Foundation

public enum CartesiaSpeedControlZero: String, Codable, Hashable, CaseIterable, Sendable {
    case slowest
    case slow
    case normal
    case fast
    case fastest
}