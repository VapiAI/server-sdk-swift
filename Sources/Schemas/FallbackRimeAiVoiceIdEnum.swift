import Foundation

/// Popular Rime AI voices across mist, mistv2, and arcana models. Any valid Rime AI voice ID is accepted, not just these suggestions.
public enum FallbackRimeAiVoiceIdEnum: String, Codable, Hashable, CaseIterable, Sendable {
    case cove
    case moon
    case wildflower
    case eva
    case amber
    case maya
    case lagoon
    case breeze
    case helen
    case joy
    case marsh
    case creek
    case cedar
    case alpine
    case summit
    case nicholas
    case tyler
    case colin
    case hank
    case thunder
    case astra
    case eucalyptus
    case moraine
    case peak
    case tundra
    case mesaExtra = "mesa_extra"
    case talon
    case marlu
    case glacier
    case falcon
    case luna
    case celeste
    case estelle
    case andromeda
    case esther
    case lyra
    case lintel
    case oculus
    case vespera
    case transom
    case bond
    case arcade
    case atrium
    case cupola
    case fern
    case sirius
    case orion
    case masonry
    case albion
    case parapet
}