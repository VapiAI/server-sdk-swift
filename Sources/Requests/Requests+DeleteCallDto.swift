import Foundation

extension Requests {
    public struct DeleteCallDto: Codable, Hashable, Sendable {
        /// These are the Call IDs to be bulk deleted.
        /// If provided, the call ID if any in the request query will be ignored
        /// When requesting a bulk delete, updates when a call is deleted will be sent as a webhook to the server URL configured in the Org settings.
        /// It may take up to a few hours to complete the bulk delete, and will be asynchronous.
        public let ids: [String]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            ids: [String]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.ids = ids
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.ids = try container.decodeIfPresent([String].self, forKey: .ids)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.ids, forKey: .ids)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case ids
        }
    }
}