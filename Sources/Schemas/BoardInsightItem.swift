import Foundation

public struct BoardInsightItem: Codable, Hashable, Sendable {
    public let type: BoardInsightItemType
    public let insightId: String
    public let systemKey: String?
    public let position: BoardItemPosition
    public let size: BoardItemSize
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: BoardInsightItemType,
        insightId: String,
        systemKey: String? = nil,
        position: BoardItemPosition,
        size: BoardItemSize,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.insightId = insightId
        self.systemKey = systemKey
        self.position = position
        self.size = size
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(BoardInsightItemType.self, forKey: .type)
        self.insightId = try container.decode(String.self, forKey: .insightId)
        self.systemKey = try container.decodeIfPresent(String.self, forKey: .systemKey)
        self.position = try container.decode(BoardItemPosition.self, forKey: .position)
        self.size = try container.decode(BoardItemSize.self, forKey: .size)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.insightId, forKey: .insightId)
        try container.encodeIfPresent(self.systemKey, forKey: .systemKey)
        try container.encode(self.position, forKey: .position)
        try container.encode(self.size, forKey: .size)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case insightId
        case systemKey
        case position
        case size
    }
}