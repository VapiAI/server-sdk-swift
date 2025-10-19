import Foundation

/// This is the voice for the node.
/// 
/// This overrides `workflow.voice`.
public enum ConversationNodeVoice: Codable, Hashable, Sendable {
    case azure(Azure)
    case cartesia(Cartesia)
    case customVoice(CustomVoice)
    case deepgram(Deepgram)
    case elevenLabs(ElevenLabs)
    case hume(Hume)
    case lmnt(Lmnt)
    case neuphonic(Neuphonic)
    case openai(Openai)
    case playht(Playht)
    case rimeAi(RimeAi)
    case smallestAi(SmallestAi)
    case tavus(Tavus)
    case vapi(Vapi)
    case sesame(Sesame)
    case inworld(Inworld)
    case minimax(Minimax)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "azure":
            self = .azure(try Azure(from: decoder))
        case "cartesia":
            self = .cartesia(try Cartesia(from: decoder))
        case "custom-voice":
            self = .customVoice(try CustomVoice(from: decoder))
        case "deepgram":
            self = .deepgram(try Deepgram(from: decoder))
        case "11labs":
            self = .elevenLabs(try ElevenLabs(from: decoder))
        case "hume":
            self = .hume(try Hume(from: decoder))
        case "lmnt":
            self = .lmnt(try Lmnt(from: decoder))
        case "neuphonic":
            self = .neuphonic(try Neuphonic(from: decoder))
        case "openai":
            self = .openai(try Openai(from: decoder))
        case "playht":
            self = .playht(try Playht(from: decoder))
        case "rime-ai":
            self = .rimeAi(try RimeAi(from: decoder))
        case "smallest-ai":
            self = .smallestAi(try SmallestAi(from: decoder))
        case "tavus":
            self = .tavus(try Tavus(from: decoder))
        case "vapi":
            self = .vapi(try Vapi(from: decoder))
        case "sesame":
            self = .sesame(try Sesame(from: decoder))
        case "inworld":
            self = .inworld(try Inworld(from: decoder))
        case "minimax":
            self = .minimax(try Minimax(from: decoder))
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
        case .azure(let data):
            try data.encode(to: encoder)
        case .cartesia(let data):
            try data.encode(to: encoder)
        case .customVoice(let data):
            try data.encode(to: encoder)
        case .deepgram(let data):
            try data.encode(to: encoder)
        case .elevenLabs(let data):
            try data.encode(to: encoder)
        case .hume(let data):
            try data.encode(to: encoder)
        case .lmnt(let data):
            try data.encode(to: encoder)
        case .neuphonic(let data):
            try data.encode(to: encoder)
        case .openai(let data):
            try data.encode(to: encoder)
        case .playht(let data):
            try data.encode(to: encoder)
        case .rimeAi(let data):
            try data.encode(to: encoder)
        case .smallestAi(let data):
            try data.encode(to: encoder)
        case .tavus(let data):
            try data.encode(to: encoder)
        case .vapi(let data):
            try data.encode(to: encoder)
        case .sesame(let data):
            try data.encode(to: encoder)
        case .inworld(let data):
            try data.encode(to: encoder)
        case .minimax(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Azure: Codable, Hashable, Sendable {
        public let provider: String = "azure"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the provider-specific ID that will be used.
        public let voiceId: AzureVoiceId
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the speed multiplier that will be used.
        public let speed: Double?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: AzureVoiceId,
            chunkPlan: ChunkPlan? = nil,
            speed: Double? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.chunkPlan = chunkPlan
            self.speed = speed
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(AzureVoiceId.self, forKey: .voiceId)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.speed, forKey: .speed)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case chunkPlan
            case speed
            case fallbackPlan
        }
    }

    public struct Cartesia: Codable, Hashable, Sendable {
        public let provider: String = "cartesia"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// The ID of the particular voice you want to use.
        public let voiceId: String
        /// This is the model that will be used. This is optional and will default to the correct model for the voiceId.
        public let model: CartesiaVoiceModel?
        /// This is the language that will be used. This is optional and will default to the correct language for the voiceId.
        public let language: CartesiaVoiceLanguage?
        /// Experimental controls for Cartesia voice generation
        public let experimentalControls: CartesiaExperimentalControls?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: String,
            model: CartesiaVoiceModel? = nil,
            language: CartesiaVoiceLanguage? = nil,
            experimentalControls: CartesiaExperimentalControls? = nil,
            chunkPlan: ChunkPlan? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.model = model
            self.language = language
            self.experimentalControls = experimentalControls
            self.chunkPlan = chunkPlan
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(String.self, forKey: .voiceId)
            self.model = try container.decodeIfPresent(CartesiaVoiceModel.self, forKey: .model)
            self.language = try container.decodeIfPresent(CartesiaVoiceLanguage.self, forKey: .language)
            self.experimentalControls = try container.decodeIfPresent(CartesiaExperimentalControls.self, forKey: .experimentalControls)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.experimentalControls, forKey: .experimentalControls)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case model
            case language
            case experimentalControls
            case chunkPlan
            case fallbackPlan
        }
    }

    public struct CustomVoice: Codable, Hashable, Sendable {
        public let provider: String = "custom-voice"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is where the voice request will be sent.
        /// 
        /// Request Example:
        /// 
        /// POST https://{server.url}
        /// Content-Type: application/json
        /// 
        /// {
        ///   "message": {
        ///     "type": "voice-request",
        ///     "text": "Hello, world!",
        ///     "sampleRate": 24000,
        ///     ...other metadata about the call...
        ///   }
        /// }
        /// 
        /// Response Expected: 1-channel 16-bit raw PCM audio at the sample rate specified in the request. Here is how the response will be piped to the transport:
        /// ```
        /// response.on('data', (chunk: Buffer) => {
        ///   outputStream.write(chunk);
        /// });
        /// ```
        public let server: Server
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            chunkPlan: ChunkPlan? = nil,
            server: Server,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.chunkPlan = chunkPlan
            self.server = server
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.server = try container.decode(Server.self, forKey: .server)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encode(self.server, forKey: .server)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case chunkPlan
            case server
            case fallbackPlan
        }
    }

    public struct Deepgram: Codable, Hashable, Sendable {
        public let provider: String = "deepgram"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the provider-specific ID that will be used.
        public let voiceId: DeepgramVoiceId
        /// This is the model that will be used. Defaults to 'aura-2' when not specified.
        public let model: DeepgramVoiceModel?
        /// If set to true, this will add mip_opt_out=true as a query parameter of all API requests. See https://developers.deepgram.com/docs/the-deepgram-model-improvement-partnership-program#want-to-opt-out
        /// 
        /// This will only be used if you are using your own Deepgram API key.
        /// 
        /// @default false
        public let mipOptOut: Bool?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: DeepgramVoiceId,
            model: DeepgramVoiceModel? = nil,
            mipOptOut: Bool? = nil,
            chunkPlan: ChunkPlan? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.model = model
            self.mipOptOut = mipOptOut
            self.chunkPlan = chunkPlan
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(DeepgramVoiceId.self, forKey: .voiceId)
            self.model = try container.decodeIfPresent(DeepgramVoiceModel.self, forKey: .model)
            self.mipOptOut = try container.decodeIfPresent(Bool.self, forKey: .mipOptOut)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.mipOptOut, forKey: .mipOptOut)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case model
            case mipOptOut
            case chunkPlan
            case fallbackPlan
        }
    }

    public struct ElevenLabs: Codable, Hashable, Sendable {
        public let provider: String = "11labs"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the provider-specific ID that will be used. Ensure the Voice is present in your 11Labs Voice Library.
        public let voiceId: ElevenLabsVoiceId
        /// Defines the stability for voice settings.
        public let stability: Double?
        /// Defines the similarity boost for voice settings.
        public let similarityBoost: Double?
        /// Defines the style for voice settings.
        public let style: Double?
        /// Defines the use speaker boost for voice settings.
        public let useSpeakerBoost: Bool?
        /// Defines the speed for voice settings.
        public let speed: Double?
        /// Defines the optimize streaming latency for voice settings. Defaults to 3.
        public let optimizeStreamingLatency: Double?
        /// This enables the use of https://elevenlabs.io/docs/speech-synthesis/prompting#pronunciation. Defaults to false to save latency.
        /// 
        /// @default false
        public let enableSsmlParsing: Bool?
        /// Defines the auto mode for voice settings. Defaults to false.
        public let autoMode: Bool?
        /// This is the model that will be used. Defaults to 'eleven_turbo_v2' if not specified.
        public let model: ElevenLabsVoiceModel?
        /// This is the language (ISO 639-1) that is enforced for the model. Currently only Turbo v2.5 supports language enforcement. For other models, an error will be returned if language code is provided.
        public let language: String?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the pronunciation dictionary locators to use.
        public let pronunciationDictionaryLocators: [ElevenLabsPronunciationDictionaryLocator]?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: ElevenLabsVoiceId,
            stability: Double? = nil,
            similarityBoost: Double? = nil,
            style: Double? = nil,
            useSpeakerBoost: Bool? = nil,
            speed: Double? = nil,
            optimizeStreamingLatency: Double? = nil,
            enableSsmlParsing: Bool? = nil,
            autoMode: Bool? = nil,
            model: ElevenLabsVoiceModel? = nil,
            language: String? = nil,
            chunkPlan: ChunkPlan? = nil,
            pronunciationDictionaryLocators: [ElevenLabsPronunciationDictionaryLocator]? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.stability = stability
            self.similarityBoost = similarityBoost
            self.style = style
            self.useSpeakerBoost = useSpeakerBoost
            self.speed = speed
            self.optimizeStreamingLatency = optimizeStreamingLatency
            self.enableSsmlParsing = enableSsmlParsing
            self.autoMode = autoMode
            self.model = model
            self.language = language
            self.chunkPlan = chunkPlan
            self.pronunciationDictionaryLocators = pronunciationDictionaryLocators
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(ElevenLabsVoiceId.self, forKey: .voiceId)
            self.stability = try container.decodeIfPresent(Double.self, forKey: .stability)
            self.similarityBoost = try container.decodeIfPresent(Double.self, forKey: .similarityBoost)
            self.style = try container.decodeIfPresent(Double.self, forKey: .style)
            self.useSpeakerBoost = try container.decodeIfPresent(Bool.self, forKey: .useSpeakerBoost)
            self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
            self.optimizeStreamingLatency = try container.decodeIfPresent(Double.self, forKey: .optimizeStreamingLatency)
            self.enableSsmlParsing = try container.decodeIfPresent(Bool.self, forKey: .enableSsmlParsing)
            self.autoMode = try container.decodeIfPresent(Bool.self, forKey: .autoMode)
            self.model = try container.decodeIfPresent(ElevenLabsVoiceModel.self, forKey: .model)
            self.language = try container.decodeIfPresent(String.self, forKey: .language)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.pronunciationDictionaryLocators = try container.decodeIfPresent([ElevenLabsPronunciationDictionaryLocator].self, forKey: .pronunciationDictionaryLocators)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.stability, forKey: .stability)
            try container.encodeIfPresent(self.similarityBoost, forKey: .similarityBoost)
            try container.encodeIfPresent(self.style, forKey: .style)
            try container.encodeIfPresent(self.useSpeakerBoost, forKey: .useSpeakerBoost)
            try container.encodeIfPresent(self.speed, forKey: .speed)
            try container.encodeIfPresent(self.optimizeStreamingLatency, forKey: .optimizeStreamingLatency)
            try container.encodeIfPresent(self.enableSsmlParsing, forKey: .enableSsmlParsing)
            try container.encodeIfPresent(self.autoMode, forKey: .autoMode)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.pronunciationDictionaryLocators, forKey: .pronunciationDictionaryLocators)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case stability
            case similarityBoost
            case style
            case useSpeakerBoost
            case speed
            case optimizeStreamingLatency
            case enableSsmlParsing
            case autoMode
            case model
            case language
            case chunkPlan
            case pronunciationDictionaryLocators
            case fallbackPlan
        }
    }

    public struct Hume: Codable, Hashable, Sendable {
        public let provider: String = "hume"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the model that will be used.
        public let model: HumeVoiceModel?
        /// The ID of the particular voice you want to use.
        public let voiceId: String
        /// Indicates whether the chosen voice is a preset Hume AI voice or a custom voice.
        public let isCustomHumeVoice: Bool?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// Natural language instructions describing how the synthesized speech should sound, including but not limited to tone, intonation, pacing, and accent (e.g., 'a soft, gentle voice with a strong British accent').
        /// 
        /// If a Voice is specified in the request, this description serves as acting instructions.
        /// If no Voice is specified, a new voice is generated based on this description.
        public let description: String?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            model: HumeVoiceModel? = nil,
            voiceId: String,
            isCustomHumeVoice: Bool? = nil,
            chunkPlan: ChunkPlan? = nil,
            description: String? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.model = model
            self.voiceId = voiceId
            self.isCustomHumeVoice = isCustomHumeVoice
            self.chunkPlan = chunkPlan
            self.description = description
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.model = try container.decodeIfPresent(HumeVoiceModel.self, forKey: .model)
            self.voiceId = try container.decode(String.self, forKey: .voiceId)
            self.isCustomHumeVoice = try container.decodeIfPresent(Bool.self, forKey: .isCustomHumeVoice)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.isCustomHumeVoice, forKey: .isCustomHumeVoice)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.description, forKey: .description)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case model
            case voiceId
            case isCustomHumeVoice
            case chunkPlan
            case description
            case fallbackPlan
        }
    }

    public struct Lmnt: Codable, Hashable, Sendable {
        public let provider: String = "lmnt"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the provider-specific ID that will be used.
        public let voiceId: LmntVoiceId
        /// This is the speed multiplier that will be used.
        public let speed: Double?
        /// Two letter ISO 639-1 language code. Use "auto" for auto-detection.
        public let language: LmntVoiceLanguage?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: LmntVoiceId,
            speed: Double? = nil,
            language: LmntVoiceLanguage? = nil,
            chunkPlan: ChunkPlan? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.speed = speed
            self.language = language
            self.chunkPlan = chunkPlan
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(LmntVoiceId.self, forKey: .voiceId)
            self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
            self.language = try container.decodeIfPresent(LmntVoiceLanguage.self, forKey: .language)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.speed, forKey: .speed)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case speed
            case language
            case chunkPlan
            case fallbackPlan
        }
    }

    public struct Neuphonic: Codable, Hashable, Sendable {
        public let provider: String = "neuphonic"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the provider-specific ID that will be used.
        public let voiceId: String
        /// This is the model that will be used. Defaults to 'neu_fast' if not specified.
        public let model: NeuphonicVoiceModel?
        /// This is the language (ISO 639-1) that is enforced for the model.
        public let language: [String: JSONValue]
        /// This is the speed multiplier that will be used.
        public let speed: Double?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: String,
            model: NeuphonicVoiceModel? = nil,
            language: [String: JSONValue],
            speed: Double? = nil,
            chunkPlan: ChunkPlan? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.model = model
            self.language = language
            self.speed = speed
            self.chunkPlan = chunkPlan
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(String.self, forKey: .voiceId)
            self.model = try container.decodeIfPresent(NeuphonicVoiceModel.self, forKey: .model)
            self.language = try container.decode([String: JSONValue].self, forKey: .language)
            self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encode(self.language, forKey: .language)
            try container.encodeIfPresent(self.speed, forKey: .speed)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case model
            case language
            case speed
            case chunkPlan
            case fallbackPlan
        }
    }

    public struct Openai: Codable, Hashable, Sendable {
        public let provider: String = "openai"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the provider-specific ID that will be used.
        /// Please note that ash, ballad, coral, sage, and verse may only be used with realtime models.
        public let voiceId: OpenAiVoiceId
        /// This is the model that will be used for text-to-speech.
        public let model: OpenAiVoiceModel?
        /// This is a prompt that allows you to control the voice of your generated audio.
        /// Does not work with 'tts-1' or 'tts-1-hd' models.
        public let instructions: String?
        /// This is the speed multiplier that will be used.
        public let speed: Double?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: OpenAiVoiceId,
            model: OpenAiVoiceModel? = nil,
            instructions: String? = nil,
            speed: Double? = nil,
            chunkPlan: ChunkPlan? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.model = model
            self.instructions = instructions
            self.speed = speed
            self.chunkPlan = chunkPlan
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(OpenAiVoiceId.self, forKey: .voiceId)
            self.model = try container.decodeIfPresent(OpenAiVoiceModel.self, forKey: .model)
            self.instructions = try container.decodeIfPresent(String.self, forKey: .instructions)
            self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.instructions, forKey: .instructions)
            try container.encodeIfPresent(self.speed, forKey: .speed)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case model
            case instructions
            case speed
            case chunkPlan
            case fallbackPlan
        }
    }

    public struct Playht: Codable, Hashable, Sendable {
        public let provider: String = "playht"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the provider-specific ID that will be used.
        public let voiceId: PlayHtVoiceId
        /// This is the speed multiplier that will be used.
        public let speed: Double?
        /// A floating point number between 0, exclusive, and 2, inclusive. If equal to null or not provided, the model's default temperature will be used. The temperature parameter controls variance. Lower temperatures result in more predictable results, higher temperatures allow each run to vary more, so the voice may sound less like the baseline voice.
        public let temperature: Double?
        /// An emotion to be applied to the speech.
        public let emotion: PlayHtVoiceEmotion?
        /// A number between 1 and 6. Use lower numbers to reduce how unique your chosen voice will be compared to other voices.
        public let voiceGuidance: Double?
        /// A number between 1 and 30. Use lower numbers to to reduce how strong your chosen emotion will be. Higher numbers will create a very emotional performance.
        public let styleGuidance: Double?
        /// A number between 1 and 2. This number influences how closely the generated speech adheres to the input text. Use lower values to create more fluid speech, but with a higher chance of deviating from the input text. Higher numbers will make the generated speech more accurate to the input text, ensuring that the words spoken align closely with the provided text.
        public let textGuidance: Double?
        /// Playht voice model/engine to use.
        public let model: PlayHtVoiceModel?
        /// The language to use for the speech.
        public let language: PlayHtVoiceLanguage?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: PlayHtVoiceId,
            speed: Double? = nil,
            temperature: Double? = nil,
            emotion: PlayHtVoiceEmotion? = nil,
            voiceGuidance: Double? = nil,
            styleGuidance: Double? = nil,
            textGuidance: Double? = nil,
            model: PlayHtVoiceModel? = nil,
            language: PlayHtVoiceLanguage? = nil,
            chunkPlan: ChunkPlan? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.speed = speed
            self.temperature = temperature
            self.emotion = emotion
            self.voiceGuidance = voiceGuidance
            self.styleGuidance = styleGuidance
            self.textGuidance = textGuidance
            self.model = model
            self.language = language
            self.chunkPlan = chunkPlan
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(PlayHtVoiceId.self, forKey: .voiceId)
            self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
            self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
            self.emotion = try container.decodeIfPresent(PlayHtVoiceEmotion.self, forKey: .emotion)
            self.voiceGuidance = try container.decodeIfPresent(Double.self, forKey: .voiceGuidance)
            self.styleGuidance = try container.decodeIfPresent(Double.self, forKey: .styleGuidance)
            self.textGuidance = try container.decodeIfPresent(Double.self, forKey: .textGuidance)
            self.model = try container.decodeIfPresent(PlayHtVoiceModel.self, forKey: .model)
            self.language = try container.decodeIfPresent(PlayHtVoiceLanguage.self, forKey: .language)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.speed, forKey: .speed)
            try container.encodeIfPresent(self.temperature, forKey: .temperature)
            try container.encodeIfPresent(self.emotion, forKey: .emotion)
            try container.encodeIfPresent(self.voiceGuidance, forKey: .voiceGuidance)
            try container.encodeIfPresent(self.styleGuidance, forKey: .styleGuidance)
            try container.encodeIfPresent(self.textGuidance, forKey: .textGuidance)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case speed
            case temperature
            case emotion
            case voiceGuidance
            case styleGuidance
            case textGuidance
            case model
            case language
            case chunkPlan
            case fallbackPlan
        }
    }

    public struct RimeAi: Codable, Hashable, Sendable {
        public let provider: String = "rime-ai"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the provider-specific ID that will be used.
        public let voiceId: RimeAiVoiceId
        /// This is the model that will be used. Defaults to 'arcana' when not specified.
        public let model: RimeAiVoiceModel?
        /// This is the speed multiplier that will be used.
        public let speed: Double?
        /// This is a flag that controls whether to add slight pauses using angle brackets. Example: "Hi. <200> I'd love to have a conversation with you." adds a 200ms pause between the first and second sentences.
        public let pauseBetweenBrackets: Bool?
        /// This is a flag that controls whether text inside brackets should be phonemized (converted to phonetic pronunciation) - Example: "{h'El.o} World" will pronounce "Hello" as expected.
        public let phonemizeBetweenBrackets: Bool?
        /// This is a flag that controls whether to optimize for reduced latency in streaming. https://docs.rime.ai/api-reference/endpoint/websockets#param-reduce-latency
        public let reduceLatency: Bool?
        /// This is a string that allows inline speed control using alpha notation. https://docs.rime.ai/api-reference/endpoint/websockets#param-inline-speed-alpha
        public let inlineSpeedAlpha: String?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: RimeAiVoiceId,
            model: RimeAiVoiceModel? = nil,
            speed: Double? = nil,
            pauseBetweenBrackets: Bool? = nil,
            phonemizeBetweenBrackets: Bool? = nil,
            reduceLatency: Bool? = nil,
            inlineSpeedAlpha: String? = nil,
            chunkPlan: ChunkPlan? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.model = model
            self.speed = speed
            self.pauseBetweenBrackets = pauseBetweenBrackets
            self.phonemizeBetweenBrackets = phonemizeBetweenBrackets
            self.reduceLatency = reduceLatency
            self.inlineSpeedAlpha = inlineSpeedAlpha
            self.chunkPlan = chunkPlan
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(RimeAiVoiceId.self, forKey: .voiceId)
            self.model = try container.decodeIfPresent(RimeAiVoiceModel.self, forKey: .model)
            self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
            self.pauseBetweenBrackets = try container.decodeIfPresent(Bool.self, forKey: .pauseBetweenBrackets)
            self.phonemizeBetweenBrackets = try container.decodeIfPresent(Bool.self, forKey: .phonemizeBetweenBrackets)
            self.reduceLatency = try container.decodeIfPresent(Bool.self, forKey: .reduceLatency)
            self.inlineSpeedAlpha = try container.decodeIfPresent(String.self, forKey: .inlineSpeedAlpha)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.speed, forKey: .speed)
            try container.encodeIfPresent(self.pauseBetweenBrackets, forKey: .pauseBetweenBrackets)
            try container.encodeIfPresent(self.phonemizeBetweenBrackets, forKey: .phonemizeBetweenBrackets)
            try container.encodeIfPresent(self.reduceLatency, forKey: .reduceLatency)
            try container.encodeIfPresent(self.inlineSpeedAlpha, forKey: .inlineSpeedAlpha)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case model
            case speed
            case pauseBetweenBrackets
            case phonemizeBetweenBrackets
            case reduceLatency
            case inlineSpeedAlpha
            case chunkPlan
            case fallbackPlan
        }
    }

    public struct SmallestAi: Codable, Hashable, Sendable {
        public let provider: String = "smallest-ai"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the provider-specific ID that will be used.
        public let voiceId: SmallestAiVoiceId
        /// Smallest AI voice model to use. Defaults to 'lightning' when not specified.
        public let model: Lightning?
        /// This is the speed multiplier that will be used.
        public let speed: Double?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: SmallestAiVoiceId,
            model: Lightning? = nil,
            speed: Double? = nil,
            chunkPlan: ChunkPlan? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.model = model
            self.speed = speed
            self.chunkPlan = chunkPlan
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(SmallestAiVoiceId.self, forKey: .voiceId)
            self.model = try container.decodeIfPresent(Lightning.self, forKey: .model)
            self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.speed, forKey: .speed)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        public enum Lightning: String, Codable, Hashable, CaseIterable, Sendable {
            case lightning
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case model
            case speed
            case chunkPlan
            case fallbackPlan
        }
    }

    public struct Tavus: Codable, Hashable, Sendable {
        public let provider: String = "tavus"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the provider-specific ID that will be used.
        public let voiceId: TavusVoiceVoiceId
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the unique identifier for the persona that the replica will use in the conversation.
        public let personaId: String?
        /// This is the url that will receive webhooks with updates regarding the conversation state.
        public let callbackUrl: String?
        /// This is the name for the conversation.
        public let conversationName: String?
        /// This is the context that will be appended to any context provided in the persona, if one is provided.
        public let conversationalContext: String?
        /// This is the custom greeting that the replica will give once a participant joines the conversation.
        public let customGreeting: String?
        /// These are optional properties used to customize the conversation.
        public let properties: TavusConversationProperties?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: TavusVoiceVoiceId,
            chunkPlan: ChunkPlan? = nil,
            personaId: String? = nil,
            callbackUrl: String? = nil,
            conversationName: String? = nil,
            conversationalContext: String? = nil,
            customGreeting: String? = nil,
            properties: TavusConversationProperties? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.chunkPlan = chunkPlan
            self.personaId = personaId
            self.callbackUrl = callbackUrl
            self.conversationName = conversationName
            self.conversationalContext = conversationalContext
            self.customGreeting = customGreeting
            self.properties = properties
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(TavusVoiceVoiceId.self, forKey: .voiceId)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.personaId = try container.decodeIfPresent(String.self, forKey: .personaId)
            self.callbackUrl = try container.decodeIfPresent(String.self, forKey: .callbackUrl)
            self.conversationName = try container.decodeIfPresent(String.self, forKey: .conversationName)
            self.conversationalContext = try container.decodeIfPresent(String.self, forKey: .conversationalContext)
            self.customGreeting = try container.decodeIfPresent(String.self, forKey: .customGreeting)
            self.properties = try container.decodeIfPresent(TavusConversationProperties.self, forKey: .properties)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.personaId, forKey: .personaId)
            try container.encodeIfPresent(self.callbackUrl, forKey: .callbackUrl)
            try container.encodeIfPresent(self.conversationName, forKey: .conversationName)
            try container.encodeIfPresent(self.conversationalContext, forKey: .conversationalContext)
            try container.encodeIfPresent(self.customGreeting, forKey: .customGreeting)
            try container.encodeIfPresent(self.properties, forKey: .properties)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case chunkPlan
            case personaId
            case callbackUrl
            case conversationName
            case conversationalContext
            case customGreeting
            case properties
            case fallbackPlan
        }
    }

    public struct Vapi: Codable, Hashable, Sendable {
        public let provider: String = "vapi"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// The voices provided by Vapi
        public let voiceId: VapiVoiceVoiceId
        /// This is the speed multiplier that will be used.
        /// 
        /// @default 1
        public let speed: Double?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: VapiVoiceVoiceId,
            speed: Double? = nil,
            chunkPlan: ChunkPlan? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.speed = speed
            self.chunkPlan = chunkPlan
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(VapiVoiceVoiceId.self, forKey: .voiceId)
            self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.speed, forKey: .speed)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case speed
            case chunkPlan
            case fallbackPlan
        }
    }

    public struct Sesame: Codable, Hashable, Sendable {
        public let provider: String = "sesame"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the provider-specific ID that will be used.
        public let voiceId: String
        /// This is the model that will be used.
        public let model: Csm1B
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: String,
            model: Csm1B,
            chunkPlan: ChunkPlan? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.model = model
            self.chunkPlan = chunkPlan
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(String.self, forKey: .voiceId)
            self.model = try container.decode(Csm1B.self, forKey: .model)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        public enum Csm1B: String, Codable, Hashable, CaseIterable, Sendable {
            case csm1B = "csm-1b"
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case model
            case chunkPlan
            case fallbackPlan
        }
    }

    public struct Inworld: Codable, Hashable, Sendable {
        public let provider: String = "inworld"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// Available voices by language:
        /// • en: Alex, Ashley, Craig, Deborah, Dennis, Edward, Elizabeth, Hades, Julia, Pixie, Mark, Olivia, Priya, Ronald, Sarah, Shaun, Theodore, Timothy, Wendy, Dominus
        /// • zh: Yichen, Xiaoyin, Xinyi, Jing
        /// • nl: Erik, Katrien, Lennart, Lore
        /// • fr: Alain, Hélène, Mathieu, Étienne
        /// • de: Johanna, Josef
        /// • it: Gianni, Orietta
        /// • ja: Asuka, Satoshi
        /// • ko: Hyunwoo, Minji, Seojun, Yoona
        /// • pl: Szymon, Wojciech
        /// • pt: Heitor, Maitê
        /// • es: Diego, Lupita, Miguel, Rafael
        public let voiceId: InworldVoiceVoiceId
        /// This is the model that will be used.
        public let model: InworldTts1?
        /// Language code for Inworld TTS synthesis
        public let languageCode: InworldVoiceLanguageCode?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: InworldVoiceVoiceId,
            model: InworldTts1? = nil,
            languageCode: InworldVoiceLanguageCode? = nil,
            chunkPlan: ChunkPlan? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.model = model
            self.languageCode = languageCode
            self.chunkPlan = chunkPlan
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(InworldVoiceVoiceId.self, forKey: .voiceId)
            self.model = try container.decodeIfPresent(InworldTts1.self, forKey: .model)
            self.languageCode = try container.decodeIfPresent(InworldVoiceLanguageCode.self, forKey: .languageCode)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.languageCode, forKey: .languageCode)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        public enum InworldTts1: String, Codable, Hashable, CaseIterable, Sendable {
            case inworldTts1 = "inworld-tts-1"
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case model
            case languageCode
            case chunkPlan
            case fallbackPlan
        }
    }

    public struct Minimax: Codable, Hashable, Sendable {
        public let provider: String = "minimax"
        /// This is the flag to toggle voice caching for the assistant.
        public let cachingEnabled: Bool?
        /// This is the provider-specific ID that will be used. Use a voice from MINIMAX_PREDEFINED_VOICES or a custom cloned voice ID.
        public let voiceId: String
        /// This is the model that will be used. Options are 'speech-02-hd' and 'speech-02-turbo'.
        /// speech-02-hd is optimized for high-fidelity applications like voiceovers and audiobooks.
        /// speech-02-turbo is designed for real-time applications with low latency.
        /// 
        /// @default "speech-02-turbo"
        public let model: MinimaxVoiceModel?
        /// The emotion to use for the voice. If not provided, will use auto-detect mode.
        /// Options include: 'happy', 'sad', 'angry', 'fearful', 'surprised', 'disgusted', 'neutral'
        public let emotion: String?
        /// Voice pitch adjustment. Range from -12 to 12 semitones.
        /// @default 0
        public let pitch: Double?
        /// Voice speed adjustment. Range from 0.5 to 2.0.
        /// @default 1.0
        public let speed: Double?
        /// Voice volume adjustment. Range from 0.5 to 2.0.
        /// @default 1.0
        public let volume: Double?
        /// The region for Minimax API. Defaults to "worldwide".
        public let region: MinimaxVoiceRegion?
        /// Language hint for MiniMax T2A. Example: yue (Cantonese), zh (Chinese), en (English).
        public let languageBoost: MinimaxVoiceLanguageBoost?
        /// Enable MiniMax text normalization to improve number reading and formatting.
        public let textNormalizationEnabled: Bool?
        /// This is the plan for chunking the model output before it is sent to the voice provider.
        public let chunkPlan: ChunkPlan?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            cachingEnabled: Bool? = nil,
            voiceId: String,
            model: MinimaxVoiceModel? = nil,
            emotion: String? = nil,
            pitch: Double? = nil,
            speed: Double? = nil,
            volume: Double? = nil,
            region: MinimaxVoiceRegion? = nil,
            languageBoost: MinimaxVoiceLanguageBoost? = nil,
            textNormalizationEnabled: Bool? = nil,
            chunkPlan: ChunkPlan? = nil,
            fallbackPlan: FallbackPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.cachingEnabled = cachingEnabled
            self.voiceId = voiceId
            self.model = model
            self.emotion = emotion
            self.pitch = pitch
            self.speed = speed
            self.volume = volume
            self.region = region
            self.languageBoost = languageBoost
            self.textNormalizationEnabled = textNormalizationEnabled
            self.chunkPlan = chunkPlan
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cachingEnabled = try container.decodeIfPresent(Bool.self, forKey: .cachingEnabled)
            self.voiceId = try container.decode(String.self, forKey: .voiceId)
            self.model = try container.decodeIfPresent(MinimaxVoiceModel.self, forKey: .model)
            self.emotion = try container.decodeIfPresent(String.self, forKey: .emotion)
            self.pitch = try container.decodeIfPresent(Double.self, forKey: .pitch)
            self.speed = try container.decodeIfPresent(Double.self, forKey: .speed)
            self.volume = try container.decodeIfPresent(Double.self, forKey: .volume)
            self.region = try container.decodeIfPresent(MinimaxVoiceRegion.self, forKey: .region)
            self.languageBoost = try container.decodeIfPresent(MinimaxVoiceLanguageBoost.self, forKey: .languageBoost)
            self.textNormalizationEnabled = try container.decodeIfPresent(Bool.self, forKey: .textNormalizationEnabled)
            self.chunkPlan = try container.decodeIfPresent(ChunkPlan.self, forKey: .chunkPlan)
            self.fallbackPlan = try container.decodeIfPresent(FallbackPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.cachingEnabled, forKey: .cachingEnabled)
            try container.encode(self.voiceId, forKey: .voiceId)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.emotion, forKey: .emotion)
            try container.encodeIfPresent(self.pitch, forKey: .pitch)
            try container.encodeIfPresent(self.speed, forKey: .speed)
            try container.encodeIfPresent(self.volume, forKey: .volume)
            try container.encodeIfPresent(self.region, forKey: .region)
            try container.encodeIfPresent(self.languageBoost, forKey: .languageBoost)
            try container.encodeIfPresent(self.textNormalizationEnabled, forKey: .textNormalizationEnabled)
            try container.encodeIfPresent(self.chunkPlan, forKey: .chunkPlan)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case cachingEnabled
            case voiceId
            case model
            case emotion
            case pitch
            case speed
            case volume
            case region
            case languageBoost
            case textNormalizationEnabled
            case chunkPlan
            case fallbackPlan
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}