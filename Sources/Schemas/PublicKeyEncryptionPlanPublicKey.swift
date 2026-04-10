import Foundation

/// The public key configuration.
public enum PublicKeyEncryptionPlanPublicKey: Codable, Hashable, Sendable {
    case spkiPem(SpkiPemPublicKeyConfig)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .format)
        switch discriminant {
        case "spki-pem":
            self = .spkiPem(try SpkiPemPublicKeyConfig(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .spkiPem(let data):
            try container.encode("spki-pem", forKey: .format)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case format
    }
}