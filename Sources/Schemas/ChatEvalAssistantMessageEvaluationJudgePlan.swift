import Foundation

/// This is the judge plan that instructs how to evaluate the assistant message.
/// The assistant message can be evaluated against fixed content (exact match or RegEx) or with an LLM-as-judge by defining the evaluation criteria in a prompt.
public enum ChatEvalAssistantMessageEvaluationJudgePlan: Codable, Hashable, Sendable {
    case exact(Exact)
    case regex(Regex)
    case ai(Ai)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "exact":
            self = .exact(try Exact(from: decoder))
        case "regex":
            self = .regex(try Regex(from: decoder))
        case "ai":
            self = .ai(try Ai(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        switch self {
        case .exact(let data):
            try data.encode(to: encoder)
        case .regex(let data):
            try data.encode(to: encoder)
        case .ai(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Exact: Codable, Hashable, Sendable {
        public let type: String = "exact"
        /// This is what that will be used to evaluate the model's message content.
        /// If you provide a string, the assistant message content will be evaluated against it as an exact match, case-insensitive.
        public let content: String
        /// This is the tool calls that will be used to evaluate the model's message content.
        /// The tool name must be a valid tool that the assistant is allowed to call.
        /// 
        /// For the Query tool, the arguments for the tool call are in the format - {knowledgeBaseNames: ['kb_name', 'kb_name_2']}
        /// 
        /// For the DTMF tool, the arguments for the tool call are in the format - {dtmf: "1234*"}
        /// 
        /// For the Handoff tool, the arguments for the tool call are in the format - {destination: "assistant_id"}
        /// 
        /// For the Transfer Call tool, the arguments for the tool call are in the format - {destination: "phone_number_or_assistant_id"}
        /// 
        /// For all other tools, they are called without arguments or with user-defined arguments
        public let toolCalls: [ChatEvalAssistantMessageMockToolCall]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            content: String,
            toolCalls: [ChatEvalAssistantMessageMockToolCall]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.content = content
            self.toolCalls = toolCalls
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.content = try container.decode(String.self, forKey: .content)
            self.toolCalls = try container.decodeIfPresent([ChatEvalAssistantMessageMockToolCall].self, forKey: .toolCalls)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.content, forKey: .content)
            try container.encodeIfPresent(self.toolCalls, forKey: .toolCalls)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case content
            case toolCalls
        }
    }

    public struct Regex: Codable, Hashable, Sendable {
        public let type: String = "regex"
        /// This is what that will be used to evaluate the model's message content.
        /// The content will be evaluated against the regex pattern provided in the Judge Plan content field.
        /// Evaluation is considered successful if the regex pattern matches any part of the assistant message content.
        public let content: String
        /// This is the tool calls that will be used to evaluate the model's message content.
        /// The tool name must be a valid tool that the assistant is allowed to call.
        /// The values to the arguments for the tool call should be a Regular Expression.
        /// Evaluation is considered successful if the regex pattern matches any part of each tool call argument.
        /// 
        /// For the Query tool, the arguments for the tool call are in the format - {knowledgeBaseNames: ['kb_name', 'kb_name_2']}
        /// 
        /// For the DTMF tool, the arguments for the tool call are in the format - {dtmf: "1234*"}
        /// 
        /// For the Handoff tool, the arguments for the tool call are in the format - {destination: "assistant_id"}
        /// 
        /// For the Transfer Call tool, the arguments for the tool call are in the format - {destination: "phone_number_or_assistant_id"}
        /// 
        /// For all other tools, they are called without arguments or with user-defined arguments
        public let toolCalls: [ChatEvalAssistantMessageMockToolCall]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            content: String,
            toolCalls: [ChatEvalAssistantMessageMockToolCall]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.content = content
            self.toolCalls = toolCalls
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.content = try container.decode(String.self, forKey: .content)
            self.toolCalls = try container.decodeIfPresent([ChatEvalAssistantMessageMockToolCall].self, forKey: .toolCalls)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.content, forKey: .content)
            try container.encodeIfPresent(self.toolCalls, forKey: .toolCalls)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case content
            case toolCalls
        }
    }

    public struct Ai: Codable, Hashable, Sendable {
        public let type: String = "ai"
        /// This is the model to use for the LLM-as-a-judge.
        /// If not provided, will default to the assistant's model.
        /// 
        /// The instructions on how to evaluate the model output with this LLM-Judge must be passed as a system message in the messages array of the model.
        /// 
        /// The Mock conversation can be passed to the LLM-Judge to evaluate using the prompt {{messages}} and will be evaluated as a LiquidJS Variable. To access and judge only the last message, use {{messages[-1]}}
        /// 
        /// The LLM-Judge must respond with "pass" or "fail" and only those two responses are allowed.
        public let model: AssistantMessageJudgePlanAiModel
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: AssistantMessageJudgePlanAiModel,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decode(AssistantMessageJudgePlanAiModel.self, forKey: .model)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.model, forKey: .model)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case model
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}