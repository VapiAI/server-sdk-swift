import Foundation

public struct CallHealthDashboardIssueReferenceDto: Codable, Hashable, Sendable {
    public let id: String
    public let name: String
    public let status: CallHealthDashboardIssueReferenceDtoStatus
    public let rowVersion: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        status: CallHealthDashboardIssueReferenceDtoStatus,
        rowVersion: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.rowVersion = rowVersion
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(CallHealthDashboardIssueReferenceDtoStatus.self, forKey: .status)
        self.rowVersion = try container.decode(Int.self, forKey: .rowVersion)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.rowVersion, forKey: .rowVersion)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case status
        case rowVersion
    }
}