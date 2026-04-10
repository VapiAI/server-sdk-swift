import Foundation

/// This is the authentication plan. Supports OAuth2 RFC 6749, HMAC signing, and Bearer authentication.
public enum CreateCustomCredentialDtoAuthenticationPlan: Codable, Hashable, Sendable {
    case bearer(BearerAuthenticationPlan)
    case hmac(HmacAuthenticationPlan)
    case oauth2(OAuth2AuthenticationPlan)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "bearer":
            self = .bearer(try BearerAuthenticationPlan(from: decoder))
        case "hmac":
            self = .hmac(try HmacAuthenticationPlan(from: decoder))
        case "oauth2":
            self = .oauth2(try OAuth2AuthenticationPlan(from: decoder))
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
        case .bearer(let data):
            try container.encode("bearer", forKey: .type)
            try data.encode(to: encoder)
        case .hmac(let data):
            try container.encode("hmac", forKey: .type)
            try data.encode(to: encoder)
        case .oauth2(let data):
            try container.encode("oauth2", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}