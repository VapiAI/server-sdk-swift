import Foundation

public enum FallbackPlanVoicesItem: Codable, Hashable, Sendable {
    case azure(FallbackAzureVoice)
    case cartesia(FallbackCartesiaVoice)
    case customVoice(FallbackCustomVoice)
    case deepgram(FallbackDeepgramVoice)
    case elevenLabs(FallbackElevenLabsVoice)
    case hume(FallbackHumeVoice)
    case inworld(FallbackInworldVoice)
    case lmnt(FallbackLmntVoice)
    case neuphonic(FallbackNeuphonicVoice)
    case openai(FallbackOpenAiVoice)
    case playht(FallbackPlayHtVoice)
    case rimeAi(FallbackRimeAiVoice)
    case sesame(FallbackSesameVoice)
    case smallestAi(FallbackSmallestAiVoice)
    case tavus(FallbackTavusVoice)
    case vapi(FallbackVapiVoice)
    case wellsaid(FallbackWellSaidVoice)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "azure":
            self = .azure(try FallbackAzureVoice(from: decoder))
        case "cartesia":
            self = .cartesia(try FallbackCartesiaVoice(from: decoder))
        case "custom-voice":
            self = .customVoice(try FallbackCustomVoice(from: decoder))
        case "deepgram":
            self = .deepgram(try FallbackDeepgramVoice(from: decoder))
        case "11labs":
            self = .elevenLabs(try FallbackElevenLabsVoice(from: decoder))
        case "hume":
            self = .hume(try FallbackHumeVoice(from: decoder))
        case "inworld":
            self = .inworld(try FallbackInworldVoice(from: decoder))
        case "lmnt":
            self = .lmnt(try FallbackLmntVoice(from: decoder))
        case "neuphonic":
            self = .neuphonic(try FallbackNeuphonicVoice(from: decoder))
        case "openai":
            self = .openai(try FallbackOpenAiVoice(from: decoder))
        case "playht":
            self = .playht(try FallbackPlayHtVoice(from: decoder))
        case "rime-ai":
            self = .rimeAi(try FallbackRimeAiVoice(from: decoder))
        case "sesame":
            self = .sesame(try FallbackSesameVoice(from: decoder))
        case "smallest-ai":
            self = .smallestAi(try FallbackSmallestAiVoice(from: decoder))
        case "tavus":
            self = .tavus(try FallbackTavusVoice(from: decoder))
        case "vapi":
            self = .vapi(try FallbackVapiVoice(from: decoder))
        case "wellsaid":
            self = .wellsaid(try FallbackWellSaidVoice(from: decoder))
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
        case .azure(let data):
            try container.encode("azure", forKey: .provider)
            try data.encode(to: encoder)
        case .cartesia(let data):
            try container.encode("cartesia", forKey: .provider)
            try data.encode(to: encoder)
        case .customVoice(let data):
            try container.encode("custom-voice", forKey: .provider)
            try data.encode(to: encoder)
        case .deepgram(let data):
            try container.encode("deepgram", forKey: .provider)
            try data.encode(to: encoder)
        case .elevenLabs(let data):
            try container.encode("11labs", forKey: .provider)
            try data.encode(to: encoder)
        case .hume(let data):
            try container.encode("hume", forKey: .provider)
            try data.encode(to: encoder)
        case .inworld(let data):
            try container.encode("inworld", forKey: .provider)
            try data.encode(to: encoder)
        case .lmnt(let data):
            try container.encode("lmnt", forKey: .provider)
            try data.encode(to: encoder)
        case .neuphonic(let data):
            try container.encode("neuphonic", forKey: .provider)
            try data.encode(to: encoder)
        case .openai(let data):
            try container.encode("openai", forKey: .provider)
            try data.encode(to: encoder)
        case .playht(let data):
            try container.encode("playht", forKey: .provider)
            try data.encode(to: encoder)
        case .rimeAi(let data):
            try container.encode("rime-ai", forKey: .provider)
            try data.encode(to: encoder)
        case .sesame(let data):
            try container.encode("sesame", forKey: .provider)
            try data.encode(to: encoder)
        case .smallestAi(let data):
            try container.encode("smallest-ai", forKey: .provider)
            try data.encode(to: encoder)
        case .tavus(let data):
            try container.encode("tavus", forKey: .provider)
            try data.encode(to: encoder)
        case .vapi(let data):
            try container.encode("vapi", forKey: .provider)
            try data.encode(to: encoder)
        case .wellsaid(let data):
            try container.encode("wellsaid", forKey: .provider)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}