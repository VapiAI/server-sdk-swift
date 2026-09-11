import Foundation

/// Language for Vapi voice synthesis. For Version 2, omit this field or set `auto` for automatic language detection. Version 1 supports legacy Vapi language values.
public enum FallbackVapiVoiceLanguage: String, Codable, Hashable, CaseIterable, Sendable {
    case enUs = "en-US"
    case enGb = "en-GB"
    case enAu = "en-AU"
    case enCa = "en-CA"
    case ja
    case zh
    case de
    case hi
    case frFr = "fr-FR"
    case frCa = "fr-CA"
    case ko
    case ptBr = "pt-BR"
    case ptPt = "pt-PT"
    case it
    case esEs = "es-ES"
    case esMx = "es-MX"
    case id
    case nl
    case tr
    case fil
    case pl
    case sv
    case bg
    case ro
    case arSa = "ar-SA"
    case arAe = "ar-AE"
    case cs
    case el
    case fi
    case hr
    case ms
    case sk
    case da
    case ta
    case uk
    case ru
    case hu
    case no
    case vi
    case auto
    case en
    case ar
    case arEg = "ar-EG"
    case bn
    case es
    case fr
    case gu
    case he
    case ka
    case kn
    case ml
    case mr
    case pa
    case pt
    case te
    case th
    case tl
}