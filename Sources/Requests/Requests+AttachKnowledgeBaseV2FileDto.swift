import Foundation

extension Requests {
    public struct AttachKnowledgeBaseV2FileDto: Codable, Hashable, Sendable {
        public let fileId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            fileId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.fileId = fileId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.fileId = try container.decode(String.self, forKey: .fileId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.fileId, forKey: .fileId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case fileId
        }
    }
}