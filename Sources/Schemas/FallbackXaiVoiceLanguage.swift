import Foundation

/// BCP-47 language code for xAI TTS synthesis.
public enum FallbackXaiVoiceLanguage: String, Codable, Hashable, CaseIterable, Sendable {
    case auto
    case en
    case arEg = "ar-EG"
    case arSa = "ar-SA"
    case arAe = "ar-AE"
    case bn
    case zh
    case fr
    case de
    case hi
    case id
    case it
    case ja
    case ko
    case ptBr = "pt-BR"
    case ptPt = "pt-PT"
    case ru
    case esMx = "es-MX"
    case esEs = "es-ES"
    case tr
    case vi
}