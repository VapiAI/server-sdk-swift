import Foundation

public enum UpdateWorkflowDtoCredentialsItem: Codable, Hashable, Sendable {
    case 11Labs(11Labs)
    case anthropic(Anthropic)
    case anyscale(Anyscale)
    case assemblyAi(AssemblyAi)
    case azureOpenai(AzureOpenai)
    case azure(Azure)
    case byoSipTrunk(ByoSipTrunk)
    case cartesia(Cartesia)
    case cerebras(Cerebras)
    case cloudflare(Cloudflare)
    case customLlm(CustomLlm)
    case deepgram(Deepgram)
    case deepinfra(Deepinfra)
    case deepSeek(DeepSeek)
    case gcp(Gcp)
    case gladia(Gladia)
    case gohighlevel(Gohighlevel)
    case google(Google)
    case groq(Groq)
    case inflectionAi(InflectionAi)
    case langfuse(Langfuse)
    case lmnt(Lmnt)
    case make(Make)
    case openai(Openai)
    case openrouter(Openrouter)
    case perplexityAi(PerplexityAi)
    case playht(Playht)
    case rimeAi(RimeAi)
    case runpod(Runpod)
    case s3(S3)
    case supabase(Supabase)
    case smallestAi(SmallestAi)
    case tavus(Tavus)
    case togetherAi(TogetherAi)
    case twilio(Twilio)
    case vonage(Vonage)
    case webhook(Webhook)
    case customCredential(CustomCredential)
    case xai(Xai)
    case neuphonic(Neuphonic)
    case hume(Hume)
    case mistral(Mistral)
    case speechmatics(Speechmatics)
    case trieve(Trieve)
    case googleCalendarOauth2Client(GoogleCalendarOauth2Client)
    case googleCalendarOauth2Authorization(GoogleCalendarOauth2Authorization)
    case googleSheetsOauth2Authorization(GoogleSheetsOauth2Authorization)
    case slackOauth2Authorization(SlackOauth2Authorization)
    case ghlOauth2Authorization(GhlOauth2Authorization)
    case inworld(Inworld)
    case minimax(Minimax)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "11labs":
            self = .11Labs(try 11Labs(from: decoder))
        case "anthropic":
            self = .anthropic(try Anthropic(from: decoder))
        case "anyscale":
            self = .anyscale(try Anyscale(from: decoder))
        case "assembly-ai":
            self = .assemblyAi(try AssemblyAi(from: decoder))
        case "azure-openai":
            self = .azureOpenai(try AzureOpenai(from: decoder))
        case "azure":
            self = .azure(try Azure(from: decoder))
        case "byo-sip-trunk":
            self = .byoSipTrunk(try ByoSipTrunk(from: decoder))
        case "cartesia":
            self = .cartesia(try Cartesia(from: decoder))
        case "cerebras":
            self = .cerebras(try Cerebras(from: decoder))
        case "cloudflare":
            self = .cloudflare(try Cloudflare(from: decoder))
        case "custom-llm":
            self = .customLlm(try CustomLlm(from: decoder))
        case "deepgram":
            self = .deepgram(try Deepgram(from: decoder))
        case "deepinfra":
            self = .deepinfra(try Deepinfra(from: decoder))
        case "deep-seek":
            self = .deepSeek(try DeepSeek(from: decoder))
        case "gcp":
            self = .gcp(try Gcp(from: decoder))
        case "gladia":
            self = .gladia(try Gladia(from: decoder))
        case "gohighlevel":
            self = .gohighlevel(try Gohighlevel(from: decoder))
        case "google":
            self = .google(try Google(from: decoder))
        case "groq":
            self = .groq(try Groq(from: decoder))
        case "inflection-ai":
            self = .inflectionAi(try InflectionAi(from: decoder))
        case "langfuse":
            self = .langfuse(try Langfuse(from: decoder))
        case "lmnt":
            self = .lmnt(try Lmnt(from: decoder))
        case "make":
            self = .make(try Make(from: decoder))
        case "openai":
            self = .openai(try Openai(from: decoder))
        case "openrouter":
            self = .openrouter(try Openrouter(from: decoder))
        case "perplexity-ai":
            self = .perplexityAi(try PerplexityAi(from: decoder))
        case "playht":
            self = .playht(try Playht(from: decoder))
        case "rime-ai":
            self = .rimeAi(try RimeAi(from: decoder))
        case "runpod":
            self = .runpod(try Runpod(from: decoder))
        case "s3":
            self = .s3(try S3(from: decoder))
        case "supabase":
            self = .supabase(try Supabase(from: decoder))
        case "smallest-ai":
            self = .smallestAi(try SmallestAi(from: decoder))
        case "tavus":
            self = .tavus(try Tavus(from: decoder))
        case "together-ai":
            self = .togetherAi(try TogetherAi(from: decoder))
        case "twilio":
            self = .twilio(try Twilio(from: decoder))
        case "vonage":
            self = .vonage(try Vonage(from: decoder))
        case "webhook":
            self = .webhook(try Webhook(from: decoder))
        case "custom-credential":
            self = .customCredential(try CustomCredential(from: decoder))
        case "xai":
            self = .xai(try Xai(from: decoder))
        case "neuphonic":
            self = .neuphonic(try Neuphonic(from: decoder))
        case "hume":
            self = .hume(try Hume(from: decoder))
        case "mistral":
            self = .mistral(try Mistral(from: decoder))
        case "speechmatics":
            self = .speechmatics(try Speechmatics(from: decoder))
        case "trieve":
            self = .trieve(try Trieve(from: decoder))
        case "google.calendar.oauth2-client":
            self = .googleCalendarOauth2Client(try GoogleCalendarOauth2Client(from: decoder))
        case "google.calendar.oauth2-authorization":
            self = .googleCalendarOauth2Authorization(try GoogleCalendarOauth2Authorization(from: decoder))
        case "google.sheets.oauth2-authorization":
            self = .googleSheetsOauth2Authorization(try GoogleSheetsOauth2Authorization(from: decoder))
        case "slack.oauth2-authorization":
            self = .slackOauth2Authorization(try SlackOauth2Authorization(from: decoder))
        case "ghl.oauth2-authorization":
            self = .ghlOauth2Authorization(try GhlOauth2Authorization(from: decoder))
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
        case .11Labs(let data):
            try data.encode(to: encoder)
        case .anthropic(let data):
            try data.encode(to: encoder)
        case .anyscale(let data):
            try data.encode(to: encoder)
        case .assemblyAi(let data):
            try data.encode(to: encoder)
        case .azureOpenai(let data):
            try data.encode(to: encoder)
        case .azure(let data):
            try data.encode(to: encoder)
        case .byoSipTrunk(let data):
            try data.encode(to: encoder)
        case .cartesia(let data):
            try data.encode(to: encoder)
        case .cerebras(let data):
            try data.encode(to: encoder)
        case .cloudflare(let data):
            try data.encode(to: encoder)
        case .customLlm(let data):
            try data.encode(to: encoder)
        case .deepgram(let data):
            try data.encode(to: encoder)
        case .deepinfra(let data):
            try data.encode(to: encoder)
        case .deepSeek(let data):
            try data.encode(to: encoder)
        case .gcp(let data):
            try data.encode(to: encoder)
        case .gladia(let data):
            try data.encode(to: encoder)
        case .gohighlevel(let data):
            try data.encode(to: encoder)
        case .google(let data):
            try data.encode(to: encoder)
        case .groq(let data):
            try data.encode(to: encoder)
        case .inflectionAi(let data):
            try data.encode(to: encoder)
        case .langfuse(let data):
            try data.encode(to: encoder)
        case .lmnt(let data):
            try data.encode(to: encoder)
        case .make(let data):
            try data.encode(to: encoder)
        case .openai(let data):
            try data.encode(to: encoder)
        case .openrouter(let data):
            try data.encode(to: encoder)
        case .perplexityAi(let data):
            try data.encode(to: encoder)
        case .playht(let data):
            try data.encode(to: encoder)
        case .rimeAi(let data):
            try data.encode(to: encoder)
        case .runpod(let data):
            try data.encode(to: encoder)
        case .s3(let data):
            try data.encode(to: encoder)
        case .supabase(let data):
            try data.encode(to: encoder)
        case .smallestAi(let data):
            try data.encode(to: encoder)
        case .tavus(let data):
            try data.encode(to: encoder)
        case .togetherAi(let data):
            try data.encode(to: encoder)
        case .twilio(let data):
            try data.encode(to: encoder)
        case .vonage(let data):
            try data.encode(to: encoder)
        case .webhook(let data):
            try data.encode(to: encoder)
        case .customCredential(let data):
            try data.encode(to: encoder)
        case .xai(let data):
            try data.encode(to: encoder)
        case .neuphonic(let data):
            try data.encode(to: encoder)
        case .hume(let data):
            try data.encode(to: encoder)
        case .mistral(let data):
            try data.encode(to: encoder)
        case .speechmatics(let data):
            try data.encode(to: encoder)
        case .trieve(let data):
            try data.encode(to: encoder)
        case .googleCalendarOauth2Client(let data):
            try data.encode(to: encoder)
        case .googleCalendarOauth2Authorization(let data):
            try data.encode(to: encoder)
        case .googleSheetsOauth2Authorization(let data):
            try data.encode(to: encoder)
        case .slackOauth2Authorization(let data):
            try data.encode(to: encoder)
        case .ghlOauth2Authorization(let data):
            try data.encode(to: encoder)
        case .inworld(let data):
            try data.encode(to: encoder)
        case .minimax(let data):
            try data.encode(to: encoder)
        }
    }

    public struct 11Labs: Codable, Hashable, Sendable {
        public let provider: String = "11labs"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Anthropic: Codable, Hashable, Sendable {
        public let provider: String = "anthropic"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Anyscale: Codable, Hashable, Sendable {
        public let provider: String = "anyscale"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct AssemblyAi: Codable, Hashable, Sendable {
        public let provider: String = "assembly-ai"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct AzureOpenai: Codable, Hashable, Sendable {
        public let provider: String = "azure-openai"
        public let region: CreateAzureOpenAiCredentialDtoRegion
        public let models: [CreateAzureOpenAiCredentialDtoModelsItem]
        /// This is not returned in the API.
        public let openAiKey: String
        /// This is not returned in the API.
        public let ocpApimSubscriptionKey: String?
        public let openAiEndpoint: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            region: CreateAzureOpenAiCredentialDtoRegion,
            models: [CreateAzureOpenAiCredentialDtoModelsItem],
            openAiKey: String,
            ocpApimSubscriptionKey: String? = nil,
            openAiEndpoint: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.region = region
            self.models = models
            self.openAiKey = openAiKey
            self.ocpApimSubscriptionKey = ocpApimSubscriptionKey
            self.openAiEndpoint = openAiEndpoint
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.region = try container.decode(CreateAzureOpenAiCredentialDtoRegion.self, forKey: .region)
            self.models = try container.decode([CreateAzureOpenAiCredentialDtoModelsItem].self, forKey: .models)
            self.openAiKey = try container.decode(String.self, forKey: .openAiKey)
            self.ocpApimSubscriptionKey = try container.decodeIfPresent(String.self, forKey: .ocpApimSubscriptionKey)
            self.openAiEndpoint = try container.decode(String.self, forKey: .openAiEndpoint)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.region, forKey: .region)
            try container.encode(self.models, forKey: .models)
            try container.encode(self.openAiKey, forKey: .openAiKey)
            try container.encodeIfPresent(self.ocpApimSubscriptionKey, forKey: .ocpApimSubscriptionKey)
            try container.encode(self.openAiEndpoint, forKey: .openAiEndpoint)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case region
            case models
            case openAiKey = "openAIKey"
            case ocpApimSubscriptionKey
            case openAiEndpoint = "openAIEndpoint"
            case name
        }
    }

    public struct Azure: Codable, Hashable, Sendable {
        public let provider: String = "azure"
        /// This is the service being used in Azure.
        public let service: CreateAzureCredentialDtoService
        /// This is the region of the Azure resource.
        public let region: CreateAzureCredentialDtoRegion?
        /// This is not returned in the API.
        public let apiKey: String?
        /// This is the order in which this storage provider is tried during upload retries. Lower numbers are tried first in increasing order.
        public let fallbackIndex: Double?
        /// This is the bucket plan that can be provided to store call artifacts in Azure Blob Storage.
        public let bucketPlan: AzureBlobStorageBucketPlan?
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            service: CreateAzureCredentialDtoService,
            region: CreateAzureCredentialDtoRegion? = nil,
            apiKey: String? = nil,
            fallbackIndex: Double? = nil,
            bucketPlan: AzureBlobStorageBucketPlan? = nil,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.service = service
            self.region = region
            self.apiKey = apiKey
            self.fallbackIndex = fallbackIndex
            self.bucketPlan = bucketPlan
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.service = try container.decode(CreateAzureCredentialDtoService.self, forKey: .service)
            self.region = try container.decodeIfPresent(CreateAzureCredentialDtoRegion.self, forKey: .region)
            self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
            self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
            self.bucketPlan = try container.decodeIfPresent(AzureBlobStorageBucketPlan.self, forKey: .bucketPlan)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.service, forKey: .service)
            try container.encodeIfPresent(self.region, forKey: .region)
            try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
            try container.encodeIfPresent(self.bucketPlan, forKey: .bucketPlan)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case service
            case region
            case apiKey
            case fallbackIndex
            case bucketPlan
            case name
        }
    }

    public struct ByoSipTrunk: Codable, Hashable, Sendable {
        public let provider: String = "byo-sip-trunk"
        /// This is the list of SIP trunk's gateways.
        public let gateways: [SipTrunkGateway]
        /// This can be used to configure the outbound authentication if required by the SIP trunk.
        public let outboundAuthenticationPlan: SipTrunkOutboundAuthenticationPlan?
        /// This ensures the outbound origination attempts have a leading plus. Defaults to false to match conventional telecom behavior.
        /// 
        /// Usage:
        /// - Vonage/Twilio requires leading plus for all outbound calls. Set this to true.
        /// 
        /// @default false
        public let outboundLeadingPlusEnabled: Bool?
        /// This can be used to configure the tech prefix on outbound calls. This is an advanced property.
        public let techPrefix: String?
        /// This can be used to enable the SIP diversion header for authenticating the calling number if the SIP trunk supports it. This is an advanced property.
        public let sipDiversionHeader: String?
        /// This is an advanced configuration for enterprise deployments. This uses the onprem SBC to trunk into the SIP trunk's `gateways`, rather than the managed SBC provided by Vapi.
        public let sbcConfiguration: SbcConfiguration?
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            gateways: [SipTrunkGateway],
            outboundAuthenticationPlan: SipTrunkOutboundAuthenticationPlan? = nil,
            outboundLeadingPlusEnabled: Bool? = nil,
            techPrefix: String? = nil,
            sipDiversionHeader: String? = nil,
            sbcConfiguration: SbcConfiguration? = nil,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.gateways = gateways
            self.outboundAuthenticationPlan = outboundAuthenticationPlan
            self.outboundLeadingPlusEnabled = outboundLeadingPlusEnabled
            self.techPrefix = techPrefix
            self.sipDiversionHeader = sipDiversionHeader
            self.sbcConfiguration = sbcConfiguration
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.gateways = try container.decode([SipTrunkGateway].self, forKey: .gateways)
            self.outboundAuthenticationPlan = try container.decodeIfPresent(SipTrunkOutboundAuthenticationPlan.self, forKey: .outboundAuthenticationPlan)
            self.outboundLeadingPlusEnabled = try container.decodeIfPresent(Bool.self, forKey: .outboundLeadingPlusEnabled)
            self.techPrefix = try container.decodeIfPresent(String.self, forKey: .techPrefix)
            self.sipDiversionHeader = try container.decodeIfPresent(String.self, forKey: .sipDiversionHeader)
            self.sbcConfiguration = try container.decodeIfPresent(SbcConfiguration.self, forKey: .sbcConfiguration)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.gateways, forKey: .gateways)
            try container.encodeIfPresent(self.outboundAuthenticationPlan, forKey: .outboundAuthenticationPlan)
            try container.encodeIfPresent(self.outboundLeadingPlusEnabled, forKey: .outboundLeadingPlusEnabled)
            try container.encodeIfPresent(self.techPrefix, forKey: .techPrefix)
            try container.encodeIfPresent(self.sipDiversionHeader, forKey: .sipDiversionHeader)
            try container.encodeIfPresent(self.sbcConfiguration, forKey: .sbcConfiguration)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case gateways
            case outboundAuthenticationPlan
            case outboundLeadingPlusEnabled
            case techPrefix
            case sipDiversionHeader
            case sbcConfiguration
            case name
        }
    }

    public struct Cartesia: Codable, Hashable, Sendable {
        public let provider: String = "cartesia"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Cerebras: Codable, Hashable, Sendable {
        public let provider: String = "cerebras"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Cloudflare: Codable, Hashable, Sendable {
        public let provider: String = "cloudflare"
        /// Cloudflare Account Id.
        public let accountId: String?
        /// Cloudflare API Key / Token.
        public let apiKey: String?
        /// Cloudflare Account Email.
        public let accountEmail: String?
        /// This is the order in which this storage provider is tried during upload retries. Lower numbers are tried first in increasing order.
        public let fallbackIndex: Double?
        /// This is the bucket plan that can be provided to store call artifacts in R2
        public let bucketPlan: CloudflareR2BucketPlan?
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            apiKey: String? = nil,
            accountEmail: String? = nil,
            fallbackIndex: Double? = nil,
            bucketPlan: CloudflareR2BucketPlan? = nil,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.apiKey = apiKey
            self.accountEmail = accountEmail
            self.fallbackIndex = fallbackIndex
            self.bucketPlan = bucketPlan
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
            self.accountEmail = try container.decodeIfPresent(String.self, forKey: .accountEmail)
            self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
            self.bucketPlan = try container.decodeIfPresent(CloudflareR2BucketPlan.self, forKey: .bucketPlan)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.accountEmail, forKey: .accountEmail)
            try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
            try container.encodeIfPresent(self.bucketPlan, forKey: .bucketPlan)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case accountId
            case apiKey
            case accountEmail
            case fallbackIndex
            case bucketPlan
            case name
        }
    }

    public struct CustomLlm: Codable, Hashable, Sendable {
        public let provider: String = "custom-llm"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the authentication plan. Currently supports OAuth2 RFC 6749. To use Bearer authentication, use apiKey
        public let authenticationPlan: OAuth2AuthenticationPlan?
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            authenticationPlan: OAuth2AuthenticationPlan? = nil,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.authenticationPlan = authenticationPlan
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.authenticationPlan = try container.decodeIfPresent(OAuth2AuthenticationPlan.self, forKey: .authenticationPlan)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.authenticationPlan, forKey: .authenticationPlan)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case authenticationPlan
            case name
        }
    }

    public struct Deepgram: Codable, Hashable, Sendable {
        public let provider: String = "deepgram"
        /// This is not returned in the API.
        public let apiKey: String
        /// This can be used to point to an onprem Deepgram instance. Defaults to api.deepgram.com.
        public let apiUrl: String?
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            apiUrl: String? = nil,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.apiUrl = apiUrl
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.apiUrl = try container.decodeIfPresent(String.self, forKey: .apiUrl)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.apiUrl, forKey: .apiUrl)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case apiUrl
            case name
        }
    }

    public struct Deepinfra: Codable, Hashable, Sendable {
        public let provider: String = "deepinfra"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct DeepSeek: Codable, Hashable, Sendable {
        public let provider: String = "deep-seek"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Gcp: Codable, Hashable, Sendable {
        public let provider: String = "gcp"
        /// This is the order in which this storage provider is tried during upload retries. Lower numbers are tried first in increasing order.
        public let fallbackIndex: Double?
        /// This is the GCP key. This is the JSON that can be generated in the Google Cloud Console at https://console.cloud.google.com/iam-admin/serviceaccounts/details/<service-account-id>/keys.
        /// 
        /// The schema is identical to the JSON that GCP outputs.
        public let gcpKey: GcpKey
        /// This is the region of the GCP resource.
        public let region: String?
        public let bucketPlan: BucketPlan?
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            fallbackIndex: Double? = nil,
            gcpKey: GcpKey,
            region: String? = nil,
            bucketPlan: BucketPlan? = nil,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.fallbackIndex = fallbackIndex
            self.gcpKey = gcpKey
            self.region = region
            self.bucketPlan = bucketPlan
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
            self.gcpKey = try container.decode(GcpKey.self, forKey: .gcpKey)
            self.region = try container.decodeIfPresent(String.self, forKey: .region)
            self.bucketPlan = try container.decodeIfPresent(BucketPlan.self, forKey: .bucketPlan)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
            try container.encode(self.gcpKey, forKey: .gcpKey)
            try container.encodeIfPresent(self.region, forKey: .region)
            try container.encodeIfPresent(self.bucketPlan, forKey: .bucketPlan)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case fallbackIndex
            case gcpKey
            case region
            case bucketPlan
            case name
        }
    }

    public struct Gladia: Codable, Hashable, Sendable {
        public let provider: String = "gladia"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Gohighlevel: Codable, Hashable, Sendable {
        public let provider: String = "gohighlevel"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Google: Codable, Hashable, Sendable {
        public let provider: String = "google"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Groq: Codable, Hashable, Sendable {
        public let provider: String = "groq"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct InflectionAi: Codable, Hashable, Sendable {
        public let provider: String = "inflection-ai"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Langfuse: Codable, Hashable, Sendable {
        public let provider: String = "langfuse"
        /// The public key for Langfuse project. Eg: pk-lf-...
        public let publicKey: String
        /// The secret key for Langfuse project. Eg: sk-lf-... .This is not returned in the API.
        public let apiKey: String
        /// The host URL for Langfuse project. Eg: https://cloud.langfuse.com
        public let apiUrl: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            publicKey: String,
            apiKey: String,
            apiUrl: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.publicKey = publicKey
            self.apiKey = apiKey
            self.apiUrl = apiUrl
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.publicKey = try container.decode(String.self, forKey: .publicKey)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.apiUrl = try container.decode(String.self, forKey: .apiUrl)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.publicKey, forKey: .publicKey)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encode(self.apiUrl, forKey: .apiUrl)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case publicKey
            case apiKey
            case apiUrl
            case name
        }
    }

    public struct Lmnt: Codable, Hashable, Sendable {
        public let provider: String = "lmnt"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Make: Codable, Hashable, Sendable {
        public let provider: String = "make"
        /// Team ID
        public let teamId: String
        /// Region of your application. For example: eu1, eu2, us1, us2
        public let region: String
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            teamId: String,
            region: String,
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.teamId = teamId
            self.region = region
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.teamId = try container.decode(String.self, forKey: .teamId)
            self.region = try container.decode(String.self, forKey: .region)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.teamId, forKey: .teamId)
            try container.encode(self.region, forKey: .region)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case teamId
            case region
            case apiKey
            case name
        }
    }

    public struct Openai: Codable, Hashable, Sendable {
        public let provider: String = "openai"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Openrouter: Codable, Hashable, Sendable {
        public let provider: String = "openrouter"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct PerplexityAi: Codable, Hashable, Sendable {
        public let provider: String = "perplexity-ai"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Playht: Codable, Hashable, Sendable {
        public let provider: String = "playht"
        /// This is not returned in the API.
        public let apiKey: String
        public let userId: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            userId: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.userId = userId
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.userId = try container.decode(String.self, forKey: .userId)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encode(self.userId, forKey: .userId)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case userId
            case name
        }
    }

    public struct RimeAi: Codable, Hashable, Sendable {
        public let provider: String = "rime-ai"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Runpod: Codable, Hashable, Sendable {
        public let provider: String = "runpod"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct S3: Codable, Hashable, Sendable {
        public let provider: String = "s3"
        /// AWS access key ID.
        public let awsAccessKeyId: String
        /// AWS access key secret. This is not returned in the API.
        public let awsSecretAccessKey: String
        /// AWS region in which the S3 bucket is located.
        public let region: String
        /// AWS S3 bucket name.
        public let s3BucketName: String
        /// The path prefix for the uploaded recording. Ex. "recordings/"
        public let s3PathPrefix: String
        /// This is the order in which this storage provider is tried during upload retries. Lower numbers are tried first in increasing order.
        public let fallbackIndex: Double?
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            awsAccessKeyId: String,
            awsSecretAccessKey: String,
            region: String,
            s3BucketName: String,
            s3PathPrefix: String,
            fallbackIndex: Double? = nil,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.awsAccessKeyId = awsAccessKeyId
            self.awsSecretAccessKey = awsSecretAccessKey
            self.region = region
            self.s3BucketName = s3BucketName
            self.s3PathPrefix = s3PathPrefix
            self.fallbackIndex = fallbackIndex
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.awsAccessKeyId = try container.decode(String.self, forKey: .awsAccessKeyId)
            self.awsSecretAccessKey = try container.decode(String.self, forKey: .awsSecretAccessKey)
            self.region = try container.decode(String.self, forKey: .region)
            self.s3BucketName = try container.decode(String.self, forKey: .s3BucketName)
            self.s3PathPrefix = try container.decode(String.self, forKey: .s3PathPrefix)
            self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.awsAccessKeyId, forKey: .awsAccessKeyId)
            try container.encode(self.awsSecretAccessKey, forKey: .awsSecretAccessKey)
            try container.encode(self.region, forKey: .region)
            try container.encode(self.s3BucketName, forKey: .s3BucketName)
            try container.encode(self.s3PathPrefix, forKey: .s3PathPrefix)
            try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case awsAccessKeyId
            case awsSecretAccessKey
            case region
            case s3BucketName
            case s3PathPrefix
            case fallbackIndex
            case name
        }
    }

    public struct Supabase: Codable, Hashable, Sendable {
        public let provider: String = "supabase"
        /// This is the order in which this storage provider is tried during upload retries. Lower numbers are tried first in increasing order.
        public let fallbackIndex: Double?
        public let bucketPlan: SupabaseBucketPlan?
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            fallbackIndex: Double? = nil,
            bucketPlan: SupabaseBucketPlan? = nil,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.fallbackIndex = fallbackIndex
            self.bucketPlan = bucketPlan
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.fallbackIndex = try container.decodeIfPresent(Double.self, forKey: .fallbackIndex)
            self.bucketPlan = try container.decodeIfPresent(SupabaseBucketPlan.self, forKey: .bucketPlan)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.fallbackIndex, forKey: .fallbackIndex)
            try container.encodeIfPresent(self.bucketPlan, forKey: .bucketPlan)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case fallbackIndex
            case bucketPlan
            case name
        }
    }

    public struct SmallestAi: Codable, Hashable, Sendable {
        public let provider: String = "smallest-ai"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Tavus: Codable, Hashable, Sendable {
        public let provider: String = "tavus"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct TogetherAi: Codable, Hashable, Sendable {
        public let provider: String = "together-ai"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Twilio: Codable, Hashable, Sendable {
        public let provider: String = "twilio"
        /// This is not returned in the API.
        public let authToken: String?
        /// This is not returned in the API.
        public let apiKey: String?
        /// This is not returned in the API.
        public let apiSecret: String?
        public let accountSid: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            authToken: String? = nil,
            apiKey: String? = nil,
            apiSecret: String? = nil,
            accountSid: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.authToken = authToken
            self.apiKey = apiKey
            self.apiSecret = apiSecret
            self.accountSid = accountSid
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.authToken = try container.decodeIfPresent(String.self, forKey: .authToken)
            self.apiKey = try container.decodeIfPresent(String.self, forKey: .apiKey)
            self.apiSecret = try container.decodeIfPresent(String.self, forKey: .apiSecret)
            self.accountSid = try container.decode(String.self, forKey: .accountSid)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.authToken, forKey: .authToken)
            try container.encodeIfPresent(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.apiSecret, forKey: .apiSecret)
            try container.encode(self.accountSid, forKey: .accountSid)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case authToken
            case apiKey
            case apiSecret
            case accountSid
            case name
        }
    }

    public struct Vonage: Codable, Hashable, Sendable {
        public let provider: String = "vonage"
        /// This is not returned in the API.
        public let apiSecret: String
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiSecret: String,
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiSecret = apiSecret
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiSecret = try container.decode(String.self, forKey: .apiSecret)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiSecret, forKey: .apiSecret)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiSecret
            case apiKey
            case name
        }
    }

    public struct Webhook: Codable, Hashable, Sendable {
        public let provider: String = "webhook"
        /// This is the authentication plan. Supports OAuth2 RFC 6749, HMAC signing, and Bearer authentication.
        public let authenticationPlan: CreateWebhookCredentialDtoAuthenticationPlan
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            authenticationPlan: CreateWebhookCredentialDtoAuthenticationPlan,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.authenticationPlan = authenticationPlan
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.authenticationPlan = try container.decode(CreateWebhookCredentialDtoAuthenticationPlan.self, forKey: .authenticationPlan)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.authenticationPlan, forKey: .authenticationPlan)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case authenticationPlan
            case name
        }
    }

    public struct CustomCredential: Codable, Hashable, Sendable {
        public let provider: String = "custom-credential"
        /// This is the authentication plan. Supports OAuth2 RFC 6749, HMAC signing, and Bearer authentication.
        public let authenticationPlan: CreateCustomCredentialDtoAuthenticationPlan
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            authenticationPlan: CreateCustomCredentialDtoAuthenticationPlan,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.authenticationPlan = authenticationPlan
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.authenticationPlan = try container.decode(CreateCustomCredentialDtoAuthenticationPlan.self, forKey: .authenticationPlan)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.authenticationPlan, forKey: .authenticationPlan)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case authenticationPlan
            case name
        }
    }

    public struct Xai: Codable, Hashable, Sendable {
        public let provider: String = "xai"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Neuphonic: Codable, Hashable, Sendable {
        public let provider: String = "neuphonic"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Hume: Codable, Hashable, Sendable {
        public let provider: String = "hume"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Mistral: Codable, Hashable, Sendable {
        public let provider: String = "mistral"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Speechmatics: Codable, Hashable, Sendable {
        public let provider: String = "speechmatics"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Trieve: Codable, Hashable, Sendable {
        public let provider: String = "trieve"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct GoogleCalendarOauth2Client: Codable, Hashable, Sendable {
        public let provider: String = "google.calendar.oauth2-client"
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case name
        }
    }

    public struct GoogleCalendarOauth2Authorization: Codable, Hashable, Sendable {
        public let provider: String = "google.calendar.oauth2-authorization"
        /// The authorization ID for the OAuth2 authorization
        public let authorizationId: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            authorizationId: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.authorizationId = authorizationId
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.authorizationId = try container.decode(String.self, forKey: .authorizationId)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.authorizationId, forKey: .authorizationId)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case authorizationId
            case name
        }
    }

    public struct GoogleSheetsOauth2Authorization: Codable, Hashable, Sendable {
        public let provider: String = "google.sheets.oauth2-authorization"
        /// The authorization ID for the OAuth2 authorization
        public let authorizationId: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            authorizationId: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.authorizationId = authorizationId
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.authorizationId = try container.decode(String.self, forKey: .authorizationId)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.authorizationId, forKey: .authorizationId)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case authorizationId
            case name
        }
    }

    public struct SlackOauth2Authorization: Codable, Hashable, Sendable {
        public let provider: String = "slack.oauth2-authorization"
        /// The authorization ID for the OAuth2 authorization
        public let authorizationId: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            authorizationId: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.authorizationId = authorizationId
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.authorizationId = try container.decode(String.self, forKey: .authorizationId)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.authorizationId, forKey: .authorizationId)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case authorizationId
            case name
        }
    }

    public struct GhlOauth2Authorization: Codable, Hashable, Sendable {
        public let provider: String = "ghl.oauth2-authorization"
        /// This is the authentication session for the credential.
        public let authenticationSession: Oauth2AuthenticationSession
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            authenticationSession: Oauth2AuthenticationSession,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.authenticationSession = authenticationSession
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.authenticationSession = try container.decode(Oauth2AuthenticationSession.self, forKey: .authenticationSession)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.authenticationSession, forKey: .authenticationSession)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case authenticationSession
            case name
        }
    }

    public struct Inworld: Codable, Hashable, Sendable {
        public let provider: String = "inworld"
        /// This is the Inworld Basic (Base64) authentication token. This is not returned in the API.
        public let apiKey: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case name
        }
    }

    public struct Minimax: Codable, Hashable, Sendable {
        public let provider: String = "minimax"
        /// This is not returned in the API.
        public let apiKey: String
        /// This is the Minimax Group ID.
        public let groupId: String
        /// This is the name of credential. This is just for your reference.
        public let name: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiKey: String,
            groupId: String,
            name: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiKey = apiKey
            self.groupId = groupId
            self.name = name
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiKey = try container.decode(String.self, forKey: .apiKey)
            self.groupId = try container.decode(String.self, forKey: .groupId)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.provider, forKey: .provider)
            try container.encode(self.apiKey, forKey: .apiKey)
            try container.encode(self.groupId, forKey: .groupId)
            try container.encodeIfPresent(self.name, forKey: .name)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case provider
            case apiKey
            case groupId
            case name
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}