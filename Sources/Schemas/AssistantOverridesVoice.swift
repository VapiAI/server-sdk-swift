import Foundation

/// These are the options for the assistant's voice.
public enum AssistantOverridesVoice: Codable, Hashable, Sendable {
    case azure(AzureVoice)
    case cartesia(CartesiaVoice)
    case customVoice(CustomVoice)
    case deepgram(DeepgramVoice)
    case elevenLabs(ElevenLabsVoice)
    case hume(HumeVoice)
    case inworld(InworldVoice)
    case lmnt(LmntVoice)
    case minimax(MinimaxVoice)
    case neuphonic(NeuphonicVoice)
    case openai(OpenAiVoice)
    case playht(PlayHtVoice)
    case rimeAi(RimeAiVoice)
    case sesame(SesameVoice)
    case smallestAi(SmallestAiVoice)
    case tavus(TavusVoice)
    case vapi(VapiVoice)
    case wellsaid(WellSaidVoice)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "azure":
            self = .azure(try AzureVoice(from: decoder))
        case "cartesia":
            self = .cartesia(try CartesiaVoice(from: decoder))
        case "custom-voice":
            self = .customVoice(try CustomVoice(from: decoder))
        case "deepgram":
            self = .deepgram(try DeepgramVoice(from: decoder))
        case "11labs":
            self = .elevenLabs(try ElevenLabsVoice(from: decoder))
        case "hume":
            self = .hume(try HumeVoice(from: decoder))
        case "inworld":
            self = .inworld(try InworldVoice(from: decoder))
        case "lmnt":
            self = .lmnt(try LmntVoice(from: decoder))
        case "minimax":
            self = .minimax(try MinimaxVoice(from: decoder))
        case "neuphonic":
            self = .neuphonic(try NeuphonicVoice(from: decoder))
        case "openai":
            self = .openai(try OpenAiVoice(from: decoder))
        case "playht":
            self = .playht(try PlayHtVoice(from: decoder))
        case "rime-ai":
            self = .rimeAi(try RimeAiVoice(from: decoder))
        case "sesame":
            self = .sesame(try SesameVoice(from: decoder))
        case "smallest-ai":
            self = .smallestAi(try SmallestAiVoice(from: decoder))
        case "tavus":
            self = .tavus(try TavusVoice(from: decoder))
        case "vapi":
            self = .vapi(try VapiVoice(from: decoder))
        case "wellsaid":
            self = .wellsaid(try WellSaidVoice(from: decoder))
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
        case .minimax(let data):
            try container.encode("minimax", forKey: .provider)
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