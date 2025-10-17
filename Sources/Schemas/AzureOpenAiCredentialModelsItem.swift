import Foundation

public enum AzureOpenAiCredentialModelsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case gpt5 = "gpt-5"
    case gpt5Mini = "gpt-5-mini"
    case gpt5Nano = "gpt-5-nano"
    case gpt4120250414 = "gpt-4.1-2025-04-14"
    case gpt41Mini20250414 = "gpt-4.1-mini-2025-04-14"
    case gpt41Nano20250414 = "gpt-4.1-nano-2025-04-14"
    case gpt4O20241120 = "gpt-4o-2024-11-20"
    case gpt4O20240806 = "gpt-4o-2024-08-06"
    case gpt4O20240513 = "gpt-4o-2024-05-13"
    case gpt4OMini20240718 = "gpt-4o-mini-2024-07-18"
    case gpt4Turbo20240409 = "gpt-4-turbo-2024-04-09"
    case gpt40125Preview = "gpt-4-0125-preview"
    case gpt41106Preview = "gpt-4-1106-preview"
    case gpt40613 = "gpt-4-0613"
    case gpt35Turbo0125 = "gpt-35-turbo-0125"
    case gpt35Turbo1106 = "gpt-35-turbo-1106"
}