import Foundation

extension Requests {
    public struct CreateTrafficAllocationDto: Codable, Hashable, Sendable {
        /// The assistant whose calls this allocation splits.
        public let assistantId: String
        /// 'explicit' splits calls across targets, and is inferred when targets is sent. 'follow-latest' sends every call to the newest published version and is how you stop splitting; it must be sent explicitly.
        public let allocationIntent: CreateTrafficAllocationDtoAllocationIntent?
        /// The versions to split calls across. Omit to stop splitting (with allocationIntent 'follow-latest'). Order in this array is the selection order (position).
        public let targets: [CreateTrafficAllocationTargetDto]?
        /// Optional concurrency guard. Omit it and the write applies unconditionally (last write wins, matching every other Vapi update surface). Provide the id of the allocation you last read and the write applies only while that allocation is still governing; any mismatch is a 409 carrying the actual current id.
        public let expectedCurrentAllocationId: String?
        /// An optional note explaining why you made this change.
        public let description: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            assistantId: String,
            allocationIntent: CreateTrafficAllocationDtoAllocationIntent? = nil,
            targets: [CreateTrafficAllocationTargetDto]? = nil,
            expectedCurrentAllocationId: String? = nil,
            description: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.assistantId = assistantId
            self.allocationIntent = allocationIntent
            self.targets = targets
            self.expectedCurrentAllocationId = expectedCurrentAllocationId
            self.description = description
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.assistantId = try container.decode(String.self, forKey: .assistantId)
            self.allocationIntent = try container.decodeIfPresent(CreateTrafficAllocationDtoAllocationIntent.self, forKey: .allocationIntent)
            self.targets = try container.decodeIfPresent([CreateTrafficAllocationTargetDto].self, forKey: .targets)
            self.expectedCurrentAllocationId = try container.decodeIfPresent(String.self, forKey: .expectedCurrentAllocationId)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.assistantId, forKey: .assistantId)
            try container.encodeIfPresent(self.allocationIntent, forKey: .allocationIntent)
            try container.encodeIfPresent(self.targets, forKey: .targets)
            try container.encodeIfPresent(self.expectedCurrentAllocationId, forKey: .expectedCurrentAllocationId)
            try container.encodeIfPresent(self.description, forKey: .description)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case assistantId
            case allocationIntent
            case targets
            case expectedCurrentAllocationId
            case description
        }
    }
}