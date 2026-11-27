import Foundation

/// This is the reasoning effort for structured output extraction. It applies to the primary extraction attempt only; the GPT-4.1 and Gemini fallbacks run without it. Other features that use this model type ignore it.
/// 
/// Only reasoning models accept it, and each accepts only the efforts OpenAI supports for it (for example `none` and `xhigh` on gpt-5.6, `minimal` on gpt-5). When unset, OpenAI's default effort for the model applies, except on GPT-6 models, which Vapi sends with `none`.
/// 
/// Reasoning tokens are billed as output tokens.
public enum WorkflowOpenAiModelReasoningEffort: String, Codable, Hashable, CaseIterable, Sendable {
    case minimal
    case none
    case low
    case medium
    case high
    case xhigh
}