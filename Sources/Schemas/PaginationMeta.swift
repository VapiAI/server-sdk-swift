import Foundation

/// Pagination and retention metadata returned with a paginated list of phone numbers.
public struct PaginationMeta: Codable, Hashable, Sendable {
    /// The number of phone numbers returned per page.
    public let itemsPerPage: Double
    /// The total number of phone numbers matching the request.
    public let totalItems: Double
    /// The current page number.
    public let currentPage: Double
    public let totalPages: Double?
    public let hasNextPage: Bool?
    /// Opaque cursor for the next page under keyset pagination (PRO-3163). Pass it
    /// back as the `cursor` query param to fetch the next page without an OFFSET
    /// scan. Present only when a further page likely exists.
    public let nextCursor: String?
    public let sortOrder: PaginationMetaSortOrder?
    /// Whether additional matching phone numbers exist beyond the organization's data-retention window.
    public let itemsBeyondRetention: Bool?
    /// The inclusive upper creation-time boundary applied to the result set.
    public let createdAtLe: Date?
    /// The inclusive lower creation-time boundary applied to the result set.
    public let createdAtGe: Date?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        itemsPerPage: Double,
        totalItems: Double,
        currentPage: Double,
        totalPages: Double? = nil,
        hasNextPage: Bool? = nil,
        nextCursor: String? = nil,
        sortOrder: PaginationMetaSortOrder? = nil,
        itemsBeyondRetention: Bool? = nil,
        createdAtLe: Date? = nil,
        createdAtGe: Date? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.itemsPerPage = itemsPerPage
        self.totalItems = totalItems
        self.currentPage = currentPage
        self.totalPages = totalPages
        self.hasNextPage = hasNextPage
        self.nextCursor = nextCursor
        self.sortOrder = sortOrder
        self.itemsBeyondRetention = itemsBeyondRetention
        self.createdAtLe = createdAtLe
        self.createdAtGe = createdAtGe
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.itemsPerPage = try container.decode(Double.self, forKey: .itemsPerPage)
        self.totalItems = try container.decode(Double.self, forKey: .totalItems)
        self.currentPage = try container.decode(Double.self, forKey: .currentPage)
        self.totalPages = try container.decodeIfPresent(Double.self, forKey: .totalPages)
        self.hasNextPage = try container.decodeIfPresent(Bool.self, forKey: .hasNextPage)
        self.nextCursor = try container.decodeIfPresent(String.self, forKey: .nextCursor)
        self.sortOrder = try container.decodeIfPresent(PaginationMetaSortOrder.self, forKey: .sortOrder)
        self.itemsBeyondRetention = try container.decodeIfPresent(Bool.self, forKey: .itemsBeyondRetention)
        self.createdAtLe = try container.decodeIfPresent(Date.self, forKey: .createdAtLe)
        self.createdAtGe = try container.decodeIfPresent(Date.self, forKey: .createdAtGe)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.itemsPerPage, forKey: .itemsPerPage)
        try container.encode(self.totalItems, forKey: .totalItems)
        try container.encode(self.currentPage, forKey: .currentPage)
        try container.encodeIfPresent(self.totalPages, forKey: .totalPages)
        try container.encodeIfPresent(self.hasNextPage, forKey: .hasNextPage)
        try container.encodeIfPresent(self.nextCursor, forKey: .nextCursor)
        try container.encodeIfPresent(self.sortOrder, forKey: .sortOrder)
        try container.encodeIfPresent(self.itemsBeyondRetention, forKey: .itemsBeyondRetention)
        try container.encodeIfPresent(self.createdAtLe, forKey: .createdAtLe)
        try container.encodeIfPresent(self.createdAtGe, forKey: .createdAtGe)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case itemsPerPage
        case totalItems
        case currentPage
        case totalPages
        case hasNextPage
        case nextCursor
        case sortOrder
        case itemsBeyondRetention
        case createdAtLe
        case createdAtGe
    }
}