import Foundation

public enum FallbackTranscriberPlanTranscribersItem: Codable, Hashable, Sendable {
    case assemblyAi(FallbackAssemblyAiTranscriber)
    case azure(FallbackAzureSpeechTranscriber)
    case cartesia(FallbackCartesiaTranscriber)
    case customTranscriber(FallbackCustomTranscriber)
    case deepgram(FallbackDeepgramTranscriber)
    case elevenLabs(FallbackElevenLabsTranscriber)
    case gladia(FallbackGladiaTranscriber)
    case google(FallbackGoogleTranscriber)
    case openai(FallbackOpenAiTranscriber)
    case soniox(FallbackSonioxTranscriber)
    case speechmatics(FallbackSpeechmaticsTranscriber)
    case talkscriber(FallbackTalkscriberTranscriber)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "assembly-ai":
            self = .assemblyAi(try FallbackAssemblyAiTranscriber(from: decoder))
        case "azure":
            self = .azure(try FallbackAzureSpeechTranscriber(from: decoder))
        case "cartesia":
            self = .cartesia(try FallbackCartesiaTranscriber(from: decoder))
        case "custom-transcriber":
            self = .customTranscriber(try FallbackCustomTranscriber(from: decoder))
        case "deepgram":
            self = .deepgram(try FallbackDeepgramTranscriber(from: decoder))
        case "11labs":
            self = .elevenLabs(try FallbackElevenLabsTranscriber(from: decoder))
        case "gladia":
            self = .gladia(try FallbackGladiaTranscriber(from: decoder))
        case "google":
            self = .google(try FallbackGoogleTranscriber(from: decoder))
        case "openai":
            self = .openai(try FallbackOpenAiTranscriber(from: decoder))
        case "soniox":
            self = .soniox(try FallbackSonioxTranscriber(from: decoder))
        case "speechmatics":
            self = .speechmatics(try FallbackSpeechmaticsTranscriber(from: decoder))
        case "talkscriber":
            self = .talkscriber(try FallbackTalkscriberTranscriber(from: decoder))
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