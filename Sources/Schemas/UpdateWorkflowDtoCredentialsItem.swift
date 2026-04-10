import Foundation

public enum UpdateWorkflowDtoCredentialsItem: Codable, Hashable, Sendable {
    case anthropic(CreateAnthropicCredentialDto)
    case anthropicBedrock(CreateAnthropicBedrockCredentialDto)
    case anyscale(CreateAnyscaleCredentialDto)
    case assemblyAi(CreateAssemblyAiCredentialDto)
    case azure(CreateAzureCredentialDto)
    case azureOpenai(CreateAzureOpenAiCredentialDto)
    case byoSipTrunk(CreateByoSipTrunkCredentialDto)
    case cartesia(CreateCartesiaCredentialDto)
    case cerebras(CreateCerebrasCredentialDto)
    case cloudflare(CreateCloudflareCredentialDto)
    case customCredential(CreateCustomCredentialDto)
    case customLlm(CreateCustomLlmCredentialDto)
    case deepgram(CreateDeepgramCredentialDto)
    case deepinfra(CreateDeepInfraCredentialDto)
    case deepSeek(CreateDeepSeekCredentialDto)
    case elevenLabs(CreateElevenLabsCredentialDto)
    case email(CreateEmailCredentialDto)
    case gcp(CreateGcpCredentialDto)
    case ghlOauth2Authorization(CreateGoHighLevelMcpCredentialDto)
    case gladia(CreateGladiaCredentialDto)
    case gohighlevel(CreateGoHighLevelCredentialDto)
    case google(CreateGoogleCredentialDto)
    case googleCalendarOauth2Authorization(CreateGoogleCalendarOAuth2AuthorizationCredentialDto)
    case googleCalendarOauth2Client(CreateGoogleCalendarOAuth2ClientCredentialDto)
    case googleSheetsOauth2Authorization(CreateGoogleSheetsOAuth2AuthorizationCredentialDto)
    case groq(CreateGroqCredentialDto)
    case hume(CreateHumeCredentialDto)
    case inflectionAi(CreateInflectionAiCredentialDto)
    case inworld(CreateInworldCredentialDto)
    case langfuse(CreateLangfuseCredentialDto)
    case lmnt(CreateLmntCredentialDto)
    case make(CreateMakeCredentialDto)
    case minimax(CreateMinimaxCredentialDto)
    case mistral(CreateMistralCredentialDto)
    case neuphonic(CreateNeuphonicCredentialDto)
    case openai(CreateOpenAiCredentialDto)
    case openrouter(CreateOpenRouterCredentialDto)
    case perplexityAi(CreatePerplexityAiCredentialDto)
    case playht(CreatePlayHtCredentialDto)
    case rimeAi(CreateRimeAiCredentialDto)
    case runpod(CreateRunpodCredentialDto)
    case s3(CreateS3CredentialDto)
    case slackOauth2Authorization(CreateSlackOAuth2AuthorizationCredentialDto)
    case slackWebhook(CreateSlackWebhookCredentialDto)
    case smallestAi(CreateSmallestAiCredentialDto)
    case soniox(CreateSonioxCredentialDto)
    case speechmatics(CreateSpeechmaticsCredentialDto)
    case supabase(CreateSupabaseCredentialDto)
    case tavus(CreateTavusCredentialDto)
    case togetherAi(CreateTogetherAiCredentialDto)
    case trieve(CreateTrieveCredentialDto)
    case twilio(CreateTwilioCredentialDto)
    case vonage(CreateVonageCredentialDto)
    case webhook(CreateWebhookCredentialDto)
    case wellsaid(CreateWellSaidCredentialDto)
    case xai(CreateXAiCredentialDto)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .provider)
        switch discriminant {
        case "anthropic":
            self = .anthropic(try CreateAnthropicCredentialDto(from: decoder))
        case "anthropic-bedrock":
            self = .anthropicBedrock(try CreateAnthropicBedrockCredentialDto(from: decoder))
        case "anyscale":
            self = .anyscale(try CreateAnyscaleCredentialDto(from: decoder))
        case "assembly-ai":
            self = .assemblyAi(try CreateAssemblyAiCredentialDto(from: decoder))
        case "azure":
            self = .azure(try CreateAzureCredentialDto(from: decoder))
        case "azure-openai":
            self = .azureOpenai(try CreateAzureOpenAiCredentialDto(from: decoder))
        case "byo-sip-trunk":
            self = .byoSipTrunk(try CreateByoSipTrunkCredentialDto(from: decoder))
        case "cartesia":
            self = .cartesia(try CreateCartesiaCredentialDto(from: decoder))
        case "cerebras":
            self = .cerebras(try CreateCerebrasCredentialDto(from: decoder))
        case "cloudflare":
            self = .cloudflare(try CreateCloudflareCredentialDto(from: decoder))
        case "custom-credential":
            self = .customCredential(try CreateCustomCredentialDto(from: decoder))
        case "custom-llm":
            self = .customLlm(try CreateCustomLlmCredentialDto(from: decoder))
        case "deepgram":
            self = .deepgram(try CreateDeepgramCredentialDto(from: decoder))
        case "deepinfra":
            self = .deepinfra(try CreateDeepInfraCredentialDto(from: decoder))
        case "deep-seek":
            self = .deepSeek(try CreateDeepSeekCredentialDto(from: decoder))
        case "11labs":
            self = .elevenLabs(try CreateElevenLabsCredentialDto(from: decoder))
        case "email":
            self = .email(try CreateEmailCredentialDto(from: decoder))
        case "gcp":
            self = .gcp(try CreateGcpCredentialDto(from: decoder))
        case "ghl.oauth2-authorization":
            self = .ghlOauth2Authorization(try CreateGoHighLevelMcpCredentialDto(from: decoder))
        case "gladia":
            self = .gladia(try CreateGladiaCredentialDto(from: decoder))
        case "gohighlevel":
            self = .gohighlevel(try CreateGoHighLevelCredentialDto(from: decoder))
        case "google":
            self = .google(try CreateGoogleCredentialDto(from: decoder))
        case "google.calendar.oauth2-authorization":
            self = .googleCalendarOauth2Authorization(try CreateGoogleCalendarOAuth2AuthorizationCredentialDto(from: decoder))
        case "google.calendar.oauth2-client":
            self = .googleCalendarOauth2Client(try CreateGoogleCalendarOAuth2ClientCredentialDto(from: decoder))
        case "google.sheets.oauth2-authorization":
            self = .googleSheetsOauth2Authorization(try CreateGoogleSheetsOAuth2AuthorizationCredentialDto(from: decoder))
        case "groq":
            self = .groq(try CreateGroqCredentialDto(from: decoder))
        case "hume":
            self = .hume(try CreateHumeCredentialDto(from: decoder))
        case "inflection-ai":
            self = .inflectionAi(try CreateInflectionAiCredentialDto(from: decoder))
        case "inworld":
            self = .inworld(try CreateInworldCredentialDto(from: decoder))
        case "langfuse":
            self = .langfuse(try CreateLangfuseCredentialDto(from: decoder))
        case "lmnt":
            self = .lmnt(try CreateLmntCredentialDto(from: decoder))
        case "make":
            self = .make(try CreateMakeCredentialDto(from: decoder))
        case "minimax":
            self = .minimax(try CreateMinimaxCredentialDto(from: decoder))
        case "mistral":
            self = .mistral(try CreateMistralCredentialDto(from: decoder))
        case "neuphonic":
            self = .neuphonic(try CreateNeuphonicCredentialDto(from: decoder))
        case "openai":
            self = .openai(try CreateOpenAiCredentialDto(from: decoder))
        case "openrouter":
            self = .openrouter(try CreateOpenRouterCredentialDto(from: decoder))
        case "perplexity-ai":
            self = .perplexityAi(try CreatePerplexityAiCredentialDto(from: decoder))
        case "playht":
            self = .playht(try CreatePlayHtCredentialDto(from: decoder))
        case "rime-ai":
            self = .rimeAi(try CreateRimeAiCredentialDto(from: decoder))
        case "runpod":
            self = .runpod(try CreateRunpodCredentialDto(from: decoder))
        case "s3":
            self = .s3(try CreateS3CredentialDto(from: decoder))
        case "slack.oauth2-authorization":
            self = .slackOauth2Authorization(try CreateSlackOAuth2AuthorizationCredentialDto(from: decoder))
        case "slack-webhook":
            self = .slackWebhook(try CreateSlackWebhookCredentialDto(from: decoder))
        case "smallest-ai":
            self = .smallestAi(try CreateSmallestAiCredentialDto(from: decoder))
        case "soniox":
            self = .soniox(try CreateSonioxCredentialDto(from: decoder))
        case "speechmatics":
            self = .speechmatics(try CreateSpeechmaticsCredentialDto(from: decoder))
        case "supabase":
            self = .supabase(try CreateSupabaseCredentialDto(from: decoder))
        case "tavus":
            self = .tavus(try CreateTavusCredentialDto(from: decoder))
        case "together-ai":
            self = .togetherAi(try CreateTogetherAiCredentialDto(from: decoder))
        case "trieve":
            self = .trieve(try CreateTrieveCredentialDto(from: decoder))
        case "twilio":
            self = .twilio(try CreateTwilioCredentialDto(from: decoder))
        case "vonage":
            self = .vonage(try CreateVonageCredentialDto(from: decoder))
        case "webhook":
            self = .webhook(try CreateWebhookCredentialDto(from: decoder))
        case "wellsaid":
            self = .wellsaid(try CreateWellSaidCredentialDto(from: decoder))
        case "xai":
            self = .xai(try CreateXAiCredentialDto(from: decoder))
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
        case .anthropic(let data):
            try container.encode("anthropic", forKey: .provider)
            try data.encode(to: encoder)
        case .anthropicBedrock(let data):
            try container.encode("anthropic-bedrock", forKey: .provider)
            try data.encode(to: encoder)
        case .anyscale(let data):
            try container.encode("anyscale", forKey: .provider)
            try data.encode(to: encoder)
        case .assemblyAi(let data):
            try container.encode("assembly-ai", forKey: .provider)
            try data.encode(to: encoder)
        case .azure(let data):
            try container.encode("azure", forKey: .provider)
            try data.encode(to: encoder)
        case .azureOpenai(let data):
            try container.encode("azure-openai", forKey: .provider)
            try data.encode(to: encoder)
        case .byoSipTrunk(let data):
            try container.encode("byo-sip-trunk", forKey: .provider)
            try data.encode(to: encoder)
        case .cartesia(let data):
            try container.encode("cartesia", forKey: .provider)
            try data.encode(to: encoder)
        case .cerebras(let data):
            try container.encode("cerebras", forKey: .provider)
            try data.encode(to: encoder)
        case .cloudflare(let data):
            try container.encode("cloudflare", forKey: .provider)
            try data.encode(to: encoder)
        case .customCredential(let data):
            try container.encode("custom-credential", forKey: .provider)
            try data.encode(to: encoder)
        case .customLlm(let data):
            try container.encode("custom-llm", forKey: .provider)
            try data.encode(to: encoder)
        case .deepgram(let data):
            try container.encode("deepgram", forKey: .provider)
            try data.encode(to: encoder)
        case .deepinfra(let data):
            try container.encode("deepinfra", forKey: .provider)
            try data.encode(to: encoder)
        case .deepSeek(let data):
            try container.encode("deep-seek", forKey: .provider)
            try data.encode(to: encoder)
        case .elevenLabs(let data):
            try container.encode("11labs", forKey: .provider)
            try data.encode(to: encoder)
        case .email(let data):
            try container.encode("email", forKey: .provider)
            try data.encode(to: encoder)
        case .gcp(let data):
            try container.encode("gcp", forKey: .provider)
            try data.encode(to: encoder)
        case .ghlOauth2Authorization(let data):
            try container.encode("ghl.oauth2-authorization", forKey: .provider)
            try data.encode(to: encoder)
        case .gladia(let data):
            try container.encode("gladia", forKey: .provider)
            try data.encode(to: encoder)
        case .gohighlevel(let data):
            try container.encode("gohighlevel", forKey: .provider)
            try data.encode(to: encoder)
        case .google(let data):
            try container.encode("google", forKey: .provider)
            try data.encode(to: encoder)
        case .googleCalendarOauth2Authorization(let data):
            try container.encode("google.calendar.oauth2-authorization", forKey: .provider)
            try data.encode(to: encoder)
        case .googleCalendarOauth2Client(let data):
            try container.encode("google.calendar.oauth2-client", forKey: .provider)
            try data.encode(to: encoder)
        case .googleSheetsOauth2Authorization(let data):
            try container.encode("google.sheets.oauth2-authorization", forKey: .provider)
            try data.encode(to: encoder)
        case .groq(let data):
            try container.encode("groq", forKey: .provider)
            try data.encode(to: encoder)
        case .hume(let data):
            try container.encode("hume", forKey: .provider)
            try data.encode(to: encoder)
        case .inflectionAi(let data):
            try container.encode("inflection-ai", forKey: .provider)
            try data.encode(to: encoder)
        case .inworld(let data):
            try container.encode("inworld", forKey: .provider)
            try data.encode(to: encoder)
        case .langfuse(let data):
            try container.encode("langfuse", forKey: .provider)
            try data.encode(to: encoder)
        case .lmnt(let data):
            try container.encode("lmnt", forKey: .provider)
            try data.encode(to: encoder)
        case .make(let data):
            try container.encode("make", forKey: .provider)
            try data.encode(to: encoder)
        case .minimax(let data):
            try container.encode("minimax", forKey: .provider)
            try data.encode(to: encoder)
        case .mistral(let data):
            try container.encode("mistral", forKey: .provider)
            try data.encode(to: encoder)
        case .neuphonic(let data):
            try container.encode("neuphonic", forKey: .provider)
            try data.encode(to: encoder)
        case .openai(let data):
            try container.encode("openai", forKey: .provider)
            try data.encode(to: encoder)
        case .openrouter(let data):
            try container.encode("openrouter", forKey: .provider)
            try data.encode(to: encoder)
        case .perplexityAi(let data):
            try container.encode("perplexity-ai", forKey: .provider)
            try data.encode(to: encoder)
        case .playht(let data):
            try container.encode("playht", forKey: .provider)
            try data.encode(to: encoder)
        case .rimeAi(let data):
            try container.encode("rime-ai", forKey: .provider)
            try data.encode(to: encoder)
        case .runpod(let data):
            try container.encode("runpod", forKey: .provider)
            try data.encode(to: encoder)
        case .s3(let data):
            try container.encode("s3", forKey: .provider)
            try data.encode(to: encoder)
        case .slackOauth2Authorization(let data):
            try container.encode("slack.oauth2-authorization", forKey: .provider)
            try data.encode(to: encoder)
        case .slackWebhook(let data):
            try container.encode("slack-webhook", forKey: .provider)
            try data.encode(to: encoder)
        case .smallestAi(let data):
            try container.encode("smallest-ai", forKey: .provider)
            try data.encode(to: encoder)
        case .soniox(let data):
            try container.encode("soniox", forKey: .provider)
            try data.encode(to: encoder)
        case .speechmatics(let data):
            try container.encode("speechmatics", forKey: .provider)
            try data.encode(to: encoder)
        case .supabase(let data):
            try container.encode("supabase", forKey: .provider)
            try data.encode(to: encoder)
        case .tavus(let data):
            try container.encode("tavus", forKey: .provider)
            try data.encode(to: encoder)
        case .togetherAi(let data):
            try container.encode("together-ai", forKey: .provider)
            try data.encode(to: encoder)
        case .trieve(let data):
            try container.encode("trieve", forKey: .provider)
            try data.encode(to: encoder)
        case .twilio(let data):
            try container.encode("twilio", forKey: .provider)
            try data.encode(to: encoder)
        case .vonage(let data):
            try container.encode("vonage", forKey: .provider)
            try data.encode(to: encoder)
        case .webhook(let data):
            try container.encode("webhook", forKey: .provider)
            try data.encode(to: encoder)
        case .wellsaid(let data):
            try container.encode("wellsaid", forKey: .provider)
            try data.encode(to: encoder)
        case .xai(let data):
            try container.encode("xai", forKey: .provider)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}