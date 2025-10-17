import Foundation

/// Available voices by language:
/// • en: Alex, Ashley, Craig, Deborah, Dennis, Edward, Elizabeth, Hades, Julia, Pixie, Mark, Olivia, Priya, Ronald, Sarah, Shaun, Theodore, Timothy, Wendy, Dominus
/// • zh: Yichen, Xiaoyin, Xinyi, Jing
/// • nl: Erik, Katrien, Lennart, Lore
/// • fr: Alain, Hélène, Mathieu, Étienne
/// • de: Johanna, Josef
/// • it: Gianni, Orietta
/// • ja: Asuka, Satoshi
/// • ko: Hyunwoo, Minji, Seojun, Yoona
/// • pl: Szymon, Wojciech
/// • pt: Heitor, Maitê
/// • es: Diego, Lupita, Miguel, Rafael
public enum FallbackInworldVoiceVoiceId: String, Codable, Hashable, CaseIterable, Sendable {
    case alex = "Alex"
    case ashley = "Ashley"
    case craig = "Craig"
    case deborah = "Deborah"
    case dennis = "Dennis"
    case edward = "Edward"
    case elizabeth = "Elizabeth"
    case hades = "Hades"
    case julia = "Julia"
    case pixie = "Pixie"
    case mark = "Mark"
    case olivia = "Olivia"
    case priya = "Priya"
    case ronald = "Ronald"
    case sarah = "Sarah"
    case shaun = "Shaun"
    case theodore = "Theodore"
    case timothy = "Timothy"
    case wendy = "Wendy"
    case dominus = "Dominus"
    case yichen = "Yichen"
    case xiaoyin = "Xiaoyin"
    case xinyi = "Xinyi"
    case jing = "Jing"
    case erik = "Erik"
    case katrien = "Katrien"
    case lennart = "Lennart"
    case lore = "Lore"
    case alain = "Alain"
    case helene = "Hélène"
    case mathieu = "Mathieu"
    case etienne = "Étienne"
    case johanna = "Johanna"
    case josef = "Josef"
    case gianni = "Gianni"
    case orietta = "Orietta"
    case asuka = "Asuka"
    case satoshi = "Satoshi"
    case hyunwoo = "Hyunwoo"
    case minji = "Minji"
    case seojun = "Seojun"
    case yoona = "Yoona"
    case szymon = "Szymon"
    case wojciech = "Wojciech"
    case heitor = "Heitor"
    case maite = "Maitê"
    case diego = "Diego"
    case lupita = "Lupita"
    case miguel = "Miguel"
    case rafael = "Rafael"
}