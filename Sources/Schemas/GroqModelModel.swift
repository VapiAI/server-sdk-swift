import Foundation

/// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
public enum GroqModelModel: String, Codable, Hashable, CaseIterable, Sendable {
    case openaiGptOss20B = "openai/gpt-oss-20b"
    case openaiGptOss120B = "openai/gpt-oss-120b"
    case deepseekR1DistillLlama70B = "deepseek-r1-distill-llama-70b"
    case llama3370BVersatile = "llama-3.3-70b-versatile"
    case llama31405BReasoning = "llama-3.1-405b-reasoning"
    case llama318BInstant = "llama-3.1-8b-instant"
    case llama38B8192 = "llama3-8b-8192"
    case llama370B8192 = "llama3-70b-8192"
    case gemma29BIt = "gemma2-9b-it"
    case moonshotaiKimiK2Instruct0905 = "moonshotai/kimi-k2-instruct-0905"
    case metaLlamaLlama4Maverick17B128EInstruct = "meta-llama/llama-4-maverick-17b-128e-instruct"
    case metaLlamaLlama4Scout17B16EInstruct = "meta-llama/llama-4-scout-17b-16e-instruct"
    case mistralSaba24B = "mistral-saba-24b"
    case compoundBeta = "compound-beta"
    case compoundBetaMini = "compound-beta-mini"
}