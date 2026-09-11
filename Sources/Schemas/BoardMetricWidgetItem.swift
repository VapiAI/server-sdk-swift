import Foundation

public struct BoardMetricWidgetItem: Codable, Hashable, Sendable {
    public let type: BoardMetricWidgetItemType
    public let position: BoardItemPosition
    public let size: BoardItemSize
    public let insightId: String?
    public let systemKey: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: BoardMetricWidgetItemType,
        position: BoardItemPosition,
        size: BoardItemSize,
        insightId: String? = nil,
        systemKey: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.position = position
        self.size = size
        self.insightId = insightId
        self.systemKey = systemKey
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(BoardMetricWidgetItemType.self, forKey: .type)
        self.position = try container.decode(BoardItemPosition.self, forKey: .position)
        self.size = try container.decode(BoardItemSize.self, forKey: .size)
        self.insightId = try container.decodeIfPresent(String.self, forKey: .insightId)
        self.systemKey = try container.decodeIfPresent(String.self, forKey: .systemKey)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.position, forKey: .position)
        try container.encode(self.size, forKey: .size)
        try container.encodeIfPresent(self.insightId, forKey: .insightId)
        try container.encodeIfPresent(self.systemKey, forKey: .systemKey)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case position
        case size
        case insightId
        case systemKey
    }
}