import Foundation

public struct CallHealthDashboardCallIssueDto: Codable, Hashable, Sendable {
    public let id: String
    public let name: String
    public let status: CallHealthDashboardCallIssueDtoStatus
    public let rowVersion: Int
    /// The ranking category the issue belongs to.
    public let categoryKey: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        status: CallHealthDashboardCallIssueDtoStatus,
        rowVersion: Int,
        categoryKey: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.rowVersion = rowVersion
        self.categoryKey = categoryKey
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(CallHealthDashboardCallIssueDtoStatus.self, forKey: .status)
        self.rowVersion = try container.decode(Int.self, forKey: .rowVersion)
        self.categoryKey = try container.decode(String.self, forKey: .categoryKey)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.rowVersion, forKey: .rowVersion)
        try container.encode(self.categoryKey, forKey: .categoryKey)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case status
        case rowVersion
        case categoryKey
    }
}