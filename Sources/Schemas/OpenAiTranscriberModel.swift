import Foundation

/// This is the model that will be used for the transcription.
/// Digit formatting can differ by model: `gpt-transcribe` may write spoken digit strings as words (for example, "four seven two"), where `gpt-4o-transcribe` and `gpt-4o-mini-transcribe` may write them as digits ("472"). Do not rely on either format.
public enum OpenAiTranscriberModel: String, Codable, Hashable, CaseIterable, Sendable {
    case gpt4OTranscribe = "gpt-4o-transcribe"
    case gpt4OMiniTranscribe = "gpt-4o-mini-transcribe"
    case gptTranscribe = "gpt-transcribe"
}