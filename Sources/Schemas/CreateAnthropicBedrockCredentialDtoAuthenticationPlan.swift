import Foundation

/// Authentication method - either direct IAM credentials or cross-account role assumption.
public enum CreateAnthropicBedrockCredentialDtoAuthenticationPlan: Codable, Hashable, Sendable {
    case awsIam(AwsiamCredentialsAuthenticationPlan)
    case awsSts(AwsStsAuthenticationPlan)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "aws-iam":
            self = .awsIam(try AwsiamCredentialsAuthenticationPlan(from: decoder))
        case "aws-sts":
            self = .awsSts(try AwsStsAuthenticationPlan(from: decoder))
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
        case .awsIam(let data):
            try container.encode("aws-iam", forKey: .type)
            try data.encode(to: encoder)
        case .awsSts(let data):
            try container.encode("aws-sts", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}