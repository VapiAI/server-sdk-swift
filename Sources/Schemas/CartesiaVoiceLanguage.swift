import Foundation

/// This is the language the voice speaks. When omitted, Vapi uses the voice's native language if it has one on record for that voice; otherwise no language is sent to Cartesia. Regional codes such as `es-MX` require the `sonic-3.6` model.
public enum CartesiaVoiceLanguage: String, Codable, Hashable, CaseIterable, Sendable {
    case ar
    case bg
    case bn
    case cs
    case da
    case de
    case el
    case en
    case es
    case fi
    case fr
    case gu
    case he
    case hi
    case hr
    case hu
    case id
    case it
    case ja
    case ka
    case kn
    case ko
    case ml
    case mr
    case ms
    case nl
    case no
    case or
    case pa
    case pl
    case pt
    case ro
    case ru
    case sk
    case sv
    case ta
    case te
    case th
    case tl
    case tr
    case uk
    case ur
    case vi
    case zh
    case bgBg = "bg-BG"
    case bnIn = "bn-IN"
    case csCz = "cs-CZ"
    case daDk = "da-DK"
    case deDe = "de-DE"
    case elGr = "el-GR"
    case enAu = "en-AU"
    case enCa = "en-CA"
    case enGb = "en-GB"
    case enIe = "en-IE"
    case enIn = "en-IN"
    case enNz = "en-NZ"
    case enSg = "en-SG"
    case enUs = "en-US"
    case enZa = "en-ZA"
    case esEs = "es-ES"
    case esMx = "es-MX"
    case esUs = "es-US"
    case fiFi = "fi-FI"
    case frCa = "fr-CA"
    case frFr = "fr-FR"
    case guIn = "gu-IN"
    case heIl = "he-IL"
    case hiIn = "hi-IN"
    case hrHr = "hr-HR"
    case huHu = "hu-HU"
    case idId = "id-ID"
    case itIt = "it-IT"
    case jaJp = "ja-JP"
    case kaGe = "ka-GE"
    case knIn = "kn-IN"
    case koKr = "ko-KR"
    case mlIn = "ml-IN"
    case mrIn = "mr-IN"
    case msMy = "ms-MY"
    case nlBe = "nl-BE"
    case nlNl = "nl-NL"
    case noNo = "no-NO"
    case orIn = "or-IN"
    case paIn = "pa-IN"
    case plPl = "pl-PL"
    case ptBr = "pt-BR"
    case ptPt = "pt-PT"
    case roRo = "ro-RO"
    case ruRu = "ru-RU"
    case skSk = "sk-SK"
    case svSe = "sv-SE"
    case taIn = "ta-IN"
    case teIn = "te-IN"
    case thTh = "th-TH"
    case tlPh = "tl-PH"
    case trTr = "tr-TR"
    case ukUa = "uk-UA"
    case urIn = "ur-IN"
    case viVn = "vi-VN"
    case zhCn = "zh-CN"
}