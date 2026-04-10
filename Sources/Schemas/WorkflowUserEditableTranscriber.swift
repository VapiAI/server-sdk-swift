import Foundation

/// This is the transcriber for the workflow.
/// 
/// This can be overridden at node level using `nodes[n].transcriber`.
public enum WorkflowUserEditableTranscriber: Codable, Hashable, Sendable {
    case assemblyAi(AssemblyAiTranscriber)
    case azure(AzureSpeechTranscriber)
    case cartesia(CartesiaTranscriber)
    case customTranscriber(CustomTranscriber)
    case deepgram(DeepgramTranscriber)
    case elevenLabs(ElevenLabsTranscriber)
    case gladia(GladiaTranscriber)
    case google(GoogleTranscriber)
    case openai(OpenAiTranscriber)
    case soniox(SonioxTranscriber)
    case speechmatics(SpeechmaticsTranscriber)
    case talkscriber(TalkscriberTranscriber)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "assembly-ai":
            self = .assemblyAi(try AssemblyAiTranscriber(from: decoder))
        case "azure":
            self = .azure(try AzureSpeechTranscriber(from: decoder))
        case "cartesia":
            self = .cartesia(try CartesiaTranscriber(from: decoder))
        case "custom-transcriber":
            self = .customTranscriber(try CustomTranscriber(from: decoder))
        case "deepgram":
            self = .deepgram(try DeepgramTranscriber(from: decoder))
        case "11labs":
            self = .elevenLabs(try ElevenLabsTranscriber(from: decoder))
        case "gladia":
            self = .gladia(try GladiaTranscriber(from: decoder))
        case "google":
            self = .google(try GoogleTranscriber(from: decoder))
        case "openai":
            self = .openai(try OpenAiTranscriber(from: decoder))
        case "soniox":
            self = .soniox(try SonioxTranscriber(from: decoder))
        case "speechmatics":
            self = .speechmatics(try SpeechmaticsTranscriber(from: decoder))
        case "talkscriber":
            self = .talkscriber(try TalkscriberTranscriber(from: decoder))
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
        case .assemblyAi(let data):
            try container.encode("assembly-ai", forKey: .provider)
            try data.encode(to: encoder)
        case .azure(let data):
            try container.encode("azure", forKey: .provider)
            try data.encode(to: encoder)
        case .cartesia(let data):
            try container.encode("cartesia", forKey: .provider)
            try data.encode(to: encoder)
        case .customTranscriber(let data):
            try container.encode("custom-transcriber", forKey: .provider)
            try data.encode(to: encoder)
        case .deepgram(let data):
            try container.encode("deepgram", forKey: .provider)
            try data.encode(to: encoder)
        case .elevenLabs(let data):
            try container.encode("11labs", forKey: .provider)
            try data.encode(to: encoder)
        case .gladia(let data):
            try container.encode("gladia", forKey: .provider)
            try data.encode(to: encoder)
        case .google(let data):
            try container.encode("google", forKey: .provider)
            try data.encode(to: encoder)
        case .openai(let data):
            try container.encode("openai", forKey: .provider)
            try data.encode(to: encoder)
        case .soniox(let data):
            try container.encode("soniox", forKey: .provider)
            try data.encode(to: encoder)
        case .speechmatics(let data):
            try container.encode("speechmatics", forKey: .provider)
            try data.encode(to: encoder)
        case .talkscriber(let data):
            try container.encode("talkscriber", forKey: .provider)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}