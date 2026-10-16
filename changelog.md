## [2.0.0] - 2026-10-16
### Breaking Changes

- **`Requests.CreateCampaignDto`** and **`Requests.UpdateCampaignDto`** have been removed. Remove any references to these request types and construct campaign payloads using the updated API.
- **`ByoSipTrunkCredential.sbcConfiguration`** property has been removed. Remove any access to `sbcConfiguration` on `ByoSipTrunkCredential` instances.
- **`TrieveKnowledgeBase`**, **`TrieveKnowledgeBaseChunkPlan`**, **`TrieveKnowledgeBaseSearchPlan`**, **`CreateTrieveKnowledgeBaseDto`**, and related Trieve types have been removed. Update any code referencing these types.
- **`FallbackVapiVoiceVoiceId`** and **`GhlToolType`** enums have been removed. Update any switch statements or references to these types.
- **`GroqModelModel.metaLlamaLlama4Maverick17B128EInstruct`** and **`EvalGroqModelModel.metaLlamaLlama4Maverick17B128EInstruct`** enum cases have been removed. Remove or replace any pattern matches on these cases.
- **`UpdateScenarioDto`**, **`UpdateSimulationDto`**, **`UpdateSimulationSuiteDto`**, **`UpdateTrieveKnowledgeBaseDto`**, **`VapiModelProvider`**, and **`VapiVoiceVoiceId`** have been removed. Remove any references to these types from your code.
- **`CreateCallDto.transport`** type changed from `[String: JSONValue]?` to `CreateCallDtoTransport?`. Update any code constructing or reading this field to use the new typed `CreateCallDtoTransport` value.
- **`TrieveKnowledgeBaseImport`** has been removed and replaced by the new **`CallArtifactUploadItem`** struct. Update any references to this type accordingly.
- **`Call.subscriptionLimits`** (`SubscriptionLimits?`) has been removed from `Call`. Remove any access to this property.
- **`Call.phoneNumber`** type changed from `ImportTwilioPhoneNumberDto?` to `TransientTwilioPhoneNumber?`. Update any code that reads or constructs this field.
- **`Call.transport`** type changed from `[String: JSONValue]?` to `CallTransport?`. Update any code that reads or constructs this field.
- **`DeepgramTranscriber.eagerEotThreshold`** has been removed. Remove any references to this property from your code.
- **`ElevenLabsPronunciationDictionaryLocator.versionId`** changed from a required `String` to an optional `String?`. Omit it to use the dictionary's latest version, or unwrap it where a non-nil value is required.
- **`TrieveCredential`** has been renamed to **`MicrosoftCredential`** and **`TrieveCredentialProvider`** has been renamed to **`MicrosoftCredentialProvider`**. Update all references to these types accordingly.
- **`InviteUserDtoRole`** has changed from a `String`-backed enum with `admin`, `editor`, and `viewer` cases to a tagged union with `.inviteUserDtoRoleZero(InviteUserDtoRoleZero)` and `.string(String)` cases. Update all switch statements and construction sites to use the new case names.
- **`Subscription.slackSupportEnabled`** and **`Subscription.slackChannelId`** have been removed. Remove any references to these properties in your code.
- **`ToolCallResult.message`** type changed from `ToolCallResultMessage` to `ToolCallResultSpokenMessage`. Update type annotations and any pattern matches that reference `ToolCallResultMessage`.
- **`CreateAssistantDtoCredentialsItem.trieve`** and **`CreateWorkflowDtoCredentialsItem.trieve`** enum cases have been removed. Any exhaustive `switch` statement matching `.trieve` will fail to compile; remove that case from your switch.
- **`CreateAssistantDtoCredentialsItem`** and **`CreateWorkflowDtoCredentialsItem`** have two new cases (`.microsoft` and `.s3Compatible`). Exhaustive `switch` statements without a `default` branch will fail to compile; add `case .microsoft`, `case .s3Compatible`, or a `default` branch.
- **`DeepgramVoiceModel`** and **`FallbackDeepgramVoiceModel`** — new `flux` case added; exhaustive `switch` statements must handle this case or add a `default` branch.
- **`RimeAiVoiceIdEnum`** and **`FallbackRimeAiVoiceIdEnum`** — seven new voice cases added (`clementine`, `walnut`, `eyre`, `bancroft`, `hesse`, `beatty`, `godfrey`); exhaustive `switch` statements must handle these cases or add a `default` branch.
- **`FallbackAssemblyAiTranscriberSpeechModel`** — new `universal35Pro` and `universal36Pro` cases added; exhaustive `switch` statements must handle these cases or add a `default` branch.
- **`UpdateCampaignDtoStatus`** gains a new `cancelled` case; exhaustive `switch` statements must add a `case .cancelled:` arm or a `default:` branch to compile.
- **`UpdateAssistantDtoCredentialsItem`** gains new `microsoft` and `s3Compatible` cases; exhaustive `switch` statements must handle these new cases.
- **`UpdateAssistantDtoCredentialsItem.trieve`** case has been removed; remove any `case .trieve` arms from `switch` statements.
- **`UpdateWorkflowDtoCredentialsItem`**, **`WorkflowCredentialsItem`**, and **`WorkflowUserEditableCredentialsItem`** — the `.trieve` enum case has been removed; delete any `case .trieve` branches from exhaustive `switch` statements.
- **`UpdateWorkflowDtoCredentialsItem`**, **`WorkflowCredentialsItem`**, and **`WorkflowUserEditableCredentialsItem`** — two new cases (`.microsoft` and `.s3Compatible`) have been added; exhaustive `switch` statements must add handlers for these cases or adopt a `default` branch.
- **`AssistantModel`** and **`AssistantOverridesModel`** gain a new `.vapi(VapiModel)` case. Exhaustive `switch` statements must add a `.vapi` branch (or a `default` branch) to compile.
- **`AssistantTranscriber`** and **`AssistantOverridesTranscriber`** gain new `.vapi(VapiTranscriber)` and `.xai(XaiTranscriber)` cases. Exhaustive `switch` statements must handle both new cases.
- **`AssistantOverridesVoice`** gains new `.microsoft(MicrosoftVoice)` and `.xai(XaiVoice)` cases. Exhaustive `switch` statements must handle both new cases.
- **`AssistantServerMessagesItem`** and **`AssistantOverridesServerMessagesItem`** gain a new `.callArtifactUpload` case. Exhaustive `switch` statements must add a `.callArtifactUpload` branch.
- **`AssistantVoice`** gains two new cases — `.microsoft(MicrosoftVoice)` and `.xai(XaiVoice)`. Exhaustive `switch` statements must add these cases or a `default` branch.
- **`AzureCredentialRegion`** and **`AzureOpenAiCredentialRegion`** gain `switzerlandnorth` and `switzerlandwest` cases. Exhaustive `switch` statements must handle these new values.
- **`AzureOpenAiCredentialModelsItem`** gains six new model cases (`gpt56Luna20260709`, `gpt56Terra20260709`, `gpt56Sol20260709`, `gpt4O`, `gpt41`, `gpt54Mini20260317`). Exhaustive `switch` statements must handle these new values.
- **`CampaignStatus`** gains two new cases: `cancelled` and `archived`. Exhaustive `switch` statements over this enum will fail to compile — add `case .cancelled, .archived:` branches or a `default:` fallthrough.
- **`CampaignControllerFindAllRequestStatus`** gains two new cases: `cancelled` and `archived`. Apply the same fix as `CampaignStatus` above.
- **`CreateAnthropicBedrockCredentialDtoRegion`** — new `euCentral1` (`"eu-central-1"`) case added to this enum. Swift `switch` statements over this type must now handle `.euCentral1` or add a `default` branch to avoid a compile error.

### Added

- **`CampaignsClient`** gains five new v2 campaign methods: `campaignControllerFindAllV2`, `campaignControllerCreateV2`, `campaignControllerFindOneV2`, `campaignControllerRemoveV2`, `campaignControllerUpdateV2`, and `campaignControllerGetCampaignV2Contacts` for managing campaigns via the `/v2/campaign` endpoints.
- **`campaignControllerFindAll`** now accepts an optional `sortBy` parameter of type `CampaignControllerFindAllRequestSortBy` for controlling sort column.
- **`CreateCallDto`** adds optional `assistantVersion` (`Nullable<String>?`) and `squadVersion` (`Nullable<String>?`) fields for pinning a specific assistant or squad version on a call.
- **`CreateFileDto`** adds optional `purpose` (`CreateFilesRequestPurpose?`) and `metadata` (`String?`) fields for specifying the product flow and JSON-encoded metadata on file uploads.
- **`UpdateStructuredOutputDto`** adds an optional `conditions` field (`Nullable<[UpdateStructuredOutputDtoConditionsItem]>?`) for gating structured output execution.
- **`sortBy`** optional parameter added to `ChatsClient.list`, `EvalClient.evalControllerGetPaginated`, `EvalClient.evalControllerGetRunsPaginated`, `InsightClient.insightControllerFindAll`, `ObservabilityScorecardClient.scorecardControllerGetPaginated`, and `PhoneNumbersClient.phoneNumberControllerFindAllPaginated` for controlling the sort column on paginated results.
- **`idAny`** optional parameter added to `ChatsClient.list` for filtering chats by any of multiple IDs.
- **`search`** optional parameter added to `EvalClient.evalControllerGetRunsPaginated` for case-insensitive search across eval and assistant names.
- **`purpose`** optional parameter added to `FilesClient.list` to filter returned files by their upload purpose.
- Inline Swift documentation comments added to all public methods across `EvalClient`, `FilesClient`, `InsightClient`, `ObservabilityScorecardClient`, and `PhoneNumbersClient`.
- **`sortBy`** optional parameter added to `providerResourceControllerGetProviderResourcesPaginated`, `structuredOutputControllerFindAll`, and `SessionsClient.list` to control which column results are sorted by.
- **`squadOverrides`** and **`idAny`** optional filter parameters added to `SessionsClient.list`; **`idAny`** also added to `SquadsClient.list`.
- **`toolRefs`** optional field added to `AnthropicModel` and `AnthropicBedrockModel` for version-pinned tool references by `(toolId, version)`.
- **`reasoningEffort`** and **`fallbackModels`** optional fields added to `AnthropicModel` and `AnthropicBedrockModel` to configure adaptive thinking effort and same-provider Bedrock fallback models.
- **`structuredOutputControllerRun`** now returns `StructuredOutputControllerRunResponse` instead of `StructuredOutput`, reflecting the richer run result payload.
- **`Call`** gains new optional fields: `assistantVersion` (`Nullable<String>?`), `squadVersion` (`Nullable<String>?`), `transport: CallTransport?`, and `phoneNumber: TransientTwilioPhoneNumber?`.
- **`Campaign`** gains new optional fields: `maxConcurrency`, `assistantOverrides`, `squadOverrides`, `server`, `serverMessages`, and `predialPlan` for richer campaign configuration.
- **`CerebrasModel`** gains a new optional `toolRefs: [ToolRef]?` field for version-pinned tool references.
- **`CodeTool`** and **`ComputerTool`** gain new optional `latestVersion` and `baselineVersion` fields for tool version tracking.
- **`CreateApiRequestToolDto`** gains a new optional `name` field and updated documentation for `backoffPlan`.
- **`DeepgramTranscriber.redaction`** — new optional `[DeepgramTranscriberRedactionItem]?` property to redact sensitive information (PCI, PII, PHI, numbers) from transcripts.
- **`DeepgramTranscriber.languages`** — new optional `[String]?` property to provide BCP-47 language hints for the `flux-general-multi` model.
- **`DeepgramVoice.speed`** and **`DeepgramVoice.expressivity`** — new optional `Double?` properties for controlling speech rate and expressivity on Aura-2 and Flux voices.
- **`toolRefs: [ToolRef]?`** — new optional version-pinned tool references field on `DeepInfraModel` and `DeepSeekModel`; when a `toolId` appears in both `toolIds` and `toolRefs`, the `toolRefs` pin takes precedence.
- **`latestVersion`** and **`baselineVersion`** — new nullable version-tracking fields on `DtmfTool` and `EndCallTool`; **`EvaluationPlanItem.path`** — new optional dot-notation path for selecting a primitive leaf from an object structured output.
- **`latestVersion`** and **`baselineVersion`** optional `Nullable<String>?` fields added to `GoogleCalendarCreateEventTool`, `GoogleSheetsRowAppendTool`, `HandoffTool`, `MakeTool`, and `McpTool` to support tool version pinning.
- **`toolRefs: [ToolRef]?`** optional property added to `GoogleModel`, `GroqModel`, and `InflectionAiModel` for version-pinned tool references that take precedence over `toolIds` entries.
- **`region: String?`** optional field added to `MicrosoftCredential` to specify the Azure region for the Speech resource.
- **`Subscription.name`** — new optional `Nullable<String>?` display name for the subscription, unique across all subscriptions.
- **`Subscription.billingCollectionMethod`** — new optional `Nullable<SubscriptionBillingCollectionMethod>?` indicating whether payment is charged to card or invoiced.
- **`StructuredOutput.conditions`** — new optional `Nullable<[StructuredOutputConditionsItem]>?` field for gating structured-output execution with AND-semantics conditions.
- **`TogetherAiModel.toolRefs`** — new optional `[ToolRef]?` field for version-pinned tool references; a `toolRefs` pin takes precedence over the same `toolId` in `toolIds`.
- **`TextEditorTool.latestVersion`**, **`TextEditorTool.baselineVersion`**, **`TransferCallTool.latestVersion`**, and **`TransferCallTool.baselineVersion`** — new optional nullable version-tracking fields on reusable tool types.
- **`.microsoft(CreateMicrosoftCredentialDto)`** — new credential provider case on `CreateAssistantDtoCredentialsItem` and `CreateWorkflowDtoCredentialsItem` for Microsoft credentials.
- **`.s3Compatible(CreateS3CompatibleCredentialDto)`** — new credential provider case on both credential enums for S3-compatible storage credentials.
- **`AttachKnowledgeBaseV2FileDto`** — new request struct for attaching a file to a V2 knowledge base by `fileId`.
- **`CreateBoardDto`** — new request struct for creating a board with items, layout, name, and an optional time-range override.
- **`CreateKnowledgeBaseV2Dto`** — new request struct for creating a V2 knowledge base with a name and optional description.
- **`CreateSimulationDto`**, **`CreateSimulationRunDto`**, and **`CreateSimulationSuiteDto`** — new request structs for managing AI-tester simulations, simulation runs, and simulation suites.
- **`CreateTrafficAllocationDto`** — new request type for splitting assistant calls across versions with explicit or follow-latest allocation intent.
- **`UpdateBoardDto`**, **`UpdateKnowledgeBaseV2Dto`**, **`UpdatePersonalityDto`**, **`UpdateScenarioDto`**, **`UpdateSimulationDto`**, **`UpdateSimulationSuiteDto`**, and **`GenerateScenariosDto`** — new request structs covering board, knowledge base, personality, scenario, simulation, and suite management.
- **`ValidateBackgroundSoundUrlDto`** and **`AssistantsClient.assistantControllerValidateBackgroundSoundUrl`** — new method and DTO for validating that a background sound URL serves a live media file.
- **`InsightRunDto.assistantId`** — new optional `String?` field for scoping insight dashboard queries to a specific assistant at runtime without mutating the saved insight.
- **`BoardClient`** — new client for creating, retrieving, updating, and deleting reporting boards via `/reporting/board`.
- **`KnowledgeBasesV2Client`** — new client for managing v2 knowledge bases, including file attachment, detachment, and retry operations via `/v2/knowledge-base`.
- **`SimulationPersonalitiesClient`** — new client for managing AI tester personalities used in simulations via `/eval/simulation/personality`.
- **`SimulationRunsClient`** — new client for starting, monitoring, cancelling, and generating AI improvement suggestions for simulation runs via `/eval/simulation/run`.
- **Call artifact download methods** on `CallsClient` — `callArtifactControllerMonoRecordingDownload`, `callArtifactControllerStereoRecordingDownload`, `callArtifactControllerVideoRecordingDownload`, `callArtifactControllerCustomerRecordingDownload`, `callArtifactControllerAssistantRecordingDownload`, `callArtifactControllerPcapDownload`, and `callArtifactControllerCallLogsDownload` for downloading call recordings and logs by call ID.
- **`SimulationScenariosClient`** — new client for managing eval simulation scenarios (list, create, get, update, delete, and AI-generate scenarios) via `/eval/simulation/scenario`.
- **`SimulationSuitesClient`** — new client for managing simulation suites (list, create, duplicate, get, update, delete) via `/eval/simulation/suite`.
- **`SimulationsClient`** — new client for managing simulations (list, create, get, update, delete, and query concurrency) via `/eval/simulation`.
- **`TrafficAllocationsClient`** — new beta client for managing assistant traffic-splitting allocations (paginated history, create, latest, find-one) via `/traffic-allocations`.
- **`AnalysisCost.structuredOutputBreakdown`** — new optional `[StructuredOutputCostBreakdown]?` property providing per-structured-output cost and token breakdowns when `analysisType` is `structuredOutput`.
- **`AnthropicBedrockCredentialRegion.euCentral1`** — new `eu-central-1` region value added to the Bedrock credential region enum.
- **`AnthropicBedrockModelReasoningEffort`** and **`AnthropicModelReasoningEffort`** — new enums for controlling reasoning/thinking effort (`none`, `low`, `medium`, `high`, `xhigh`, `max`) on supported Claude models such as `claude-haiku-5-5`.
- **`AnthropicBedrockModelFallbackModelsItem`** — new enum listing all valid fallback model identifiers for Anthropic Bedrock configurations.
- **New model variants** added to `AnthropicModelModel` (`claudeSonnet5`, `claudeHaiku55`) and `AnthropicBedrockModelModel` (`claudeHaiku55`, `globalAnthropicClaudeHaiku4520251001V10`).
- **`AssemblyAiTranscriberLanguageCodesItem`** and **`AssemblyAiTranscriberMode`** — new enums for AssemblyAI Universal Pro speech model language and transcription mode configuration.
- **`Assistant.latestVersion`** and **`Assistant.modelDeprecations`** — new optional fields exposing the assistant's latest published version label and any model deprecation notices; **`AssistantActivation.assistantVersion`** and **`AssistantActivation.squadVersion`** — new optional fields recording the version labels active at the time of an activation event.
- **`AssistantDraft`** — new struct representing a versioned assistant draft, exposing the full assistant configuration alongside draft-specific fields (`id`, `orgId`, `assistantId`, `baseVersion`, `createdBy`, `createdAt`, `updatedAt`).
- **`AssistantDraftBackgroundSound`** and **`AssistantDraftBackgroundSoundZero`** — new types for specifying the background sound of a draft assistant call (`off` or `office`, or a custom audio URL).
- **`AssistantDraftClientMessagesItem`** — new enum listing all client-side message event types that a draft assistant can emit.
- **`AssistantDraftConflictResponseDto`** — new struct returned when a draft creation or update conflicts with an existing draft, carrying `existingDraftId`, `error`, and `message` fields.
- **`AssistantDraftCredentialsItem`** — new discriminated-union enum covering 60+ credential providers (Anthropic, Azure, OpenAI, Twilio, and more) for use in assistant draft payloads.
- **`AssistantDraftModel`** — new discriminated-union enum covering 17 LLM providers (OpenAI, Anthropic, Groq, Gemini, etc.) with full `Codable` support.
- **`AssistantDraftTranscriber`** — new discriminated-union enum covering 14 transcription providers (Deepgram, AssemblyAI, ElevenLabs, etc.) with full `Codable` support.
- **`AssistantDraftPaginatedResponse`** and **`AssistantDraftPaginatedMetadata`** — new structs for paginated listings of assistant drafts.
- **`AssistantDraftFirstMessageMode`**, **`AssistantDraftServerMessagesItem`**, and **`AssistantDraftHooksItem`** — new supporting enums for configuring assistant draft behavior and event hooks.
- **`AssistantDraftVoice`** — new discriminated union enum covering all supported voice providers for assistant drafts, including `sesame`, `smallestAi`, `inworld`, `microsoft`, and `xai`.
- **`AssistantDraftVoicemailDetection`** and **`AssistantDraftVoicemailDetectionZero`** — new types for configuring or disabling voicemail detection on assistant drafts.
- **`AssistantManagedConflictResponseDto`** and **`AssistantManagedVapiAgentsDto`** — new response types surfacing conflict details when a Vapi Agents agent manages an assistant and a write is rejected.
- **`AssistantPinnedConflictResponseDto`** — new response type returned when a parent-assistant delete is rejected due to pinned squad members.
- **`AssistantVersion`** — new public struct representing a versioned snapshot of an assistant's configuration, including all assistant settings plus versioning metadata such as `id`, `orgId`, `assistantId`, `version`, `configHash`, `parentVersion`, `restoredFromVersion`, `createdBy`, `deletedAt`, and `createdAt`.
- **`AssistantVersionBackgroundSound`** — new enum (union of `AssistantVersionBackgroundSoundZero` and `String`) for specifying the background sound of an assistant version.
- **`AssistantVersionBackgroundSoundZero`** — new enum with `off` and `office` cases for built-in background sound options.
- **`AssistantVersionClientMessagesItem`** — new enum listing all supported client-side message event types (e.g. `conversationUpdate`, `transcript`, `toolCalls`, `workflowNodeStarted`).
- **`AssistantVersionCredentialsItem`** — new discriminated union enum covering 60+ credential providers (Anthropic, OpenAI, Twilio, Azure, Google, Slack, and more) for use in assistant version configuration.
- **`AssistantVersionModel`** — new discriminated union enum covering 17 LLM provider variants (OpenAI, Google, Groq, Anthropic, xAI, etc.) for specifying the assistant's language model.
- **`AssistantVersionTranscriber`** — new discriminated union enum covering 14 transcriber provider variants (Deepgram, AssemblyAI, ElevenLabs, Google, etc.) for specifying the assistant's speech-to-text engine.
- **`AssistantVersionHooksItem`**, **`AssistantVersionFirstMessageMode`**, and **`AssistantVersionServerMessagesItem`** — new enums for configuring assistant version lifecycle hooks, first-message behavior, and server-side event subscriptions.
- **`AssistantVersionPaginatedMetadata`** — new struct exposing cursor-based pagination metadata (`nextCursor`, `hasNextPage`, `limit`) for paginated assistant version list responses.
- **`AssistantVersionVoice`** and **`AssistantVersionVoicemailDetection`** — new enums representing voice and voicemail-detection options for assistant versions.
- **`AudioFormat`** — new struct describing the sample rate, format (`pcm_s16le`, `mulaw`), and container of a call's audio stream.
- **`BackgroundSoundUrlValidationResult`** — new struct reporting whether a background-sound URL serves a valid audio file, with a typed `reason` enum for failures.
- **`Board`**, **`BoardInsightItem`**, and supporting types (`BoardItemPosition`, `BoardItemSize`, `BoardLayout`, etc.) — new types for managing dashboard boards and their widget layout.
- **`CallTransport`** — new discriminated enum covering `daily`, `telnyx`, `twilio`, `vapi.sip`, `vapi.websocket`, and `vonage` transports, returned on call objects.
- **Board schema types** — `BoardItemSize`, `BoardLayout`, `BoardMetricWidgetItem`, `BoardMetricWidgetItemType`, `BoardItemsItem`, and `BoardPaginatedResponse` provide full model support for the Boards feature.
- **`BooleanComparatorScorecardMetricCondition`** — new scorecard metric condition type (with `BooleanComparatorScorecardMetricConditionComparator` and `BooleanComparatorScorecardMetricConditionType`) for boolean-valued structured-output comparisons.
- **`BotMessage.assistantName` / `BotMessage.assistantId`** — new optional fields that identify the specific sub-agent that spoke each message in squad and handoff calls.
- **New `CallEndedReason` cases** — added cases for xAI voice/transcriber failures, Microsoft voice failures, Cartesia transcriber failures, call-forwarding no-answer, SIP outbound errors, assistant/squad version validation errors, and config-fault squad/transport errors; also added `CallArtifactUploadItemType` enum.
- **`CampaignSummary`** — new rich campaign summary type with status, contact counters, call metrics, predial plan, server messages, and scheduling fields.
- **`CampaignContact`** and **`CampaignContactWithOutcome`** — new types representing individual campaign contacts and their call outcomes, along with paginated response wrappers `CampaignContactPaginatedResponse` and `CampaignSummaryPaginatedResponse`.
- **`CampaignPredialPlan`** — new type enabling the blocking `campaign.predial` eligibility webhook; paired with new `CampaignServerMessagesItem` and `CampaignSummaryServerMessagesItem` enums covering all campaign lifecycle events.
- **`CartesiaCredential.apiUrl`** — new optional `String?` property to point a Cartesia credential at an on-premises Cartesia instance (defaults to `api.cartesia.ai`).
- **`assistantVersion`** — new optional `Nullable<String>?` property added to all `ClientMessage*` structs, exposing the version label (e.g. `v3`) of the assistant configured for the call; `null` for inline assistants, squad/workflow calls, and orgs not on assistant versioning.
- **`ClientInboundMessageAppendContext`** and **`ClientInboundMessageAppendContextKind`** — new inbound message type that lets client SDKs inject `commentary`, `thinking`, or `instructions` context into a live call; available as the `.appendContext` case on `ClientInboundMessageMessage`.
- **`CartesiaVoiceModel`** — four new model cases: `sonic35` (`sonic-3.5`), `sonic3520260504` (`sonic-3.5-2026-05-04`), `sonic36` (`sonic-3.6`), and `sonic3620260827` (`sonic-3.6-2026-08-27`).
- **`CartesiaTranscriberModel`** — new `ink2` (`ink-2`) case for the Cartesia speech-to-text model.
- **`CartesiaVoiceLanguage`** — new `or` (Odia) and `ur` (Urdu) language code cases.
- **`assistantVersion`** — new optional `Nullable<String>?` property added to all `ClientMessage` types (`ClientMessageHang`, `ClientMessageLanguageChangeDetected`, `ClientMessageMetadata`, `ClientMessageModelOutput`, `ClientMessageSessionCreated`, `ClientMessageSessionDeleted`, `ClientMessageSessionUpdated`, `ClientMessageSpeechUpdate`, `ClientMessageToolCalls`, and `ClientMessageToolCallsResult`) that exposes the version label (e.g. `v3`) of the assistant the call was configured with; `null` for inline assistants, squad/workflow calls, pre-resolution assistant-request messages, and orgs not on assistant versioning.
- **`ClientMessageTranscript`** gains optional `assistantVersion`, `assistantId`, `assistantName`, `confidence`, and `confidenceSource` fields for richer transcript metadata including confidence scoring.
- **`assistantVersion`** optional field added to `ClientMessageTransferUpdate`, `ClientMessageUserInterrupted`, `ClientMessageVoiceInput`, and `ClientMessageWorkflowNodeStarted` to surface the active assistant version label on all client messages.
- **`ClientMessageTranscriptConfidenceSource`** new enum (`provider` / `derived`) indicating whether a transcript confidence score came directly from the transcriber or was computed by Vapi.
- **`ConflictErrorBody`** new discriminated union type covering `toolPinned` and `toolWriteConflict` conflict error responses.
- **`ConversationNodeTranscriber`** and **`ConversationNodeVoice`** gain new provider cases: `.vapi` and `.xai` for transcribers; `.microsoft` and `.xai` for voices.
- **`CreateAssistantDraftDto`** — new struct for creating versioned assistant drafts, supporting the full set of assistant configuration fields plus a `baseVersion` pointer to the published version the draft was forked from.
- **`CreateAssistantDraftDtoClientMessagesItem`** — new enum listing all client-message event types that can be configured on a draft assistant.
- **`CreateAssistantDraftDtoBackgroundSound`** — new union type (enum value or custom URL string) for specifying background sound on a draft assistant.
- **`CreateAssistantDraftDtoCredentialsItem`** — new enum supporting 60+ credential providers (Anthropic, OpenAI, Azure, Twilio, and more) for assistant draft configuration.
- **`CreateAssistantDraftDtoModel`** — new enum covering 17 LLM providers to specify the assistant's language model in draft requests.
- **`CreateAssistantDraftDtoTranscriber`** — new enum covering 14 transcription providers to specify the assistant's transcriber in draft requests.
- **`CreateAssistantDraftDtoHooksItem`** — new enum for call lifecycle hooks including assistant/customer speech interruption, call ending, and session creation events.
- **`CreateAssistantDraftDtoFirstMessageMode`** and **`CreateAssistantDraftDtoServerMessagesItem`** — new enums for controlling first-message behavior and server-side message subscriptions on assistant drafts.
- **`CreateCartesiaCredentialDto.apiUrl`** — new optional `String?` property to point to an on-premises Cartesia instance (defaults to `api.cartesia.ai`).
- **`CreateElevenLabsCredentialDto.apiUrl`** — new optional `Nullable<CreateElevenLabsCredentialDtoApiUrl>?` property selecting the global or EU data-residency ElevenLabs endpoint; accompanied by the new **`CreateElevenLabsCredentialDtoApiUrl`** enum.
- **`CreateCustomerDto.squadOverrides`** — new optional `AssistantOverrides?` property for applying overrides when a call targets a `squadId` instead of a single assistant.
- **`CreateOutboundCallDtoTransport`** — new discriminated-union enum covering `daily`, `telnyx`, `twilio`, `vapi.sip`, `vapi.websocket`, and `vonage` transports for outbound calls.
- **`CreateFilesRequestPurpose`** — new enum with `assistant`, `composerAttachment`, and `knowledgeBaseV2` cases describing the product flow that owns an uploaded file.
- **`CreateSimulationRunResponse`** — new response type representing a queued or running simulation run, including status, item counts, target, transport configuration, and a dashboard URL.
- **`CreateSimulationRunResponseStatus`** — new enum with `queued`, `running`, and `ended` cases for tracking simulation run state.
- **`CreateSimulationRunResponseSimulationsItem`** and **`CreateSimulationRunResponseTarget`** — new discriminated union types for simulation entries (`simulation`/`simulationSuite`) and targets (`assistant`/`squad`).
- **`CreateStructuredOutputDtoConditionsItem`** — new discriminated enum supporting `endedReason`, `minCallDuration`, and `minMessages` condition types.
- **`CreateSonioxCredentialDto.apiUrl`** — new optional `String?` field for specifying a custom Soniox WebSocket endpoint (e.g. an EU-region server); defaults to the region-appropriate endpoint when omitted.

### Changed

- **`Subscription.callRetentionDays`** and **`Subscription.chatRetentionDays`** widened from `Double?` to `Nullable<Double>?` to support explicit null values.
- **`ToolNodeTool`** enum is now declared `indirect`, enabling recursive enum cases.
- **`ElevenLabsVoice`** and **`FallbackElevenLabsVoice`** — doc comments updated to note that several voice settings are ignored by `eleven_v4_turbo`, and language enforcement now also applies to Flash v2.5 and v4 Turbo models.
- **`OpenAiVoiceId`** and **`FallbackOpenAiVoiceId`** — doc comments updated to reflect new GPT-Live-only voices (`quartz`, `ripple`, `vesper`, `willow`, `stone`, `gleam`, `meridian`, `bossa`, `tempo`, `beacon`, `delta`, `cinder`).
- **`SipAuthentication.realm`** documentation clarifies that the default SIP realm is region-specific (e.g. `sip.vapi.ai` for US, `sip.eu.vapi.ai` for EU).
- **`SipTrunkGateway.ip`** documentation clarifies that inbound gateways require an IPv4 address while outbound-only gateways may also use a fully qualified domain name.

## 1.0.0 - 2026-06-24
### Breaking Changes
* **`CartesiaExperimentalControlsSpeedZero`** has been removed and replaced by **`CartesiaSpeedControlZero`**. Update any references to this type and rename pattern matches on `CartesiaSpeedControl.cartesiaExperimentalControlsSpeedZero` to `.cartesiaSpeedControlZero`.
* **`FallbackAzureVoiceVoiceIdZero`** has been removed and replaced by **`FallbackAzureVoiceIdZero`**. Update any references to this type and rename pattern matches on `FallbackAzureVoiceId.fallbackAzureVoiceVoiceIdZero` to `.fallbackAzureVoiceIdZero`.

## 0.1.0 - 2026-04-22
### Added
* **`Call.subscriptionLimits`** — new optional `SubscriptionLimits?` property on `Call` that exposes org-level subscription and concurrency limit information at the time of the call.

## 0.0.1 - 2026-04-10
* Initial SDK generation
* 🌿 Generated with Fern

