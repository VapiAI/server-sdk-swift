import Foundation

public struct Board: Codable, Hashable, Sendable {
    /// This is the contents of the Board, which is an array of objects defining the type, contents, and position of the widgets on the Board.
    public let items: [BoardItemsItem]?
    /// This is the unique identifier for the Board.
    public let id: String
    /// This is the unique identifier for the org that this Board belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the Board was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the Board was last updated.
    public let updatedAt: Date
    /// Server-owned key for system-provisioned boards. User create/update DTOs do
    /// not accept this field.
    public let systemKey: String?
    /// This is the name of the Board.
    public let name: String
    /// This is the layout of the Board.
    public let layout: BoardLayout
    /// This is the timerange override for the board.
    /// By default, individual insights have their own timerange.
    /// This is a global override for the board which will be passed to all insights on the board.
    public let timeRangeOverride: InsightTimeRangeWithStep?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        items: [BoardItemsItem]? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        systemKey: String? = nil,
        name: String,
        layout: BoardLayout,
        timeRangeOverride: InsightTimeRangeWithStep? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.items = items
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.systemKey = systemKey
        self.name = name
        self.layout = layout
        self.timeRangeOverride = timeRangeOverride
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decodeIfPresent([BoardItemsItem].self, forKey: .items)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.systemKey = try container.decodeIfPresent(String.self, forKey: .systemKey)
        self.name = try container.decode(String.self, forKey: .name)
        self.layout = try container.decode(BoardLayout.self, forKey: .layout)
        self.timeRangeOverride = try container.decodeIfPresent(InsightTimeRangeWithStep.self, forKey: .timeRangeOverride)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.items, forKey: .items)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.systemKey, forKey: .systemKey)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.layout, forKey: .layout)
        try container.encodeIfPresent(self.timeRangeOverride, forKey: .timeRangeOverride)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case items
        case id
        case orgId
        case createdAt
        case updatedAt
        case systemKey
        case name
        case layout
        case timeRangeOverride
    }
}