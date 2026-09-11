import Foundation

public struct KnowledgeBaseV2File: Codable, Hashable, Sendable {
    public let id: String
    public let knowledgeBaseV2Id: String
    public let fileId: String
    public let fileName: String?
    public let mimetype: String?
    public let bytes: Double?
    public let status: KnowledgeBaseV2FileStatus
    public let createdAt: Date
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        knowledgeBaseV2Id: String,
        fileId: String,
        fileName: String? = nil,
        mimetype: String? = nil,
        bytes: Double? = nil,
        status: KnowledgeBaseV2FileStatus,
        createdAt: Date,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.knowledgeBaseV2Id = knowledgeBaseV2Id
        self.fileId = fileId
        self.fileName = fileName
        self.mimetype = mimetype
        self.bytes = bytes
        self.status = status
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.knowledgeBaseV2Id = try container.decode(String.self, forKey: .knowledgeBaseV2Id)
        self.fileId = try container.decode(String.self, forKey: .fileId)
        self.fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
        self.mimetype = try container.decodeIfPresent(String.self, forKey: .mimetype)
        self.bytes = try container.decodeIfPresent(Double.self, forKey: .bytes)
        self.status = try container.decode(KnowledgeBaseV2FileStatus.self, forKey: .status)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.knowledgeBaseV2Id, forKey: .knowledgeBaseV2Id)
        try container.encode(self.fileId, forKey: .fileId)
        try container.encodeIfPresent(self.fileName, forKey: .fileName)
        try container.encodeIfPresent(self.mimetype, forKey: .mimetype)
        try container.encodeIfPresent(self.bytes, forKey: .bytes)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case knowledgeBaseV2Id
        case fileId
        case fileName
        case mimetype
        case bytes
        case status
        case createdAt
        case updatedAt
    }
}