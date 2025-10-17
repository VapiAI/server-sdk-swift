import Foundation

public enum ServerMessageEndOfCallReportCostsItem: Codable, Hashable, Sendable {
    case transport(Transport)
    case transcriber(Transcriber)
    case model(Model)
    case voice(Voice)
    case vapi(Vapi)
    case voicemailDetection(VoicemailDetection)
    case analysis(Analysis)
    case knowledgeBase(KnowledgeBase)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "transport":
            self = .transport(try Transport(from: decoder))
        case "transcriber":
            self = .transcriber(try Transcriber(from: decoder))
        case "model":
            self = .model(try Model(from: decoder))
        case "voice":
            self = .voice(try Voice(from: decoder))
        case "vapi":
            self = .vapi(try Vapi(from: decoder))
        case "voicemail-detection":
            self = .voicemailDetection(try VoicemailDetection(from: decoder))
        case "analysis":
            self = .analysis(try Analysis(from: decoder))
        case "knowledge-base":
            self = .knowledgeBase(try KnowledgeBase(from: decoder))
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
        case .transport(let data):
            try data.encode(to: encoder)
        case .transcriber(let data):
            try data.encode(to: encoder)
        case .model(let data):
            try data.encode(to: encoder)
        case .voice(let data):
            try data.encode(to: encoder)
        case .vapi(let data):
            try data.encode(to: encoder)
        case .voicemailDetection(let data):
            try data.encode(to: encoder)
        case .analysis(let data):
            try data.encode(to: encoder)
        case .knowledgeBase(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Transport: Codable, Hashable, Sendable {
        public let type: String = "transport"
        public let provider: TransportCostProvider?
        /// This is the minutes of `transport` usage. This should match `call.endedAt` - `call.startedAt`.
        public let minutes: Double
        /// This is the cost of the component in USD.
        public let cost: Double
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            provider: TransportCostProvider? = nil,
            minutes: Double,
            cost: Double,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.provider = provider
            self.minutes = minutes
            self.cost = cost
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.provider = try container.decodeIfPresent(TransportCostProvider.self, forKey: .provider)
            self.minutes = try container.decode(Double.self, forKey: .minutes)
            self.cost = try container.decode(Double.self, forKey: .cost)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.provider, forKey: .provider)
            try container.encode(self.minutes, forKey: .minutes)
            try container.encode(self.cost, forKey: .cost)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case provider
            case minutes
            case cost
        }
    }

    public struct Transcriber: Codable, Hashable, Sendable {
        public let type: String = "transcriber"
        /// This is the transcriber that was used during the call.
        /// 
        /// This matches one of the below:
        /// - `call.assistant.transcriber`,
        /// - `call.assistantId->transcriber`,
        /// - `call.squad[n].assistant.transcriber`,
        /// - `call.squad[n].assistantId->transcriber`,
        /// - `call.squadId->[n].assistant.transcriber`,
        /// - `call.squadId->[n].assistantId->transcriber`.
        public let transcriber: [String: JSONValue]
        /// This is the minutes of `transcriber` usage. This should match `call.endedAt` - `call.startedAt` for single assistant calls, while squad calls will have multiple transcriber costs one for each assistant that was used.
        public let minutes: Double
        /// This is the cost of the component in USD.
        public let cost: Double
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            transcriber: [String: JSONValue],
            minutes: Double,
            cost: Double,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.transcriber = transcriber
            self.minutes = minutes
            self.cost = cost
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.transcriber = try container.decode([String: JSONValue].self, forKey: .transcriber)
            self.minutes = try container.decode(Double.self, forKey: .minutes)
            self.cost = try container.decode(Double.self, forKey: .cost)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.transcriber, forKey: .transcriber)
            try container.encode(self.minutes, forKey: .minutes)
            try container.encode(self.cost, forKey: .cost)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case transcriber
            case minutes
            case cost
        }
    }

    public struct Model: Codable, Hashable, Sendable {
        public let type: String = "model"
        /// This is the model that was used during the call.
        /// 
        /// This matches one of the following:
        /// - `call.assistant.model`,
        /// - `call.assistantId->model`,
        /// - `call.squad[n].assistant.model`,
        /// - `call.squad[n].assistantId->model`,
        /// - `call.squadId->[n].assistant.model`,
        /// - `call.squadId->[n].assistantId->model`.
        public let model: [String: JSONValue]
        /// This is the number of prompt tokens used in the call. These should be total prompt tokens used in the call for single assistant calls, while squad calls will have multiple model costs one for each assistant that was used.
        public let promptTokens: Double
        /// This is the number of completion tokens generated in the call. These should be total completion tokens used in the call for single assistant calls, while squad calls will have multiple model costs one for each assistant that was used.
        public let completionTokens: Double
        /// This is the cost of the component in USD.
        public let cost: Double
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: [String: JSONValue],
            promptTokens: Double,
            completionTokens: Double,
            cost: Double,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.promptTokens = promptTokens
            self.completionTokens = completionTokens
            self.cost = cost
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decode([String: JSONValue].self, forKey: .model)
            self.promptTokens = try container.decode(Double.self, forKey: .promptTokens)
            self.completionTokens = try container.decode(Double.self, forKey: .completionTokens)
            self.cost = try container.decode(Double.self, forKey: .cost)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.model, forKey: .model)
            try container.encode(self.promptTokens, forKey: .promptTokens)
            try container.encode(self.completionTokens, forKey: .completionTokens)
            try container.encode(self.cost, forKey: .cost)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case model
            case promptTokens
            case completionTokens
            case cost
        }
    }

    public struct Voice: Codable, Hashable, Sendable {
        public let type: String = "voice"
        /// This is the voice that was used during the call.
        /// 
        /// This matches one of the following:
        /// - `call.assistant.voice`,
        /// - `call.assistantId->voice`,
        /// - `call.squad[n].assistant.voice`,
        /// - `call.squad[n].assistantId->voice`,
        /// - `call.squadId->[n].assistant.voice`,
        /// - `call.squadId->[n].assistantId->voice`.
        public let voice: [String: JSONValue]
        /// This is the number of characters that were generated during the call. These should be total characters used in the call for single assistant calls, while squad calls will have multiple voice costs one for each assistant that was used.
        public let characters: Double
        /// This is the cost of the component in USD.
        public let cost: Double
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            voice: [String: JSONValue],
            characters: Double,
            cost: Double,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.voice = voice
            self.characters = characters
            self.cost = cost
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.voice = try container.decode([String: JSONValue].self, forKey: .voice)
            self.characters = try container.decode(Double.self, forKey: .characters)
            self.cost = try container.decode(Double.self, forKey: .cost)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.voice, forKey: .voice)
            try container.encode(self.characters, forKey: .characters)
            try container.encode(self.cost, forKey: .cost)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case voice
            case characters
            case cost
        }
    }

    public struct Vapi: Codable, Hashable, Sendable {
        public let type: String = "vapi"
        /// This is the sub type of the cost.
        public let subType: VapiCostSubType
        /// This is the minutes of Vapi usage. This should match `call.endedAt` - `call.startedAt`.
        public let minutes: Double
        /// This is the cost of the component in USD.
        public let cost: Double
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            subType: VapiCostSubType,
            minutes: Double,
            cost: Double,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.subType = subType
            self.minutes = minutes
            self.cost = cost
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.subType = try container.decode(VapiCostSubType.self, forKey: .subType)
            self.minutes = try container.decode(Double.self, forKey: .minutes)
            self.cost = try container.decode(Double.self, forKey: .cost)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.subType, forKey: .subType)
            try container.encode(self.minutes, forKey: .minutes)
            try container.encode(self.cost, forKey: .cost)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case subType
            case minutes
            case cost
        }
    }

    public struct VoicemailDetection: Codable, Hashable, Sendable {
        public let type: String = "voicemail-detection"
        /// This is the model that was used to perform the analysis.
        public let model: [String: JSONValue]
        /// This is the provider that was used to detect the voicemail.
        public let provider: VoicemailDetectionCostProvider
        /// This is the number of prompt text tokens used in the voicemail detection.
        public let promptTextTokens: Double
        /// This is the number of prompt audio tokens used in the voicemail detection.
        public let promptAudioTokens: Double
        /// This is the number of completion text tokens used in the voicemail detection.
        public let completionTextTokens: Double
        /// This is the number of completion audio tokens used in the voicemail detection.
        public let completionAudioTokens: Double
        /// This is the cost of the component in USD.
        public let cost: Double
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: [String: JSONValue],
            provider: VoicemailDetectionCostProvider,
            promptTextTokens: Double,
            promptAudioTokens: Double,
            completionTextTokens: Double,
            completionAudioTokens: Double,
            cost: Double,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.provider = provider
            self.promptTextTokens = promptTextTokens
            self.promptAudioTokens = promptAudioTokens
            self.completionTextTokens = completionTextTokens
            self.completionAudioTokens = completionAudioTokens
            self.cost = cost
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decode([String: JSONValue].self, forKey: .model)
            self.provider = try container.decode(VoicemailDetectionCostProvider.self, forKey: .provider)
            self.promptTextTokens = try container.decode(Double.self, forKey: .promptTextTokens)
            self.promptAudioTokens = try container.decode(Double.self, forKey: .promptAudioTokens)
            self.completionTextTokens = try container.decode(Double.self, forKey: .completionTextTokens)
            self.completionAudioTokens = try container.decode(Double.self, forKey: .completionAudioTokens)
            self.cost = try container.decode(Double.self, forKey: .cost)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.model, forKey: .model)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.promptTextTokens, forKey: .promptTextTokens)
            try container.encode(self.promptAudioTokens, forKey: .promptAudioTokens)
            try container.encode(self.completionTextTokens, forKey: .completionTextTokens)
            try container.encode(self.completionAudioTokens, forKey: .completionAudioTokens)
            try container.encode(self.cost, forKey: .cost)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case model
            case provider
            case promptTextTokens
            case promptAudioTokens
            case completionTextTokens
            case completionAudioTokens
            case cost
        }
    }

    public struct Analysis: Codable, Hashable, Sendable {
        public let type: String = "analysis"
        /// This is the type of analysis performed.
        public let analysisType: AnalysisCostAnalysisType
        /// This is the model that was used to perform the analysis.
        public let model: [String: JSONValue]
        /// This is the number of prompt tokens used in the analysis.
        public let promptTokens: Double
        /// This is the number of completion tokens generated in the analysis.
        public let completionTokens: Double
        /// This is the cost of the component in USD.
        public let cost: Double
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            analysisType: AnalysisCostAnalysisType,
            model: [String: JSONValue],
            promptTokens: Double,
            completionTokens: Double,
            cost: Double,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.analysisType = analysisType
            self.model = model
            self.promptTokens = promptTokens
            self.completionTokens = completionTokens
            self.cost = cost
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.analysisType = try container.decode(AnalysisCostAnalysisType.self, forKey: .analysisType)
            self.model = try container.decode([String: JSONValue].self, forKey: .model)
            self.promptTokens = try container.decode(Double.self, forKey: .promptTokens)
            self.completionTokens = try container.decode(Double.self, forKey: .completionTokens)
            self.cost = try container.decode(Double.self, forKey: .cost)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.analysisType, forKey: .analysisType)
            try container.encode(self.model, forKey: .model)
            try container.encode(self.promptTokens, forKey: .promptTokens)
            try container.encode(self.completionTokens, forKey: .completionTokens)
            try container.encode(self.cost, forKey: .cost)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case analysisType
            case model
            case promptTokens
            case completionTokens
            case cost
        }
    }

    public struct KnowledgeBase: Codable, Hashable, Sendable {
        public let type: String = "knowledge-base"
        /// This is the model that was used for processing the knowledge base.
        public let model: [String: JSONValue]
        /// This is the number of prompt tokens used in the knowledge base query.
        public let promptTokens: Double
        /// This is the number of completion tokens generated in the knowledge base query.
        public let completionTokens: Double
        /// This is the cost of the component in USD.
        public let cost: Double
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: [String: JSONValue],
            promptTokens: Double,
            completionTokens: Double,
            cost: Double,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.promptTokens = promptTokens
            self.completionTokens = completionTokens
            self.cost = cost
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decode([String: JSONValue].self, forKey: .model)
            self.promptTokens = try container.decode(Double.self, forKey: .promptTokens)
            self.completionTokens = try container.decode(Double.self, forKey: .completionTokens)
            self.cost = try container.decode(Double.self, forKey: .cost)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.model, forKey: .model)
            try container.encode(self.promptTokens, forKey: .promptTokens)
            try container.encode(self.completionTokens, forKey: .completionTokens)
            try container.encode(self.cost, forKey: .cost)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case model
            case promptTokens
            case completionTokens
            case cost
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}