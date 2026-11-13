import Foundation

public struct GetTrafficAllocationPaginatedDto: Codable, Hashable, Sendable {
    /// Filter to allocations for this assistant.
    public let assistantId: String?
    /// The page number to return. Defaults to 1.
    public let page: Int?
    /// The maximum number of items to return. Defaults to 100.
    public let limit: Int?
    /// The sort order for pagination. Defaults to 'DESC'.
    public let sortOrder: GetTrafficAllocationPaginatedDtoSortOrder?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantId: String? = nil,
        page: Int? = nil,
        limit: Int? = nil,
        sortOrder: GetTrafficAllocationPaginatedDtoSortOrder? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantId = assistantId
        self.page = page
        self.limit = limit
        self.sortOrder = sortOrder
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
        self.page = try container.decodeIfPresent(Int.self, forKey: .page)
        self.limit = try container.decodeIfPresent(Int.self, forKey: .limit)
        self.sortOrder = try container.decodeIfPresent(GetTrafficAllocationPaginatedDtoSortOrder.self, forKey: .sortOrder)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.page, forKey: .page)
        try container.encodeIfPresent(self.limit, forKey: .limit)
        try container.encodeIfPresent(self.sortOrder, forKey: .sortOrder)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantId
        case page
        case limit
        case sortOrder
    }
}