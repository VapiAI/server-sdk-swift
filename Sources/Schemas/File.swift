import Foundation

public struct File: Codable, Hashable, Sendable {
    public let object: File?
    public let status: FileStatus?
    /// This is the name of the file. This is just for your own reference.
    public let name: String?
    public let originalName: String?
    public let bytes: Double?
    public let purpose: String?
    public let mimetype: String?
    public let key: String?
    public let path: String?
    public let bucket: String?
    public let url: String?
    public let parsedTextUrl: String?
    public let parsedTextBytes: Double?
    public let metadata: [String: JSONValue]?
    /// This is the unique identifier for the file.
    public let id: String
    /// This is the unique identifier for the org that this file belongs to.
    public let orgId: String
    /// This is the ISO 8601 date-time string of when the file was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the file was last updated.
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        object: File? = nil,
        status: FileStatus? = nil,
        name: String? = nil,
        originalName: String? = nil,
        bytes: Double? = nil,
        purpose: String? = nil,
        mimetype: String? = nil,
        key: String? = nil,
        path: String? = nil,
        bucket: String? = nil,
        url: String? = nil,
        parsedTextUrl: String? = nil,
        parsedTextBytes: Double? = nil,
        metadata: [String: JSONValue]? = nil,
        id: String,
        orgId: String,
        createdAt: Date,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.object = object
        self.status = status
        self.name = name
        self.originalName = originalName
        self.bytes = bytes
        self.purpose = purpose
        self.mimetype = mimetype
        self.key = key
        self.path = path
        self.bucket = bucket
        self.url = url
        self.parsedTextUrl = parsedTextUrl
        self.parsedTextBytes = parsedTextBytes
        self.metadata = metadata
        self.id = id
        self.orgId = orgId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.object = try container.decodeIfPresent(File.self, forKey: .object)
        self.status = try container.decodeIfPresent(FileStatus.self, forKey: .status)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.originalName = try container.decodeIfPresent(String.self, forKey: .originalName)
        self.bytes = try container.decodeIfPresent(Double.self, forKey: .bytes)
        self.purpose = try container.decodeIfPresent(String.self, forKey: .purpose)
        self.mimetype = try container.decodeIfPresent(String.self, forKey: .mimetype)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.bucket = try container.decodeIfPresent(String.self, forKey: .bucket)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.parsedTextUrl = try container.decodeIfPresent(String.self, forKey: .parsedTextUrl)
        self.parsedTextBytes = try container.decodeIfPresent(Double.self, forKey: .parsedTextBytes)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.object, forKey: .object)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.originalName, forKey: .originalName)
        try container.encodeIfPresent(self.bytes, forKey: .bytes)
        try container.encodeIfPresent(self.purpose, forKey: .purpose)
        try container.encodeIfPresent(self.mimetype, forKey: .mimetype)
        try container.encodeIfPresent(self.key, forKey: .key)
        try container.encodeIfPresent(self.path, forKey: .path)
        try container.encodeIfPresent(self.bucket, forKey: .bucket)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.parsedTextUrl, forKey: .parsedTextUrl)
        try container.encodeIfPresent(self.parsedTextBytes, forKey: .parsedTextBytes)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    public enum File: String, Codable, Hashable, CaseIterable, Sendable {
        case file
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case object
        case status
        case name
        case originalName
        case bytes
        case purpose
        case mimetype
        case key
        case path
        case bucket
        case url
        case parsedTextUrl
        case parsedTextBytes
        case metadata
        case id
        case orgId
        case createdAt
        case updatedAt
    }
}