import Foundation

/// Vapi Agents manages the assistant. The lock refuses writes to the assistant itself (update, replace, delete, restore, version delete, traffic splits) and to outcomes, monitors and structured outputs that link or unlink it. It doesn't cover what changes a call without writing the assistant: call-level assistantOverrides or assistantVersion, squad member pins and overrides, which phone number points at it, edits to the tools or knowledge bases it references, or Vapi's own model-retirement sweep.
public enum AssistantManagedConflictResponseDtoError: String, Codable, Hashable, CaseIterable, Sendable {
    case assistantManagedByVapiAgents = "assistant_managed_by_vapi_agents"
}