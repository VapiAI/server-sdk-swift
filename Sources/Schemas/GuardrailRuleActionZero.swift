import Foundation

public enum GuardrailRuleActionZero: Codable, Hashable, Sendable {
    case fixed(GuardrailFixedResponseAction)
    case redirect(GuardrailRedirectAction)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .mode)
        switch discriminant {
        case "fixed":
            self = .fixed(try GuardrailFixedResponseAction(from: decoder))
        case "redirect":
            self = .redirect(try GuardrailRedirectAction(from: decoder))
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
        case .fixed(let data):
            try container.encode("fixed", forKey: .mode)
            try data.encode(to: encoder)
        case .redirect(let data):
            try container.encode("redirect", forKey: .mode)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case mode
    }
}