import Foundation

public struct PaginationMeta: Codable, Hashable, Sendable {
    public let itemsPerPage: Double
    public let totalItems: Double
    public let currentPage: Double
    public let itemsBeyondRetention: Bool?
    public let createdAtLe: Date?
    public let createdAtGe: Date?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        itemsPerPage: Double,
        totalItems: Double,
        currentPage: Double,
        itemsBeyondRetention: Bool? = nil,
        createdAtLe: Date? = nil,
        createdAtGe: Date? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.itemsPerPage = itemsPerPage
        self.totalItems = totalItems
        self.currentPage = currentPage
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
        try container.encodeIfPresent(self.itemsBeyondRetention, forKey: .itemsBeyondRetention)
        try container.encodeIfPresent(self.createdAtLe, forKey: .createdAtLe)
        try container.encodeIfPresent(self.createdAtGe, forKey: .createdAtGe)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case itemsPerPage
        case totalItems
        case currentPage
        case itemsBeyondRetention
        case createdAtLe
        case createdAtGe
    }
}