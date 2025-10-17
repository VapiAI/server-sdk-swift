import Foundation

/// Azure OpenAI doesn't support `maxLength` right now https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/structured-outputs?tabs=python-secure%2Cdotnet-entra-id&pivots=programming-language-csharp#unsupported-type-specific-keywords. Need to strip.
/// 
/// - `strip-parameters-with-unsupported-validation` will strip parameters with unsupported validation.
/// - `strip-unsupported-validation` will keep the parameters but strip unsupported validation.
/// 
/// @default `strip-unsupported-validation`
public enum OpenAiModelToolStrictCompatibilityMode: String, Codable, Hashable, CaseIterable, Sendable {
    case stripParametersWithUnsupportedValidation = "strip-parameters-with-unsupported-validation"
    case stripUnsupportedValidation = "strip-unsupported-validation"
}