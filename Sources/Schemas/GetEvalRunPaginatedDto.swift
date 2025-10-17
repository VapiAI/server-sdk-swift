import Foundation

public struct GetEvalRunPaginatedDto: Codable, Hashable, Sendable {
    public let id: String?
    /// This is the page number to return. Defaults to 1.
    public let page: Double?
    /// This is the sort order for pagination. Defaults to 'DESC'.
    public let sortOrder: GetEvalRunPaginatedDtoSortOrder?
    /// This is the maximum number of items to return. Defaults to 100.
    public let limit: Double?
    /// This will return items where the createdAt is greater than the specified value.
    public let createdAtGt: Date?
    /// This will return items where the createdAt is less than the specified value.
    public let createdAtLt: Date?
    /// This will return items where the createdAt is greater than or equal to the specified value.
    public let createdAtGe: Date?
    /// This will return items where the createdAt is less than or equal to the specified value.
    public let createdAtLe: Date?
    /// This will return items where the updatedAt is greater than the specified value.
    public let updatedAtGt: Date?
    /// This will return items where the updatedAt is less than the specified value.
    public let updatedAtLt: Date?
    /// This will return items where the updatedAt is greater than or equal to the specified value.
    public let updatedAtGe: Date?
    /// This will return items where the updatedAt is less than or equal to the specified value.
    public let updatedAtLe: Date?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        page: Double? = nil,
        sortOrder: GetEvalRunPaginatedDtoSortOrder? = nil,
        limit: Double? = nil,
        createdAtGt: Date? = nil,
        createdAtLt: Date? = nil,
        createdAtGe: Date? = nil,
        createdAtLe: Date? = nil,
        updatedAtGt: Date? = nil,
        updatedAtLt: Date? = nil,
        updatedAtGe: Date? = nil,
        updatedAtLe: Date? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.page = page
        self.sortOrder = sortOrder
        self.limit = limit
        self.createdAtGt = createdAtGt
        self.createdAtLt = createdAtLt
        self.createdAtGe = createdAtGe
        self.createdAtLe = createdAtLe
        self.updatedAtGt = updatedAtGt
        self.updatedAtLt = updatedAtLt
        self.updatedAtGe = updatedAtGe
        self.updatedAtLe = updatedAtLe
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.page = try container.decodeIfPresent(Double.self, forKey: .page)
        self.sortOrder = try container.decodeIfPresent(GetEvalRunPaginatedDtoSortOrder.self, forKey: .sortOrder)
        self.limit = try container.decodeIfPresent(Double.self, forKey: .limit)
        self.createdAtGt = try container.decodeIfPresent(Date.self, forKey: .createdAtGt)
        self.createdAtLt = try container.decodeIfPresent(Date.self, forKey: .createdAtLt)
        self.createdAtGe = try container.decodeIfPresent(Date.self, forKey: .createdAtGe)
        self.createdAtLe = try container.decodeIfPresent(Date.self, forKey: .createdAtLe)
        self.updatedAtGt = try container.decodeIfPresent(Date.self, forKey: .updatedAtGt)
        self.updatedAtLt = try container.decodeIfPresent(Date.self, forKey: .updatedAtLt)
        self.updatedAtGe = try container.decodeIfPresent(Date.self, forKey: .updatedAtGe)
        self.updatedAtLe = try container.decodeIfPresent(Date.self, forKey: .updatedAtLe)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.page, forKey: .page)
        try container.encodeIfPresent(self.sortOrder, forKey: .sortOrder)
        try container.encodeIfPresent(self.limit, forKey: .limit)
        try container.encodeIfPresent(self.createdAtGt, forKey: .createdAtGt)
        try container.encodeIfPresent(self.createdAtLt, forKey: .createdAtLt)
        try container.encodeIfPresent(self.createdAtGe, forKey: .createdAtGe)
        try container.encodeIfPresent(self.createdAtLe, forKey: .createdAtLe)
        try container.encodeIfPresent(self.updatedAtGt, forKey: .updatedAtGt)
        try container.encodeIfPresent(self.updatedAtLt, forKey: .updatedAtLt)
        try container.encodeIfPresent(self.updatedAtGe, forKey: .updatedAtGe)
        try container.encodeIfPresent(self.updatedAtLe, forKey: .updatedAtLe)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case page
        case sortOrder
        case limit
        case createdAtGt
        case createdAtLt
        case createdAtGe
        case createdAtLe
        case updatedAtGt
        case updatedAtLt
        case updatedAtGe
        case updatedAtLe
    }
}