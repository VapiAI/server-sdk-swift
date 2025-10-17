import Foundation

public struct AzureBlobStorageBucketPlan: Codable, Hashable, Sendable {
    /// This is the blob storage connection string for the Azure resource.
    public let connectionString: String
    /// This is the container name for the Azure blob storage.
    public let containerName: String
    /// This is the path where call artifacts will be stored.
    /// 
    /// Usage:
    /// - To store call artifacts in a specific folder, set this to the full path. Eg. "/folder-name1/folder-name2".
    /// - To store call artifacts in the root of the bucket, leave this blank.
    /// 
    /// @default "/"
    public let path: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        connectionString: String,
        containerName: String,
        path: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.connectionString = connectionString
        self.containerName = containerName
        self.path = path
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.connectionString = try container.decode(String.self, forKey: .connectionString)
        self.containerName = try container.decode(String.self, forKey: .containerName)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.connectionString, forKey: .connectionString)
        try container.encode(self.containerName, forKey: .containerName)
        try container.encodeIfPresent(self.path, forKey: .path)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case connectionString
        case containerName
        case path
    }
}