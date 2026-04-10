import Foundation

/// AWS region where Bedrock is configured.
public enum AnthropicBedrockCredentialRegion: String, Codable, Hashable, CaseIterable, Sendable {
    case usEast1 = "us-east-1"
    case usWest2 = "us-west-2"
    case euWest1 = "eu-west-1"
    case euWest3 = "eu-west-3"
    case apNortheast1 = "ap-northeast-1"
    case apSoutheast2 = "ap-southeast-2"
}