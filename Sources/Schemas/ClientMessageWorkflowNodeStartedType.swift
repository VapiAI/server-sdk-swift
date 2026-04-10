import Foundation

/// This is the type of the message. "workflow.node.started" is sent when the active node changes.
public enum ClientMessageWorkflowNodeStartedType: String, Codable, Hashable, CaseIterable, Sendable {
    case workflowNodeStarted = "workflow.node.started"
}