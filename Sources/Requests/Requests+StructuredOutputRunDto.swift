import Foundation

extension Requests {
    public struct StructuredOutputRunDto: Codable, Hashable, Sendable {
        /// This is the preview flag for the re-run. If true, the re-run will be executed and the response will be returned immediately and the call artifact will NOT be updated.
        /// If false (default), the re-run will be executed and the response will be updated in the call artifact.
        public let previewEnabled: Bool?
        /// This is the ID of the structured output that will be run. This must be provided unless a transient structured output is provided.
        /// When the re-run is executed, only the value of this structured output will be replaced with the new value, or added if not present.
        public let structuredOutputId: String?
        /// This is the transient structured output that will be run. This must be provided if a structured output ID is not provided.
        /// When the re-run is executed, the structured output value will be added to the existing artifact.
        public let structuredOutput: CreateStructuredOutputDto?
        /// This is the array of callIds that will be updated with the new structured output value. If preview is true, this array must be provided and contain exactly 1 callId.
        /// If preview is false, up to 100 callIds may be provided.
        public let callIds: [String]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            previewEnabled: Bool? = nil,
            structuredOutputId: String? = nil,
            structuredOutput: CreateStructuredOutputDto? = nil,
            callIds: [String],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.previewEnabled = previewEnabled
            self.structuredOutputId = structuredOutputId
            self.structuredOutput = structuredOutput
            self.callIds = callIds
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.previewEnabled = try container.decodeIfPresent(Bool.self, forKey: .previewEnabled)
            self.structuredOutputId = try container.decodeIfPresent(String.self, forKey: .structuredOutputId)
            self.structuredOutput = try container.decodeIfPresent(CreateStructuredOutputDto.self, forKey: .structuredOutput)
            self.callIds = try container.decode([String].self, forKey: .callIds)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.previewEnabled, forKey: .previewEnabled)
            try container.encodeIfPresent(self.structuredOutputId, forKey: .structuredOutputId)
            try container.encodeIfPresent(self.structuredOutput, forKey: .structuredOutput)
            try container.encode(self.callIds, forKey: .callIds)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case previewEnabled
            case structuredOutputId
            case structuredOutput
            case callIds
        }
    }
}