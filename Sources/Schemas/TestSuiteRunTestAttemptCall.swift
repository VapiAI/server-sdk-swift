import Foundation

public struct TestSuiteRunTestAttemptCall: Codable, Hashable, Sendable {
    /// This is the artifact of the call.
    public let artifact: Artifact
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        artifact: Artifact,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.artifact = artifact
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.artifact = try container.decode(Artifact.self, forKey: .artifact)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.artifact, forKey: .artifact)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case artifact
    }
}