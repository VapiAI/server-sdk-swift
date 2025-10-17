import Foundation

extension Requests {
    public struct UpdateSessionDto: Codable, Hashable, Sendable {
        /// This is the new name for the session. Maximum length is 40 characters.
        public let name: String?
        /// This is the new status for the session.
        public let status: UpdateSessionDtoStatus?
        /// Session expiration time in seconds. Defaults to 24 hours (86400 seconds) if not set.
        public let expirationSeconds: Double?
        /// This is the updated array of chat messages.
        public let messages: [UpdateSessionDtoMessagesItem]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            name: String? = nil,
            status: UpdateSessionDtoStatus? = nil,
            expirationSeconds: Double? = nil,
            messages: [UpdateSessionDtoMessagesItem]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.name = name
            self.status = status
            self.expirationSeconds = expirationSeconds
            self.messages = messages
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.status = try container.decodeIfPresent(UpdateSessionDtoStatus.self, forKey: .status)
            self.expirationSeconds = try container.decodeIfPresent(Double.self, forKey: .expirationSeconds)
            self.messages = try container.decodeIfPresent([UpdateSessionDtoMessagesItem].self, forKey: .messages)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.status, forKey: .status)
            try container.encodeIfPresent(self.expirationSeconds, forKey: .expirationSeconds)
            try container.encodeIfPresent(self.messages, forKey: .messages)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case name
            case status
            case expirationSeconds
            case messages
        }
    }
}