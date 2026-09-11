import Foundation

public enum DeepgramTranscriberRedactionItem: String, Codable, Hashable, CaseIterable, Sendable {
    case pci
    case pii
    case phi
    case numbers
}