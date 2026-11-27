import Foundation

public enum FallbackDeepgramTranscriberRedactionItem: String, Codable, Hashable, CaseIterable, Sendable {
    case pci
    case pii
    case phi
    case numbers
}