import Foundation

/// These are the options for the assistant's transcriber.
public enum UpdateAssistantDtoTranscriber: Codable, Hashable, Sendable {
    case assemblyAi(AssemblyAi)
    case azure(Azure)
    case customTranscriber(CustomTranscriber)
    case deepgram(Deepgram)
    case 11Labs(11Labs)
    case gladia(Gladia)
    case google(Google)
    case speechmatics(Speechmatics)
    case talkscriber(Talkscriber)
    case openai(Openai)
    case cartesia(Cartesia)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "assembly-ai":
            self = .assemblyAi(try AssemblyAi(from: decoder))
        case "azure":
            self = .azure(try Azure(from: decoder))
        case "custom-transcriber":
            self = .customTranscriber(try CustomTranscriber(from: decoder))
        case "deepgram":
            self = .deepgram(try Deepgram(from: decoder))
        case "11labs":
            self = .11Labs(try 11Labs(from: decoder))
        case "gladia":
            self = .gladia(try Gladia(from: decoder))
        case "google":
            self = .google(try Google(from: decoder))
        case "speechmatics":
            self = .speechmatics(try Speechmatics(from: decoder))
        case "talkscriber":
            self = .talkscriber(try Talkscriber(from: decoder))
        case "openai":
            self = .openai(try Openai(from: decoder))
        case "cartesia":
            self = .cartesia(try Cartesia(from: decoder))
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
        case .assemblyAi(let data):
            try data.encode(to: encoder)
        case .azure(let data):
            try data.encode(to: encoder)
        case .customTranscriber(let data):
            try data.encode(to: encoder)
        case .deepgram(let data):
            try data.encode(to: encoder)
        case .11Labs(let data):
            try data.encode(to: encoder)
        case .gladia(let data):
            try data.encode(to: encoder)
        case .google(let data):
            try data.encode(to: encoder)
        case .speechmatics(let data):
            try data.encode(to: encoder)
        case .talkscriber(let data):
            try data.encode(to: encoder)
        case .openai(let data):
            try data.encode(to: encoder)
        case .cartesia(let data):
            try data.encode(to: encoder)
        }
    }

    public struct AssemblyAi: Codable, Hashable, Sendable {
        public let provider: String = "assembly-ai"
        /// This is the language that will be set for the transcription.
        public let language: En?
        /// Transcripts below this confidence threshold will be discarded.
        /// 
        /// @default 0.4
        public let confidenceThreshold: Double?
        /// This enables formatting of transcripts.
        /// 
        /// @default true
        public let formatTurns: Bool?
        /// This is the end of turn confidence threshold. The minimum confidence that the end of turn is detected.
        /// Note: Only used if startSpeakingPlan.smartEndpointingPlan is not set.
        /// @min 0
        /// @max 1
        /// @default 0.7
        public let endOfTurnConfidenceThreshold: Double?
        /// This is the minimum end of turn silence when confident in milliseconds.
        /// Note: Only used if startSpeakingPlan.smartEndpointingPlan is not set.
        /// @default 160
        public let minEndOfTurnSilenceWhenConfident: Double?
        public let wordFinalizationMaxWaitTime: Double?
        /// This is the maximum turn silence time in milliseconds.
        /// Note: Only used if startSpeakingPlan.smartEndpointingPlan is not set.
        /// @default 400
        public let maxTurnSilence: Double?
        /// The WebSocket URL that the transcriber connects to.
        public let realtimeUrl: String?
        /// Add up to 2500 characters of custom vocabulary.
        public let wordBoost: [String]?
        /// Keyterms prompting improves recognition accuracy for specific words and phrases.
        /// Can include up to 100 keyterms, each up to 50 characters.
        /// Costs an additional $0.04/hour when enabled.
        public let keytermsPrompt: [String]?
        /// The duration of the end utterance silence threshold in milliseconds.
        public let endUtteranceSilenceThreshold: Double?
        /// Disable partial transcripts.
        /// Set to `true` to not receive partial transcripts. Defaults to `false`.
        public let disablePartialTranscripts: Bool?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackTranscriberPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            language: En? = nil,
            confidenceThreshold: Double? = nil,
            formatTurns: Bool? = nil,
            endOfTurnConfidenceThreshold: Double? = nil,
            minEndOfTurnSilenceWhenConfident: Double? = nil,
            wordFinalizationMaxWaitTime: Double? = nil,
            maxTurnSilence: Double? = nil,
            realtimeUrl: String? = nil,
            wordBoost: [String]? = nil,
            keytermsPrompt: [String]? = nil,
            endUtteranceSilenceThreshold: Double? = nil,
            disablePartialTranscripts: Bool? = nil,
            fallbackPlan: FallbackTranscriberPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.language = language
            self.confidenceThreshold = confidenceThreshold
            self.formatTurns = formatTurns
            self.endOfTurnConfidenceThreshold = endOfTurnConfidenceThreshold
            self.minEndOfTurnSilenceWhenConfident = minEndOfTurnSilenceWhenConfident
            self.wordFinalizationMaxWaitTime = wordFinalizationMaxWaitTime
            self.maxTurnSilence = maxTurnSilence
            self.realtimeUrl = realtimeUrl
            self.wordBoost = wordBoost
            self.keytermsPrompt = keytermsPrompt
            self.endUtteranceSilenceThreshold = endUtteranceSilenceThreshold
            self.disablePartialTranscripts = disablePartialTranscripts
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.language = try container.decodeIfPresent(En.self, forKey: .language)
            self.confidenceThreshold = try container.decodeIfPresent(Double.self, forKey: .confidenceThreshold)
            self.formatTurns = try container.decodeIfPresent(Bool.self, forKey: .formatTurns)
            self.endOfTurnConfidenceThreshold = try container.decodeIfPresent(Double.self, forKey: .endOfTurnConfidenceThreshold)
            self.minEndOfTurnSilenceWhenConfident = try container.decodeIfPresent(Double.self, forKey: .minEndOfTurnSilenceWhenConfident)
            self.wordFinalizationMaxWaitTime = try container.decodeIfPresent(Double.self, forKey: .wordFinalizationMaxWaitTime)
            self.maxTurnSilence = try container.decodeIfPresent(Double.self, forKey: .maxTurnSilence)
            self.realtimeUrl = try container.decodeIfPresent(String.self, forKey: .realtimeUrl)
            self.wordBoost = try container.decodeIfPresent([String].self, forKey: .wordBoost)
            self.keytermsPrompt = try container.decodeIfPresent([String].self, forKey: .keytermsPrompt)
            self.endUtteranceSilenceThreshold = try container.decodeIfPresent(Double.self, forKey: .endUtteranceSilenceThreshold)
            self.disablePartialTranscripts = try container.decodeIfPresent(Bool.self, forKey: .disablePartialTranscripts)
            self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.confidenceThreshold, forKey: .confidenceThreshold)
            try container.encodeIfPresent(self.formatTurns, forKey: .formatTurns)
            try container.encodeIfPresent(self.endOfTurnConfidenceThreshold, forKey: .endOfTurnConfidenceThreshold)
            try container.encodeIfPresent(self.minEndOfTurnSilenceWhenConfident, forKey: .minEndOfTurnSilenceWhenConfident)
            try container.encodeIfPresent(self.wordFinalizationMaxWaitTime, forKey: .wordFinalizationMaxWaitTime)
            try container.encodeIfPresent(self.maxTurnSilence, forKey: .maxTurnSilence)
            try container.encodeIfPresent(self.realtimeUrl, forKey: .realtimeUrl)
            try container.encodeIfPresent(self.wordBoost, forKey: .wordBoost)
            try container.encodeIfPresent(self.keytermsPrompt, forKey: .keytermsPrompt)
            try container.encodeIfPresent(self.endUtteranceSilenceThreshold, forKey: .endUtteranceSilenceThreshold)
            try container.encodeIfPresent(self.disablePartialTranscripts, forKey: .disablePartialTranscripts)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        public enum En: String, Codable, Hashable, CaseIterable, Sendable {
            case en
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case language
            case confidenceThreshold
            case formatTurns
            case endOfTurnConfidenceThreshold
            case minEndOfTurnSilenceWhenConfident
            case wordFinalizationMaxWaitTime
            case maxTurnSilence
            case realtimeUrl
            case wordBoost
            case keytermsPrompt
            case endUtteranceSilenceThreshold
            case disablePartialTranscripts
            case fallbackPlan
        }
    }

    public struct Azure: Codable, Hashable, Sendable {
        public let provider: String = "azure"
        /// This is the language that will be set for the transcription. The list of languages Azure supports can be found here: https://learn.microsoft.com/en-us/azure/ai-services/speech-service/language-support?tabs=stt
        public let language: AzureSpeechTranscriberLanguage?
        /// Controls how phrase boundaries are detected, enabling either simple time/silence heuristics or more advanced semantic segmentation.
        public let segmentationStrategy: AzureSpeechTranscriberSegmentationStrategy?
        /// Duration of detected silence after which the service finalizes a phrase. Configure to adjust sensitivity to pauses in speech.
        public let segmentationSilenceTimeoutMs: Double?
        /// Maximum duration a segment can reach before being cut off when using time-based segmentation.
        public let segmentationMaximumTimeMs: Double?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackTranscriberPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            language: AzureSpeechTranscriberLanguage? = nil,
            segmentationStrategy: AzureSpeechTranscriberSegmentationStrategy? = nil,
            segmentationSilenceTimeoutMs: Double? = nil,
            segmentationMaximumTimeMs: Double? = nil,
            fallbackPlan: FallbackTranscriberPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.language = language
            self.segmentationStrategy = segmentationStrategy
            self.segmentationSilenceTimeoutMs = segmentationSilenceTimeoutMs
            self.segmentationMaximumTimeMs = segmentationMaximumTimeMs
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.language = try container.decodeIfPresent(AzureSpeechTranscriberLanguage.self, forKey: .language)
            self.segmentationStrategy = try container.decodeIfPresent(AzureSpeechTranscriberSegmentationStrategy.self, forKey: .segmentationStrategy)
            self.segmentationSilenceTimeoutMs = try container.decodeIfPresent(Double.self, forKey: .segmentationSilenceTimeoutMs)
            self.segmentationMaximumTimeMs = try container.decodeIfPresent(Double.self, forKey: .segmentationMaximumTimeMs)
            self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.segmentationStrategy, forKey: .segmentationStrategy)
            try container.encodeIfPresent(self.segmentationSilenceTimeoutMs, forKey: .segmentationSilenceTimeoutMs)
            try container.encodeIfPresent(self.segmentationMaximumTimeMs, forKey: .segmentationMaximumTimeMs)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case language
            case segmentationStrategy
            case segmentationSilenceTimeoutMs
            case segmentationMaximumTimeMs
            case fallbackPlan
        }
    }

    public struct CustomTranscriber: Codable, Hashable, Sendable {
        public let provider: String = "custom-transcriber"
        /// This is where the transcription request will be sent.
        /// 
        /// Usage:
        /// 1. Vapi will initiate a websocket connection with `server.url`.
        /// 
        /// 2. Vapi will send an initial text frame with the sample rate. Format:
        /// ```
        ///     {
        ///       "type": "start",
        ///       "encoding": "linear16", // 16-bit raw PCM format
        ///       "container": "raw",
        ///       "sampleRate": {{sampleRate}},
        ///       "channels": 2 // customer is channel 0, assistant is channel 1
        ///     }
        /// ```
        /// 
        /// 3. Vapi will send the audio data in 16-bit raw PCM format as binary frames.
        /// 
        /// 4. You can read the messages something like this:
        /// ```
        /// ws.on('message', (data, isBinary) => {
        ///   if (isBinary) {
        ///     pcmBuffer = Buffer.concat([pcmBuffer, data]);
        ///     console.log(`Received PCM data, buffer size: ${pcmBuffer.length}`);
        ///   } else {
        ///     console.log('Received message:', JSON.parse(data.toString()));
        ///   }
        /// });
        /// ```
        /// 
        /// 5. You will respond with transcriptions as you have them. Format:
        /// ```
        ///  {
        ///     "type": "transcriber-response",
        ///     "transcription": "Hello, world!",
        ///     "channel": "customer" | "assistant"
        ///  }
        /// ```
        public let server: Server
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackTranscriberPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            server: Server,
            fallbackPlan: FallbackTranscriberPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.server = server
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.server = try container.decode(Server.self, forKey: .server)
            self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.server, forKey: .server)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case server
            case fallbackPlan
        }
    }

    public struct Deepgram: Codable, Hashable, Sendable {
        public let provider: String = "deepgram"
        /// This is the Deepgram model that will be used. A list of models can be found here: https://developers.deepgram.com/docs/models-languages-overview
        public let model: DeepgramTranscriberModel?
        /// This is the language that will be set for the transcription. The list of languages Deepgram supports can be found here: https://developers.deepgram.com/docs/models-languages-overview
        public let language: DeepgramTranscriberLanguage?
        /// This will be use smart format option provided by Deepgram. It's default disabled because it can sometimes format numbers as times but it's getting better.
        public let smartFormat: Bool?
        /// If set to true, this will add mip_opt_out=true as a query parameter of all API requests. See https://developers.deepgram.com/docs/the-deepgram-model-improvement-partnership-program#want-to-opt-out
        /// 
        /// This will only be used if you are using your own Deepgram API key.
        /// 
        /// @default false
        public let mipOptOut: Bool?
        /// If set to true, this will cause deepgram to convert spoken numbers to literal numerals. For example, "my phone number is nine-seven-two..." would become "my phone number is 972..."
        /// 
        /// @default false
        public let numerals: Bool?
        /// Transcripts below this confidence threshold will be discarded.
        /// 
        /// @default 0.4
        public let confidenceThreshold: Double?
        /// Eager end-of-turn confidence required to fire a eager end-of-turn event. Setting a value here will enable EagerEndOfTurn and SpeechResumed events. It is disabled by default. Only used with Flux models.
        public let eagerEotThreshold: Double?
        /// End-of-turn confidence required to finish a turn. Only used with Flux models.
        /// 
        /// @default 0.7
        public let eotThreshold: Double?
        /// A turn will be finished when this much time has passed after speech, regardless of EOT confidence. Only used with Flux models.
        /// 
        /// @default 5000
        public let eotTimeoutMs: Double?
        /// These keywords are passed to the transcription model to help it pick up use-case specific words. Anything that may not be a common word, like your company name, should be added here.
        public let keywords: [String]?
        /// Keyterm Prompting allows you improve Keyword Recall Rate (KRR) for important keyterms or phrases up to 90%.
        public let keyterm: [String]?
        /// This is the timeout after which Deepgram will send transcription on user silence. You can read in-depth documentation here: https://developers.deepgram.com/docs/endpointing.
        /// 
        /// Here are the most important bits:
        /// - Defaults to 10. This is recommended for most use cases to optimize for latency.
        /// - 10 can cause some missing transcriptions since because of the shorter context. This mostly happens for one-word utterances. For those uses cases, it's recommended to try 300. It will add a bit of latency but the quality and reliability of the experience will be better.
        /// - If neither 10 nor 300 work, contact support@vapi.ai and we'll find another solution.
        /// 
        /// @default 10
        public let endpointing: Double?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackTranscriberPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: DeepgramTranscriberModel? = nil,
            language: DeepgramTranscriberLanguage? = nil,
            smartFormat: Bool? = nil,
            mipOptOut: Bool? = nil,
            numerals: Bool? = nil,
            confidenceThreshold: Double? = nil,
            eagerEotThreshold: Double? = nil,
            eotThreshold: Double? = nil,
            eotTimeoutMs: Double? = nil,
            keywords: [String]? = nil,
            keyterm: [String]? = nil,
            endpointing: Double? = nil,
            fallbackPlan: FallbackTranscriberPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.language = language
            self.smartFormat = smartFormat
            self.mipOptOut = mipOptOut
            self.numerals = numerals
            self.confidenceThreshold = confidenceThreshold
            self.eagerEotThreshold = eagerEotThreshold
            self.eotThreshold = eotThreshold
            self.eotTimeoutMs = eotTimeoutMs
            self.keywords = keywords
            self.keyterm = keyterm
            self.endpointing = endpointing
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decodeIfPresent(DeepgramTranscriberModel.self, forKey: .model)
            self.language = try container.decodeIfPresent(DeepgramTranscriberLanguage.self, forKey: .language)
            self.smartFormat = try container.decodeIfPresent(Bool.self, forKey: .smartFormat)
            self.mipOptOut = try container.decodeIfPresent(Bool.self, forKey: .mipOptOut)
            self.numerals = try container.decodeIfPresent(Bool.self, forKey: .numerals)
            self.confidenceThreshold = try container.decodeIfPresent(Double.self, forKey: .confidenceThreshold)
            self.eagerEotThreshold = try container.decodeIfPresent(Double.self, forKey: .eagerEotThreshold)
            self.eotThreshold = try container.decodeIfPresent(Double.self, forKey: .eotThreshold)
            self.eotTimeoutMs = try container.decodeIfPresent(Double.self, forKey: .eotTimeoutMs)
            self.keywords = try container.decodeIfPresent([String].self, forKey: .keywords)
            self.keyterm = try container.decodeIfPresent([String].self, forKey: .keyterm)
            self.endpointing = try container.decodeIfPresent(Double.self, forKey: .endpointing)
            self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.smartFormat, forKey: .smartFormat)
            try container.encodeIfPresent(self.mipOptOut, forKey: .mipOptOut)
            try container.encodeIfPresent(self.numerals, forKey: .numerals)
            try container.encodeIfPresent(self.confidenceThreshold, forKey: .confidenceThreshold)
            try container.encodeIfPresent(self.eagerEotThreshold, forKey: .eagerEotThreshold)
            try container.encodeIfPresent(self.eotThreshold, forKey: .eotThreshold)
            try container.encodeIfPresent(self.eotTimeoutMs, forKey: .eotTimeoutMs)
            try container.encodeIfPresent(self.keywords, forKey: .keywords)
            try container.encodeIfPresent(self.keyterm, forKey: .keyterm)
            try container.encodeIfPresent(self.endpointing, forKey: .endpointing)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case model
            case language
            case smartFormat
            case mipOptOut
            case numerals
            case confidenceThreshold
            case eagerEotThreshold
            case eotThreshold
            case eotTimeoutMs
            case keywords
            case keyterm
            case endpointing
            case fallbackPlan
        }
    }

    public struct 11Labs: Codable, Hashable, Sendable {
        public let provider: String = "11labs"
        /// This is the model that will be used for the transcription.
        public let model: ScribeV1?
        public let language: ElevenLabsTranscriberLanguage?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackTranscriberPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: ScribeV1? = nil,
            language: ElevenLabsTranscriberLanguage? = nil,
            fallbackPlan: FallbackTranscriberPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.language = language
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decodeIfPresent(ScribeV1.self, forKey: .model)
            self.language = try container.decodeIfPresent(ElevenLabsTranscriberLanguage.self, forKey: .language)
            self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        public enum ScribeV1: String, Codable, Hashable, CaseIterable, Sendable {
            case scribeV1 = "scribe_v1"
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case model
            case language
            case fallbackPlan
        }
    }

    public struct Gladia: Codable, Hashable, Sendable {
        public let provider: String = "gladia"
        /// This is the Gladia model that will be used. Default is 'fast'
        public let model: GladiaTranscriberModel?
        /// Defines how the transcription model detects the audio language. Default value is 'automatic single language'.
        public let languageBehaviour: GladiaTranscriberLanguageBehaviour?
        /// Defines the language to use for the transcription. Required when languageBehaviour is 'manual'.
        public let language: GladiaTranscriberLanguage?
        /// Defines the languages to use for the transcription. Required when languageBehaviour is 'manual'.
        public let languages: GladiaTranscriberLanguages?
        /// Provides a custom vocabulary to the model to improve accuracy of transcribing context specific words, technical terms, names, etc. If empty, this argument is ignored.
        /// ⚠️ Warning ⚠️: Please be aware that the transcription_hint field has a character limit of 600. If you provide a transcription_hint longer than 600 characters, it will be automatically truncated to meet this limit.
        public let transcriptionHint: String?
        /// If prosody is true, you will get a transcription that can contain prosodies i.e. (laugh) (giggles) (malefic laugh) (toss) (music)… Default value is false.
        public let prosody: Bool?
        /// If true, audio will be pre-processed to improve accuracy but latency will increase. Default value is false.
        public let audioEnhancer: Bool?
        /// Transcripts below this confidence threshold will be discarded.
        /// 
        /// @default 0.4
        public let confidenceThreshold: Double?
        /// Endpointing time in seconds - time to wait before considering speech ended
        public let endpointing: Double?
        /// Speech threshold - sensitivity configuration for speech detection (0.0 to 1.0)
        public let speechThreshold: Double?
        /// Enable custom vocabulary for improved accuracy
        public let customVocabularyEnabled: Bool?
        /// Custom vocabulary configuration
        public let customVocabularyConfig: GladiaCustomVocabularyConfigDto?
        /// Region for processing audio (us-west or eu-west)
        public let region: GladiaTranscriberRegion?
        /// Enable partial transcripts for low-latency streaming transcription
        public let receivePartialTranscripts: Bool?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackTranscriberPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: GladiaTranscriberModel? = nil,
            languageBehaviour: GladiaTranscriberLanguageBehaviour? = nil,
            language: GladiaTranscriberLanguage? = nil,
            languages: GladiaTranscriberLanguages? = nil,
            transcriptionHint: String? = nil,
            prosody: Bool? = nil,
            audioEnhancer: Bool? = nil,
            confidenceThreshold: Double? = nil,
            endpointing: Double? = nil,
            speechThreshold: Double? = nil,
            customVocabularyEnabled: Bool? = nil,
            customVocabularyConfig: GladiaCustomVocabularyConfigDto? = nil,
            region: GladiaTranscriberRegion? = nil,
            receivePartialTranscripts: Bool? = nil,
            fallbackPlan: FallbackTranscriberPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.languageBehaviour = languageBehaviour
            self.language = language
            self.languages = languages
            self.transcriptionHint = transcriptionHint
            self.prosody = prosody
            self.audioEnhancer = audioEnhancer
            self.confidenceThreshold = confidenceThreshold
            self.endpointing = endpointing
            self.speechThreshold = speechThreshold
            self.customVocabularyEnabled = customVocabularyEnabled
            self.customVocabularyConfig = customVocabularyConfig
            self.region = region
            self.receivePartialTranscripts = receivePartialTranscripts
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decodeIfPresent(GladiaTranscriberModel.self, forKey: .model)
            self.languageBehaviour = try container.decodeIfPresent(GladiaTranscriberLanguageBehaviour.self, forKey: .languageBehaviour)
            self.language = try container.decodeIfPresent(GladiaTranscriberLanguage.self, forKey: .language)
            self.languages = try container.decodeIfPresent(GladiaTranscriberLanguages.self, forKey: .languages)
            self.transcriptionHint = try container.decodeIfPresent(String.self, forKey: .transcriptionHint)
            self.prosody = try container.decodeIfPresent(Bool.self, forKey: .prosody)
            self.audioEnhancer = try container.decodeIfPresent(Bool.self, forKey: .audioEnhancer)
            self.confidenceThreshold = try container.decodeIfPresent(Double.self, forKey: .confidenceThreshold)
            self.endpointing = try container.decodeIfPresent(Double.self, forKey: .endpointing)
            self.speechThreshold = try container.decodeIfPresent(Double.self, forKey: .speechThreshold)
            self.customVocabularyEnabled = try container.decodeIfPresent(Bool.self, forKey: .customVocabularyEnabled)
            self.customVocabularyConfig = try container.decodeIfPresent(GladiaCustomVocabularyConfigDto.self, forKey: .customVocabularyConfig)
            self.region = try container.decodeIfPresent(GladiaTranscriberRegion.self, forKey: .region)
            self.receivePartialTranscripts = try container.decodeIfPresent(Bool.self, forKey: .receivePartialTranscripts)
            self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.languageBehaviour, forKey: .languageBehaviour)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.languages, forKey: .languages)
            try container.encodeIfPresent(self.transcriptionHint, forKey: .transcriptionHint)
            try container.encodeIfPresent(self.prosody, forKey: .prosody)
            try container.encodeIfPresent(self.audioEnhancer, forKey: .audioEnhancer)
            try container.encodeIfPresent(self.confidenceThreshold, forKey: .confidenceThreshold)
            try container.encodeIfPresent(self.endpointing, forKey: .endpointing)
            try container.encodeIfPresent(self.speechThreshold, forKey: .speechThreshold)
            try container.encodeIfPresent(self.customVocabularyEnabled, forKey: .customVocabularyEnabled)
            try container.encodeIfPresent(self.customVocabularyConfig, forKey: .customVocabularyConfig)
            try container.encodeIfPresent(self.region, forKey: .region)
            try container.encodeIfPresent(self.receivePartialTranscripts, forKey: .receivePartialTranscripts)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case model
            case languageBehaviour
            case language
            case languages
            case transcriptionHint
            case prosody
            case audioEnhancer
            case confidenceThreshold
            case endpointing
            case speechThreshold
            case customVocabularyEnabled
            case customVocabularyConfig
            case region
            case receivePartialTranscripts
            case fallbackPlan
        }
    }

    public struct Google: Codable, Hashable, Sendable {
        public let provider: String = "google"
        /// This is the model that will be used for the transcription.
        public let model: GoogleTranscriberModel?
        /// This is the language that will be set for the transcription.
        public let language: GoogleTranscriberLanguage?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackTranscriberPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: GoogleTranscriberModel? = nil,
            language: GoogleTranscriberLanguage? = nil,
            fallbackPlan: FallbackTranscriberPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.language = language
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decodeIfPresent(GoogleTranscriberModel.self, forKey: .model)
            self.language = try container.decodeIfPresent(GoogleTranscriberLanguage.self, forKey: .language)
            self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case model
            case language
            case fallbackPlan
        }
    }

    public struct Speechmatics: Codable, Hashable, Sendable {
        public let provider: String = "speechmatics"
        /// This is the model that will be used for the transcription.
        public let model: Default?
        public let language: SpeechmaticsTranscriberLanguage?
        /// This is the operating point for the transcription. Choose between `standard` for faster turnaround with strong accuracy or `enhanced` for highest accuracy when precision is critical.
        /// 
        /// @default 'enhanced'
        public let operatingPoint: SpeechmaticsTranscriberOperatingPoint?
        /// This is the region for the Speechmatics API. Choose between EU (Europe) and US (United States) regions for lower latency and data sovereignty compliance.
        /// 
        /// @default 'eu'
        public let region: SpeechmaticsTranscriberRegion?
        /// This enables speaker diarization, which identifies and separates speakers in the transcription. Essential for multi-speaker conversations and conference calls.
        /// 
        /// @default false
        public let enableDiarization: Bool?
        /// This sets the maximum number of speakers to detect when diarization is enabled. Only used when enableDiarization is true.
        /// 
        /// @default 2
        public let maxSpeakers: Double?
        /// This enables partial transcripts during speech recognition. When false, only final transcripts are returned.
        /// 
        /// @default true
        public let enablePartials: Bool?
        /// This sets the maximum delay in milliseconds for partial transcripts. Balances latency and accuracy.
        /// 
        /// @default 3000
        public let maxDelay: Double?
        public let customVocabulary: [SpeechmaticsCustomVocabularyItem]
        /// This controls how numbers are formatted in the transcription output.
        /// 
        /// @default 'written'
        public let numeralStyle: SpeechmaticsTranscriberNumeralStyle?
        /// This enables detection of non-speech audio events like music, applause, and laughter.
        /// 
        /// @default false
        public let enableEntities: Bool?
        /// This enables automatic punctuation in the transcription output.
        /// 
        /// @default true
        public let enablePunctuation: Bool?
        /// This enables automatic capitalization in the transcription output.
        /// 
        /// @default true
        public let enableCapitalization: Bool?
        /// This is the sensitivity level for end-of-turn detection, which determines when a speaker has finished talking. Higher values are more sensitive.
        /// 
        /// @default 0.5
        public let endOfTurnSensitivity: Double?
        /// This enables removal of disfluencies (um, uh) from the transcript to create cleaner, more professional output.
        /// 
        /// @default false
        public let removeDisfluencies: Bool?
        /// This is the minimum duration in seconds for speech segments. Shorter segments will be filtered out. Helps remove noise and improve accuracy.
        /// 
        /// @default 0.0
        public let minimumSpeechDuration: Double?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackTranscriberPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: Default? = nil,
            language: SpeechmaticsTranscriberLanguage? = nil,
            operatingPoint: SpeechmaticsTranscriberOperatingPoint? = nil,
            region: SpeechmaticsTranscriberRegion? = nil,
            enableDiarization: Bool? = nil,
            maxSpeakers: Double? = nil,
            enablePartials: Bool? = nil,
            maxDelay: Double? = nil,
            customVocabulary: [SpeechmaticsCustomVocabularyItem],
            numeralStyle: SpeechmaticsTranscriberNumeralStyle? = nil,
            enableEntities: Bool? = nil,
            enablePunctuation: Bool? = nil,
            enableCapitalization: Bool? = nil,
            endOfTurnSensitivity: Double? = nil,
            removeDisfluencies: Bool? = nil,
            minimumSpeechDuration: Double? = nil,
            fallbackPlan: FallbackTranscriberPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.language = language
            self.operatingPoint = operatingPoint
            self.region = region
            self.enableDiarization = enableDiarization
            self.maxSpeakers = maxSpeakers
            self.enablePartials = enablePartials
            self.maxDelay = maxDelay
            self.customVocabulary = customVocabulary
            self.numeralStyle = numeralStyle
            self.enableEntities = enableEntities
            self.enablePunctuation = enablePunctuation
            self.enableCapitalization = enableCapitalization
            self.endOfTurnSensitivity = endOfTurnSensitivity
            self.removeDisfluencies = removeDisfluencies
            self.minimumSpeechDuration = minimumSpeechDuration
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decodeIfPresent(Default.self, forKey: .model)
            self.language = try container.decodeIfPresent(SpeechmaticsTranscriberLanguage.self, forKey: .language)
            self.operatingPoint = try container.decodeIfPresent(SpeechmaticsTranscriberOperatingPoint.self, forKey: .operatingPoint)
            self.region = try container.decodeIfPresent(SpeechmaticsTranscriberRegion.self, forKey: .region)
            self.enableDiarization = try container.decodeIfPresent(Bool.self, forKey: .enableDiarization)
            self.maxSpeakers = try container.decodeIfPresent(Double.self, forKey: .maxSpeakers)
            self.enablePartials = try container.decodeIfPresent(Bool.self, forKey: .enablePartials)
            self.maxDelay = try container.decodeIfPresent(Double.self, forKey: .maxDelay)
            self.customVocabulary = try container.decode([SpeechmaticsCustomVocabularyItem].self, forKey: .customVocabulary)
            self.numeralStyle = try container.decodeIfPresent(SpeechmaticsTranscriberNumeralStyle.self, forKey: .numeralStyle)
            self.enableEntities = try container.decodeIfPresent(Bool.self, forKey: .enableEntities)
            self.enablePunctuation = try container.decodeIfPresent(Bool.self, forKey: .enablePunctuation)
            self.enableCapitalization = try container.decodeIfPresent(Bool.self, forKey: .enableCapitalization)
            self.endOfTurnSensitivity = try container.decodeIfPresent(Double.self, forKey: .endOfTurnSensitivity)
            self.removeDisfluencies = try container.decodeIfPresent(Bool.self, forKey: .removeDisfluencies)
            self.minimumSpeechDuration = try container.decodeIfPresent(Double.self, forKey: .minimumSpeechDuration)
            self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.operatingPoint, forKey: .operatingPoint)
            try container.encodeIfPresent(self.region, forKey: .region)
            try container.encodeIfPresent(self.enableDiarization, forKey: .enableDiarization)
            try container.encodeIfPresent(self.maxSpeakers, forKey: .maxSpeakers)
            try container.encodeIfPresent(self.enablePartials, forKey: .enablePartials)
            try container.encodeIfPresent(self.maxDelay, forKey: .maxDelay)
            try container.encode(self.customVocabulary, forKey: .customVocabulary)
            try container.encodeIfPresent(self.numeralStyle, forKey: .numeralStyle)
            try container.encodeIfPresent(self.enableEntities, forKey: .enableEntities)
            try container.encodeIfPresent(self.enablePunctuation, forKey: .enablePunctuation)
            try container.encodeIfPresent(self.enableCapitalization, forKey: .enableCapitalization)
            try container.encodeIfPresent(self.endOfTurnSensitivity, forKey: .endOfTurnSensitivity)
            try container.encodeIfPresent(self.removeDisfluencies, forKey: .removeDisfluencies)
            try container.encodeIfPresent(self.minimumSpeechDuration, forKey: .minimumSpeechDuration)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        public enum Default: String, Codable, Hashable, CaseIterable, Sendable {
            case `default`
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case model
            case language
            case operatingPoint
            case region
            case enableDiarization
            case maxSpeakers
            case enablePartials
            case maxDelay
            case customVocabulary
            case numeralStyle
            case enableEntities
            case enablePunctuation
            case enableCapitalization
            case endOfTurnSensitivity
            case removeDisfluencies
            case minimumSpeechDuration
            case fallbackPlan
        }
    }

    public struct Talkscriber: Codable, Hashable, Sendable {
        public let provider: String = "talkscriber"
        /// This is the model that will be used for the transcription.
        public let model: Whisper?
        /// This is the language that will be set for the transcription. The list of languages Whisper supports can be found here: https://github.com/openai/whisper/blob/main/whisper/tokenizer.py
        public let language: TalkscriberTranscriberLanguage?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackTranscriberPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: Whisper? = nil,
            language: TalkscriberTranscriberLanguage? = nil,
            fallbackPlan: FallbackTranscriberPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.language = language
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decodeIfPresent(Whisper.self, forKey: .model)
            self.language = try container.decodeIfPresent(TalkscriberTranscriberLanguage.self, forKey: .language)
            self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        public enum Whisper: String, Codable, Hashable, CaseIterable, Sendable {
            case whisper
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case model
            case language
            case fallbackPlan
        }
    }

    public struct Openai: Codable, Hashable, Sendable {
        public let provider: String = "openai"
        /// This is the model that will be used for the transcription.
        public let model: OpenAiTranscriberModel
        /// This is the language that will be set for the transcription.
        public let language: OpenAiTranscriberLanguage?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackTranscriberPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: OpenAiTranscriberModel,
            language: OpenAiTranscriberLanguage? = nil,
            fallbackPlan: FallbackTranscriberPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.language = language
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decode(OpenAiTranscriberModel.self, forKey: .model)
            self.language = try container.decodeIfPresent(OpenAiTranscriberLanguage.self, forKey: .language)
            self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.model, forKey: .model)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case model
            case language
            case fallbackPlan
        }
    }

    public struct Cartesia: Codable, Hashable, Sendable {
        public let provider: String = "cartesia"
        public let model: InkWhisper?
        public let language: CartesiaTranscriberLanguage?
        /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
        public let fallbackPlan: FallbackTranscriberPlan?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            model: InkWhisper? = nil,
            language: CartesiaTranscriberLanguage? = nil,
            fallbackPlan: FallbackTranscriberPlan? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.model = model
            self.language = language
            self.fallbackPlan = fallbackPlan
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.model = try container.decodeIfPresent(InkWhisper.self, forKey: .model)
            self.language = try container.decodeIfPresent(CartesiaTranscriberLanguage.self, forKey: .language)
            self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.model, forKey: .model)
            try container.encodeIfPresent(self.language, forKey: .language)
            try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
        }

        public enum InkWhisper: String, Codable, Hashable, CaseIterable, Sendable {
            case inkWhisper = "ink-whisper"
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case model
            case language
            case fallbackPlan
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}