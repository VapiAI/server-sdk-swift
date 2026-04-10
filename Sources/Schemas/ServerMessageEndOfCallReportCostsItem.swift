import Foundation

public enum ServerMessageEndOfCallReportCostsItem: Codable, Hashable, Sendable {
    case analysis(AnalysisCost)
    case knowledgeBase(KnowledgeBaseCost)
    case model(ModelCost)
    case transcriber(TranscriberCost)
    case transport(TransportCost)
    case vapi(VapiCost)
    case voice(VoiceCost)
    case voicemailDetection(VoicemailDetectionCost)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "analysis":
            self = .analysis(try AnalysisCost(from: decoder))
        case "knowledge-base":
            self = .knowledgeBase(try KnowledgeBaseCost(from: decoder))
        case "model":
            self = .model(try ModelCost(from: decoder))
        case "transcriber":
            self = .transcriber(try TranscriberCost(from: decoder))
        case "transport":
            self = .transport(try TransportCost(from: decoder))
        case "vapi":
            self = .vapi(try VapiCost(from: decoder))
        case "voice":
            self = .voice(try VoiceCost(from: decoder))
        case "voicemail-detection":
            self = .voicemailDetection(try VoicemailDetectionCost(from: decoder))
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
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .analysis(let data):
            try container.encode("analysis", forKey: .type)
            try data.encode(to: encoder)
        case .knowledgeBase(let data):
            try container.encode("knowledge-base", forKey: .type)
            try data.encode(to: encoder)
        case .model(let data):
            try container.encode("model", forKey: .type)
            try data.encode(to: encoder)
        case .transcriber(let data):
            try container.encode("transcriber", forKey: .type)
            try data.encode(to: encoder)
        case .transport(let data):
            try container.encode("transport", forKey: .type)
            try data.encode(to: encoder)
        case .vapi(let data):
            try container.encode("vapi", forKey: .type)
            try data.encode(to: encoder)
        case .voice(let data):
            try container.encode("voice", forKey: .type)
            try data.encode(to: encoder)
        case .voicemailDetection(let data):
            try container.encode("voicemail-detection", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}