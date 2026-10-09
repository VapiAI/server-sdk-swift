import Foundation

/// This is the type of the tool.
public enum ToolDraftType: String, Codable, Hashable, CaseIterable, Sendable {
    case dtmf
    case endCall
    case knowledgeBase
    case transferCall
    case transferCancel
    case transferSuccessful
    case handoff
    case output
    case voicemail
    case query
    case sms
    case sipRequest
    case function
    case mcp
    case apiRequest
    case code
    case bash
    case computer
    case textEditor
    case googleCalendarEventCreate = "google.calendar.event.create"
    case googleCalendarAvailabilityCheck = "google.calendar.availability.check"
    case googleSheetsRowAppend = "google.sheets.row.append"
    case slackMessageSend = "slack.message.send"
    case gohighlevelCalendarEventCreate = "gohighlevel.calendar.event.create"
    case gohighlevelCalendarAvailabilityCheck = "gohighlevel.calendar.availability.check"
    case gohighlevelContactCreate = "gohighlevel.contact.create"
    case gohighlevelContactGet = "gohighlevel.contact.get"
    case make
    case ghl
}