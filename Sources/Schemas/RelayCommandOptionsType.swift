import Foundation

public enum RelayCommandOptionsType: String, Codable, Hashable, CaseIterable, Sendable {
    case say
    case messageAdd = "message.add"
}