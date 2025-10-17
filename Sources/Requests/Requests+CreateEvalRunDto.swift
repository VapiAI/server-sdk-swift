import Foundation

extension Requests {
    public struct CreateEvalRunDto: Codable, Hashable, Sendable {
        /// This is the transient eval that will be run
        public let eval: CreateEvalDto?
        /// This is the target that will be run against the eval
        public let target: CreateEvalRunDtoTarget
        /// This is the type of the run.
        /// Currently it is fixed to `eval`.
        public let type: Eval
        /// This is the id of the eval that will be run.
        public let evalId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            eval: CreateEvalDto? = nil,
            target: CreateEvalRunDtoTarget,
            type: Eval,
            evalId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.eval = eval
            self.target = target
            self.type = type
            self.evalId = evalId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.eval = try container.decodeIfPresent(CreateEvalDto.self, forKey: .eval)
            self.target = try container.decode(CreateEvalRunDtoTarget.self, forKey: .target)
            self.type = try container.decode(Eval.self, forKey: .type)
            self.evalId = try container.decodeIfPresent(String.self, forKey: .evalId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.eval, forKey: .eval)
            try container.encode(self.target, forKey: .target)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.evalId, forKey: .evalId)
        }

        public enum Eval: String, Codable, Hashable, CaseIterable, Sendable {
            case eval
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case eval
            case target
            case type
            case evalId
        }
    }
}