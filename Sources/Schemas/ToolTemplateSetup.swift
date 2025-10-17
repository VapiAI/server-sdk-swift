import Foundation

public struct ToolTemplateSetup: Codable, Hashable, Sendable {
    public let title: String
    public let description: String?
    public let videoUrl: String?
    public let docsUrl: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        title: String,
        description: String? = nil,
        videoUrl: String? = nil,
        docsUrl: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.title = title
        self.description = description
        self.videoUrl = videoUrl
        self.docsUrl = docsUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.videoUrl = try container.decodeIfPresent(String.self, forKey: .videoUrl)
        self.docsUrl = try container.decodeIfPresent(String.self, forKey: .docsUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.title, forKey: .title)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.videoUrl, forKey: .videoUrl)
        try container.encodeIfPresent(self.docsUrl, forKey: .docsUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case title
        case description
        case videoUrl
        case docsUrl
    }
}