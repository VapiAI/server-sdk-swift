import Foundation

public struct CloneVoiceDto: Codable, Hashable, Sendable {
    /// This is the name of the cloned voice in the provider account.
    public let name: String
    /// This is the description of your cloned voice.
    public let description: String?
    /// Serialized labels dictionary for the voice.
    public let labels: String?
    /// These are the files you want to use to clone your voice. Only Audio files are supported.
    public let files: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        description: String? = nil,
        labels: String? = nil,
        files: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.description = description
        self.labels = labels
        self.files = files
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.labels = try container.decodeIfPresent(String.self, forKey: .labels)
        self.files = try container.decode([String].self, forKey: .files)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.labels, forKey: .labels)
        try container.encode(self.files, forKey: .files)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case description
        case labels
        case files
    }
}