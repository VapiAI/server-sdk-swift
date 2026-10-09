## [2.0.0] - 2026-10-09
### Breaking Changes
- **`Requests.CreateCampaignDto`** and **`Requests.UpdateCampaignDto`** have been removed. Remove any references to these request types and migrate to the updated campaign API.
- **`ByoSipTrunkCredential.sbcConfiguration`** property has been removed. Remove any access to this field from your code.
- **`TrieveKnowledgeBase`**, **`TrieveKnowledgeBaseChunkPlan`**, **`TrieveKnowledgeBaseSearchPlan`**, **`CreateTrieveKnowledgeBaseDto`**, and all related Trieve knowledge base types have been removed. Update any code referencing these types.
- **`FallbackVapiVoiceVoiceId`** and **`GhlToolType`** enums have been removed. Update any switch statements or references to these types.
- **`GroqModelModel.metaLlamaLlama4Maverick17B128EInstruct`** and **`EvalGroqModelModel.metaLlamaLlama4Maverick17B128EInstruct`** enum cases have been removed. Update any switch statements or references to this case.

### Breaking Changes
- **`UpdateScenarioDto`**, **`UpdateSimulationDto`**, **`UpdateSimulationSuiteDto`**, **`UpdateTrieveKnowledgeBaseDto`**, **`VapiModelProvider`**, and **`VapiVoiceVoiceId`** have been removed. Remove any references to these types from your code.
- **`CreateCallDto.transport`** type changed from `[String: JSONValue]?` to `CreateCallDtoTransport?`. Update any code constructing or reading this field to use the new strongly-typed `CreateCallDtoTransport` value.

### Added
- **`CreateCallDto.assistantVersion`** and **`CreateCallDto.squadVersion`** — new optional `Nullable<String>` fields to pin a call to a specific assistant or squad version.
- **`CampaignsClient`** v2 endpoints — `campaignControllerFindAllV2`, `campaignControllerCreateV2`, `campaignControllerFindOneV2`, `campaignControllerRemoveV2`, `campaignControllerUpdateV2`, and `campaignControllerGetCampaignV2Contacts` for managing campaigns via the `/v2/campaign` API.
- **`Requests.CreateFileDto`** gains optional `purpose` (`CreateFilesRequestPurpose?`) and `metadata` (`String?`) fields; **`Requests.UpdateStructuredOutputDto`** gains an optional `conditions` (`Nullable<[UpdateStructuredOutputDtoConditionsItem]>?`) field.

### Added
- **`sortBy`** optional parameter added to `ChatsClient.list`, `EvalClient.evalControllerGetPaginated`, `EvalClient.evalControllerGetRunsPaginated`, `InsightClient.insightControllerFindAll`, `ObservabilityScorecardClient.scorecardControllerGetPaginated`, and `PhoneNumbersClient.phoneNumberControllerFindAllPaginated` to control the sort column for paginated results.
- **`idAny`** optional parameter added to `ChatsClient.list` for filtering chats by any of multiple IDs.
- **`search`** optional parameter added to `EvalClient.evalControllerGetRunsPaginated` for case-insensitive search across eval and assistant names.
- **`purpose`** optional parameter added to `FilesClient.list` to filter returned files by their upload purpose.
- Inline Swift documentation comments added to all public methods across `EvalClient`, `FilesClient`, `InsightClient`, `ObservabilityScorecardClient`, and `PhoneNumbersClient`.

### Added
- **`sortBy`** optional parameter added to `providerResourceControllerGetProviderResourcesPaginated`, `structuredOutputControllerFindAll`, and `SessionsClient.list` for column-level sort control.
- **`toolRefs: [ToolRef]?`** optional field added to `AnthropicBedrockModel`, `AnthropicModel`, and `AnyscaleModel` for version-pinned tool references by `(toolId, version)`.
- **`fallbackModels: [AnthropicBedrockModelFallbackModelsItem]?`** optional field added to `AnthropicBedrockModel` to configure a same-provider Bedrock fallback model.
- **`squadOverrides`**, **`idAny`** optional filter parameters added to `SessionsClient.list`, and **`idAny`** added to `SquadsClient.list`.

### Changed
- **`structuredOutputControllerRun`** now returns `StructuredOutputControllerRunResponse` instead of `StructuredOutput`; update any code that consumes the return value of this method.

### Breaking Changes
- **`Artifact.transfers`** type changed from `[String]?` to `[TransferArtifact]?`. Update any code that decoded transfer records as plain strings to use the new `TransferArtifact` type instead.
- **`AssistantVersionPaginatedResponse.results`** type changed from `[JSONValue]` to `[AssistantVersion]`. Update decoding logic to expect strongly-typed `AssistantVersion` values.
- **`AssistantVersionPaginatedResponse.metadata`** type changed from `PaginationMeta` to `AssistantVersionPaginatedMetadata`. Update any references to this property accordingly.
- **`AssistantVersionPaginatedResponse.nextPageState`** property has been removed. Remove any references to this field.

### Added
- **`Artifact`** gains eight new optional presigned URL properties (`presignedMonoUrl`, `presignedStereoUrl`, `presignedVideoUrl`, `presignedAssistantUrl`, `presignedCustomerUrl`, `presignedPcapUrl`, `presignedLogUrl`, `presignedUrlsExpiresAt`) and `skippedStructuredOutputs` for accessing call recordings and skipped structured outputs without authentication.
- **`AssemblyAiTranscriber`** gains new optional fields `mode`, `prompt`, `agentContext`, `agentContextAutoUpdateEnabled`, and `languageCodes` to support AssemblyAI Universal Pro speech models (`universal-3-5-pro` and `universal-3-6-pro`).
- **`ApiRequestTool`** and **`BashTool`** gain a new optional `latestVersion` (`Nullable<String>?`) property.

### Breaking Changes
- **`DeepgramTranscriber.eagerEotThreshold`** has been removed. Remove any references to this property from your code; end-of-turn confidence is now controlled solely via `eotThreshold`.
- **`ElevenLabsPronunciationDictionaryLocator.versionId`** changed from required `String` to optional `String?`. Update call sites to handle the optional or omit the argument to use the dictionary's latest version.

### Added
- **`DeepgramTranscriber.redaction`** — new optional `[DeepgramTranscriberRedactionItem]?` property to redact sensitive information (PCI, PII, PHI, numbers) from transcripts.
- **`DeepgramTranscriber.languages`** and **`DeepgramVoice.speed`** / **`DeepgramVoice.expressivity`** — new optional fields for language hints on Flux Multilingual models and voice speed/expressivity controls on Deepgram voices.
- **`FallbackAssemblyAiTranscriber`** gains `mode`, `prompt`, `agentContext`, `agentContextAutoUpdateEnabled`, and `languageCodes` for Universal Pro speech model configuration.
- **`DtmfTool.latestVersion`**, **`EndCallTool.latestVersion`**, and **`EvaluationPlanItem.path`** — new optional fields on tool and evaluation types.

### Breaking Changes
- **`GenerateScenariosDto`** has been removed and replaced by **`GetTrafficAllocationLatestDto`**, which requires a non-optional `assistantId: String`. Update all references and remove any use of the `squadId` field.
- **`GhlTool`** no longer has a `type: GhlToolType` required property; it is replaced by the optional `latestVersion: Nullable<String>?`. Remove `type:` from any `GhlTool` initializer calls.
- **`GladiaTranscriber.languages`** type changed from `GladiaTranscriberLanguages?` to `[GladiaTranscriberLanguagesItem]?`. Update any code that assigns or pattern-matches on this property.
- **`FallbackGladiaTranscriberLanguages`** has been renamed to **`GladiaTranscriberLanguagesItem`**. Update all type references accordingly.

### Added
- **`latestVersion: Nullable<String>?`** optional property added to `GoHighLevelCalendarAvailabilityTool`, `GoHighLevelCalendarEventCreateTool`, `GoHighLevelContactCreateTool`, `GoHighLevelContactGetTool`, `GoogleCalendarCheckAvailabilityTool`, and `GoogleCalendarCreateEventTool`.
- **`GetEvalRunPaginatedDto`** gains new optional `sortBy: GetEvalRunPaginatedDtoSortBy?` and `search: String?` fields for filtering eval run listings by sort field and name search.

### Breaking Changes
- **`TrieveCredential`** has been removed and replaced by **`MicrosoftCredential`** (with a corresponding `MicrosoftCredentialProvider`). Update all type references and rename any pattern matches accordingly.
- **`InviteUserDtoRole`** has changed from a `String`-backed `CaseIterable` enum to a union type (`InviteUserDtoRoleZero | String`). Exhaustive `switch` statements must be updated to handle the new `.inviteUserDtoRoleZero` and `.string` cases.
- **`OpenAiFunction`** initializer parameter order has changed: `name` now precedes `strict`. Callers using positional arguments must reorder them to `(name:, strict:, ...)`.

### Added
- **`toolRefs: [ToolRef]?`** — new optional property on `GoogleModel`, `GroqModel`, `InflectionAiModel`, and `MinimaxLlmModel` for version-pinned tool references by `(toolId, version)`.
- **`latestVersion: Nullable<String>?`** — new optional property on `GoogleSheetsRowAppendTool`, `HandoffTool`, `MakeTool`, and `McpTool`; also adds `region: String?` to `MicrosoftCredential` for specifying the Azure Speech resource region.

### Breaking Changes
- **`CreateSimulationSuiteDto`** has been removed and replaced by **`SimulationRunListSource`**. Update all references and initializer call sites to use the new type, which has a different set of required properties (`type`, `linkable`, `simulationIds`, `name`).
- **`TrieveKnowledgeBaseCreate`** has been removed and replaced by **`SimulationSuiteTargetAssignment`**. Update all references to use the new type, which exposes `targetType` and `targetId` instead of `type` and `chunkPlans`.

### Added
- **`SimulationRunItemResults.latencyEvaluations`** — new optional `[LatencyEvaluationResult]?` property exposing per-expectation latency evaluation results; absent when the scenario has no latency expectations.
- **`SipRequestTool.latestVersion`**, **`SlackSendMessageTool.latestVersion`**, and **`SmsTool.latestVersion`** — new optional `Nullable<String>?` property added to these tool types.
- **`SonioxTranscriber`** gains five new optional configuration fields: `languages` (multi-language hints / auto-detect), `endpointSensitivity`, `endpointLatencyAdjustmentLevel`, `contextGeneral`, and `confidenceThreshold`.

### Breaking Changes
- **`Subscription.slackSupportEnabled`** and **`Subscription.slackChannelId`** have been removed. Remove any references to these properties in your code.
- **`ToolCallResult.message`** type has been renamed from `ToolCallResultMessage` to `ToolCallResultSpokenMessage`. Update all type annotations and pattern matches accordingly.
- **`Subscription.callRetentionDays`** and **`Subscription.chatRetentionDays`** changed from `Double?` to `Nullable<Double>?`. Update unwrapping logic to handle the `Nullable` wrapper (e.g., use `.value` or switch on `.null`/`.value`).
- **`UpdateByoSipTrunkCredentialDto.sbcConfiguration`** has been removed. Remove any references to this property.

### Added
- **`Subscription.name`** — new optional `Nullable<String>?` display name for the subscription, unique across all subscriptions.
- **`Subscription.billingCollectionMethod`** — new optional `Nullable<SubscriptionBillingCollectionMethod>?` indicating how payment is collected (card on file or invoiced).
- **`TextEditorTool.latestVersion`** and **`TransferCallTool.latestVersion`** — new optional `Nullable<String>?` version-pinning fields on reusable tools.
- **`TogetherAiModel.toolRefs`** — new optional `[ToolRef]?` array for version-pinned tool references; when the same tool appears in both `toolIds` and `toolRefs`, the `toolRefs` pin takes precedence.
- **`UpdateElevenLabsCredentialDto.apiUrl`** — new optional `Nullable<UpdateElevenLabsCredentialDtoApiUrl>?` for specifying the ElevenLabs API environment (global or EU data residency).

### Breaking Changes
- **`AssistantCredentialsItem`**, **`AssistantOverridesCredentialsItem`**, and **`CreateAssistantDtoCredentialsItem`** — the `.trieve` enum case has been removed. Remove any `case .trieve` branches from your switch statements.
- **`CerebrasModelModel`** — the `.llama3370B` case has been removed. Update any switch statements or references to this case.
- **`AssemblyAiTranscriberSpeechModel`**, **`AssistantCredentialsItem`**, **`AssistantOverridesCredentialsItem`**, and **`CreateAssistantDtoCredentialsItem`** — new enum cases (`.universal35Pro`, `.universal36Pro`, `.microsoft`, `.s3Compatible`) have been added; exhaustive switch statements without a `default` branch must be updated.

### Added
- **`AssistantCredentialsItem.microsoft`** and **`.s3Compatible`** — new credential provider cases for Microsoft and S3-compatible storage across all credential item enums.
- **`AssemblyAiTranscriberSpeechModel.universal35Pro`** and **`.universal36Pro`** — new AssemblyAI speech model options, with `universal-3-6-pro` being AssemblyAI's newest voice-agent model.
- **`VoicemailTool.latestVersion`** — new optional `Nullable<String>?` property for version-pinning the voicemail tool.
- **`XaiModel.toolRefs`** — new optional `[ToolRef]?` property for pinning specific tool versions by `(toolId, version)` pair.

### Breaking Changes
- **`CreateWorkflowDtoCredentialsItem`** — the `.trieve` case has been removed; update any switch statements or pattern matches that reference `.trieve` to remove or replace that branch.
- **`CreateWorkflowDtoCredentialsItem`** — two new cases, `.microsoft` and `.s3Compatible`, have been added; exhaustive switch statements must add handlers for these cases.
- **`DeepgramVoiceModel`** and **`FallbackDeepgramVoiceModel`** — a new `.flux` case has been added; exhaustive switch statements must handle this case.
- **`FallbackAssemblyAiTranscriberSpeechModel`** — new cases `.universal35Pro` and `.universal36Pro` have been added; exhaustive switch statements must handle these cases.
- **`FallbackRimeAiVoiceIdEnum`** — seven new voice ID cases (`clementine`, `walnut`, `eyre`, `bancroft`, `hesse`, `beatty`, `godfrey`) have been added; exhaustive switch statements must handle these cases.

### Changed
- **`ElevenLabsVoice`** and **`FallbackElevenLabsVoice`** — several voice-tuning properties (`similarityBoost`, `style`, `useSpeakerBoost`, `speed`, `optimizeStreamingLatency`, `enableSsmlParsing`, `autoMode`) are now documented as ignored by the `eleven_v4_turbo` model; the `language` field now also applies to Flash v2.5 and v4 Turbo.
- **`FallbackOpenAiVoice`** and **`FallbackOpenAiVoiceId`** — voice availability documentation updated to reflect that many voices (quartz, ripple, vesper, willow, stone, gleam, meridian, bossa, tempo, beacon, delta, cinder) are only supported with GPT-Live models.
- **`FallbackSonioxTranscriberLanguage`** — documentation clarified: when `languages` is set, this field is ignored; defaults to `en` if neither field is set.

### Breaking Changes
- **`UpdateAssistantDtoCredentialsItem.trieve`** has been removed. Remove any pattern matches or encoding logic referencing `.trieve` / `CreateTrieveCredentialDto` from your switch statements.
- **`RimeAiVoiceIdEnum`** gains seven new cases: `clementine`, `walnut`, `eyre`, `bancroft`, `hesse`, `beatty`, and `godfrey`. Add these cases (or a `default` branch) to any exhaustive `switch` on `RimeAiVoiceIdEnum` to restore compilation.

### Added
- **`UpdateAssistantDtoCredentialsItem.microsoft`** — new credential provider case wrapping `CreateMicrosoftCredentialDto` for Microsoft integrations.
- **`UpdateAssistantDtoCredentialsItem.s3Compatible`** — new credential provider case wrapping `CreateS3CompatibleCredentialDto` for S3-compatible storage backends.

### Changed
- **`OpenAiVoiceId` / `OpenAiVoice`** — voice availability documentation updated; `quartz`, `ripple`, `vesper`, `willow`, `stone`, `gleam`, `meridian`, `bossa`, `tempo`, `beacon`, `delta`, and `cinder` are now documented as GPT-Live–only voices.

### Breaking Changes
- **`UpdateWorkflowDtoCredentialsItem`**, **`WorkflowCredentialsItem`**, and **`WorkflowUserEditableCredentialsItem`** — the `.trieve` enum case has been removed; delete any `case .trieve` pattern matches from your switch statements.
- **`UpdateWorkflowDtoCredentialsItem`**, **`WorkflowCredentialsItem`**, and **`WorkflowUserEditableCredentialsItem`** — new `.microsoft` and `.s3Compatible` cases have been added; add `case .microsoft`, `case .s3Compatible`, or a `default` branch to all exhaustive switch statements over these enums.
- **`UpdateCampaignDtoStatus`** — new `.cancelled` case added; add `case .cancelled` or a `default` branch to all exhaustive switch statements over this enum.

### Added
- **`WorkflowCredentialsItem.microsoft`** and **`.s3Compatible`** — support for Microsoft and S3-compatible credential providers in workflow credential enums.
- **`UpdateCampaignDtoStatus.cancelled`** — campaigns can now be stopped using the `cancelled` status (the existing `ended` value remains as a V1 alias).

### Added
- **`CreateSimulationDto`**, **`CreateSimulationRunDto`**, and **`CreateSimulationSuiteDto`** — new request types for creating and running AI simulations and suites against assistants or squads.
- **`CreateBoardDto`** and **`UpdateBoardDto`** — new request types for creating and updating analytics boards with layout, items, and time-range overrides.
- **`CreateKnowledgeBaseV2Dto`**, **`UpdateKnowledgeBaseV2Dto`**, and **`AttachKnowledgeBaseV2FileDto`** — new request types for managing V2 knowledge bases and attaching files.
- **`CreateTrafficAllocationDto`** — new request type for splitting assistant call traffic across multiple target versions with optional concurrency guards.
- **`GenerateScenariosDto`** — new request type for generating test scenarios for an assistant or squad; **`InsightRunDto`** gains an optional `assistantId` field for runtime assistant scoping on dashboard queries.

### Added
- **`BoardClient`** — new client for managing reporting boards, with methods to list, create, retrieve, update, delete, and ensure the default metrics-overview board.
- **`KnowledgeBasesV2Client`** — new client for v2 knowledge bases, including full CRUD and file management operations (`fileAttach`, `fileDetach`, `fileRetry`).
- **`CallsClient`** — new artifact download methods: `callArtifactControllerMonoRecordingDownload`, `callArtifactControllerStereoRecordingDownload`, `callArtifactControllerVideoRecordingDownload`, `callArtifactControllerCustomerRecordingDownload`, `callArtifactControllerAssistantRecordingDownload`, `callArtifactControllerPcapDownload`, and `callArtifactControllerCallLogsDownload`.
- **`AssistantsClient.assistantControllerValidateBackgroundSoundUrl`** — new method to validate a background sound URL before use.
- **New request DTOs** — `UpdateScenarioDto`, `UpdateSimulationDto`, `UpdateSimulationSuiteDto`, and `ValidateBackgroundSoundUrlDto` added to the `Requests` namespace.

### Added
- **`SimulationPersonalitiesClient`** — new client for creating, reading, updating, and deleting AI tester personality configurations used in simulations.
- **`SimulationScenariosClient`** — new client for managing simulation scenarios (the AI tester's intent and success criteria), including AI-powered scenario generation.
- **`SimulationSuitesClient`** — new client for managing simulation suites (groups of simulations), including a `simulationSuiteControllerDuplicate` method to clone an existing suite.
- **`SimulationRunsClient`** — new client for starting, cancelling, and inspecting simulation runs and their individual items, plus `simulationRunControllerGenerateSuggestions` for AI-driven improvement hints.
- **`SimulationsClient`** — new top-level simulation client for creating and managing simulations, querying concurrency limits, and triggering scenario generation.

### Breaking Changes
- **`AnthropicBedrockCredentialRegion`**, **`AnthropicBedrockModelModel`**, and **`AnthropicModelModel`** — new enum cases added (`euCentral1`, `globalAnthropicClaudeHaiku4520251001V10`, `claudeSonnet5`). Exhaustive `switch` statements over these types will fail to compile; add a `default` case or handle the new values explicitly.

### Added
- **`TrafficAllocationsClient`** — new client for managing assistant traffic splitting (beta), with methods to list, create, fetch the latest, and fetch a single allocation by ID.
- **`Assistant.latestVersion`** and **`Assistant.modelDeprecations`** — new optional properties exposing the assistant's latest version label and any model deprecation notices.
- **`AssistantActivation.assistantVersion`** and **`AssistantActivation.squadVersion`** — new optional properties recording the version labels active at the time of an activation.
- **`AnalysisCost.structuredOutputBreakdown`** — new optional `[StructuredOutputCostBreakdown]?` property providing per-structured-output cost detail when `analysisType` is `structuredOutput`.
- **`AnthropicBedrockModelFallbackModelsItem`**, **`AssemblyAiTranscriberLanguageCodesItem`**, and **`AssemblyAiTranscriberMode`** — new enum types added to the schema layer.

### Added
- **`AssistantDraft`** — new struct representing a versioned assistant draft, including full assistant configuration fields plus draft metadata (`id`, `orgId`, `assistantId`, `baseVersion`, `createdBy`, `createdAt`, `updatedAt`).
- **`AssistantDraftBackgroundSound`** and **`AssistantDraftBackgroundSoundZero`** — new types for configuring the background sound of an assistant draft call.
- **`AssistantDraftClientMessagesItem`** — new enum enumerating all supported client-side message event types for assistant drafts.
- **`AssistantDraftConflictResponseDto`** — new struct representing a 409 conflict response returned when an assistant draft already exists.

### Added
- **`AssistantDraftCredentialsItem`** — new discriminated enum covering 60+ credential providers (Anthropic, Azure, Deepgram, OpenAI, Twilio, and more) for use in assistant draft payloads.
- **`AssistantDraftModel`** — new discriminated enum covering 17 LLM providers (OpenAI, Anthropic, Groq, Google, xAI, and more) for specifying the assistant draft's language model.
- **`AssistantDraftTranscriber`** — new discriminated enum covering 14 transcription providers (Deepgram, AssemblyAI, ElevenLabs, Google, and more) for specifying the assistant draft's transcriber.
- **`AssistantDraftHooksItem`**, **`AssistantDraftFirstMessageMode`**, and **`AssistantDraftServerMessagesItem`** — new supporting enums for configuring assistant draft hooks, first-message behavior, and server message subscriptions.
- **`AssistantDraftPaginatedResponse`** and **`AssistantDraftPaginatedMetadata`** — new structs for paginated listings of assistant drafts.

### Breaking Changes
- **`AssistantTranscriber`** and **`AssistantOverridesTranscriber`** — new `.vapi` and `.xai` cases added; exhaustive `switch` statements without a `default` branch will fail to compile. Add a `default` case or handle the new variants explicitly.
- **`AssistantModel`** and **`AssistantOverridesModel`** — new `.vapi` case added; exhaustive `switch` statements without a `default` branch will fail to compile. Add a `default` case or handle the new variant explicitly.
- **`AssistantOverridesVoice`** — new `.microsoft` and `.xai` cases added; exhaustive `switch` statements without a `default` branch will fail to compile. Add a `default` case or handle the new variants explicitly.
- **`AssistantServerMessagesItem`** and **`AssistantOverridesServerMessagesItem`** — new `.callArtifactUpload` case added; exhaustive `switch` statements without a `default` branch will fail to compile. Add a `default` case or handle the new variant explicitly.

### Added
- **`AssistantDraftVoice`** — new enum covering all voice providers (including `sesame`, `smallestAi`, `xai`, and others) for use with assistant draft configurations.
- **`AssistantDraftVoicemailDetection`** and **`AssistantDraftVoicemailDetectionZero`** — new types for configuring or disabling voicemail detection on assistant drafts.
- **`AssistantPinnedConflictResponseDto`** and **`AssistantPinnedConflictResponseDtoError`** — new response types returned when a delete is rejected because the assistant is pinned.

### Added
- **`AssistantVersion`** — new struct representing a versioned snapshot of an assistant's configuration, including versioning metadata such as `id`, `orgId`, `assistantId`, `version`, `configHash`, `parentVersion`, `restoredFromVersion`, `createdBy`, `deletedAt`, and `createdAt`.
- **`AssistantVersionBackgroundSound`** — new enum (union of `AssistantVersionBackgroundSoundZero` and `String`) for specifying background sound in a versioned assistant configuration.
- **`AssistantVersionBackgroundSoundZero`** — new enum with `off` and `office` cases for the built-in background sound options.
- **`AssistantVersionClientMessagesItem`** — new enum listing all supported client message event types for a versioned assistant.

### Added
- **`AssistantVersionCredentialsItem`** — new discriminated enum covering 60+ credential providers (Anthropic, OpenAI, Azure, Twilio, and more) for use in assistant version configuration.
- **`AssistantVersionModel`** — new discriminated enum representing 17 supported LLM providers (including Anthropic, Google, Groq, OpenAI, and xAI) for assistant version model selection.
- **`AssistantVersionTranscriber`** — new discriminated enum covering 14 transcription providers (including Deepgram, ElevenLabs, Google, and Soniox) for assistant version transcriber configuration.
- **`AssistantVersionHooksItem`**, **`AssistantVersionFirstMessageMode`**, and **`AssistantVersionServerMessagesItem`** — new enums for configuring assistant version lifecycle hooks, first-message behavior, and server-side message subscriptions.
- **`AssistantVersionPaginatedMetadata`** — new struct exposing cursor-based pagination metadata (`nextCursor`, `hasNextPage`, `limit`) for paginated assistant version list responses.

### Breaking Changes
- **`AssistantVoice`** gains two new cases — `.microsoft(MicrosoftVoice)` and `.xai(XaiVoice)`. Add these cases (or a `default` branch) to any exhaustive `switch` on this enum.
- **`AzureCredentialRegion`** and **`AzureOpenAiCredentialRegion`** each gain `switzerlandnorth` and `switzerlandwest` cases. Add these cases (or a `default` branch) to any exhaustive `switch` on these enums.
- **`AzureOpenAiCredentialModelsItem`** gains six new model cases (`gpt56Luna20260709`, `gpt56Terra20260709`, `gpt56Sol20260709`, `gpt4O`, `gpt41`, `gpt54Mini20260317`). Add these cases (or a `default` branch) to any exhaustive `switch` on this enum.

### Added
- **`AssistantVersionVoice`** — new discriminated-union enum covering all supported voice providers for assistant versions.
- **`AssistantVersionVoicemailDetection`** and **`AssistantVersionVoicemailDetectionZero`** — new types for configuring or disabling voicemail detection on assistant versions.
- **`AudioFormat`**, **`AudioFormatFormat`**, and **`AudioFormatContainer`** — new types describing the sample rate, encoding format, and container of call audio.
- **`BackgroundSoundUrlValidationResult`** and **`BackgroundSoundUrlValidationResultReason`** — new types reporting whether a background-sound URL serves a valid audio file and why validation may have failed.
- **`Board`**, **`BoardInsightItem`**, **`BoardItemPosition`**, **`BoardItemSize`**, **`BoardLayout`**, and related supporting types — new schema types for dashboard boards and their widget layout.
- See full changelog for all changes

### Added
- **`BoardItemSize`**, **`BoardLayout`**, **`BoardMetricWidgetItem`**, **`BoardItemsItem`**, and **`BoardPaginatedResponse`** — new schema types for managing and paginating boards with metric widget items.
- **`CallTransport`** — new discriminated union covering `daily`, `telnyx`, `twilio`, `vapi.sip`, `vapi.websocket`, and `vonage` transport providers, exposing the transport details of a call.
- **`BooleanComparatorScorecardMetricCondition`** — new struct (with companion `Comparator` and `Type` enums) for defining boolean-valued scorecard metric conditions.
- **`BotMessage.assistantName`** and **`BotMessage.assistantId`** — new optional fields that identify the specific sub-agent that produced a message in squad or handoff calls.
- **New `CallEndedReason` cases** — added cases for xAI/Microsoft voice and transcriber failures, Cartesia transcriber, Vapi transcriber, ElevenLabs concurrency/voice-disabled errors, SIP outbound errors, call-forwarding no-answer, worker-not-available at call start, config-fault model/transport errors, and assistant/squad version validation errors.

### Breaking Changes
- **`CampaignStatus`** gains two new cases: `cancelled` and `archived`. Exhaustive `switch` statements on this enum will fail to compile — add `case .cancelled, .archived:` or a `default:` branch to fix.
- **`CampaignControllerFindAllRequestStatus`** gains `cancelled` and `archived` cases. Update any exhaustive `switch` on this enum the same way.

### Added
- **`CampaignSummary`** and **`CampaignSummaryPaginatedResponse`** — new types for the campaign V2 listing API, including status, ended reason, contact counters, and call metrics.
- **`CampaignContact`**, **`CampaignContactWithOutcome`**, **`CampaignContactPaginatedResponse`**, and **`CampaignContactCounters`** — new types for per-contact tracking and paginated contact results within a campaign.
- **`CampaignCallMetrics`** and **`CampaignPredialPlan`** — new types exposing call-level outcomes (dialed/connected counts) and pre-dial eligibility webhook configuration.
- **`CartesiaCredential.apiUrl`** — new optional `String?` property for pointing to an on-premises Cartesia instance instead of the default `api.cartesia.ai`.

### Added
- **`assistantVersion`** — new optional `Nullable<String>?` property added to all `ClientMessage` structs (e.g. `ClientMessageAssistantSpeech`, `ClientMessageAssistantStarted`, `ClientMessageConversationUpdate`, and others) that surfaces the version label of the assistant configured for the call; `null` for inline assistants, squad/workflow calls, and orgs not on assistant versioning.
- **`ClientInboundMessageAppendContext`** and **`ClientInboundMessageAppendContextKind`** — new types that allow clients to inject `commentary`, `thinking`, or `instructions` context into an active call via the `appendContext` case on `ClientInboundMessageMessage`.
- **`CartesiaVoiceModel.sonic35`** and **`CartesiaVoiceModel.sonic3520260504`** — two new Cartesia voice model cases for the Sonic 3.5 family.
- **`CartesiaTranscriberModel.ink2`** — new `ink-2` transcription model case added to `CartesiaTranscriberModel`.
- Documentation comments added to `CartesiaGenerationConfig`, `CartesiaTranscriber`, `CartesiaVoice`, `CartesiaSpeedControl`, `ChunkPlan`, and all `ChatEval*` schema types.

### Added
- **`assistantVersion`** — new optional `Nullable<String>?` property added to `ClientMessageHang`, `ClientMessageLanguageChangeDetected`, `ClientMessageMetadata`, `ClientMessageModelOutput`, `ClientMessageSessionCreated`, `ClientMessageSessionDeleted`, `ClientMessageSessionUpdated`, `ClientMessageSpeechUpdate`, `ClientMessageToolCalls`, and `ClientMessageToolCallsResult`. It exposes the version label (e.g. `v3`) of the assistant the call was configured with, and is `null` for inline assistants, squad/workflow calls, pre-resolution assistant-request messages, and orgs not on assistant versioning.

### Breaking Changes
- **`ConversationNodeTranscriber`** gains two new cases: `.vapi` and `.xai`. Exhaustive `switch` statements over this enum will fail to compile — add `case .vapi`, `case .xai`, or a `default` branch to fix.
- **`ConversationNodeVoice`** gains two new cases: `.microsoft` and `.xai`. Exhaustive `switch` statements over this enum will fail to compile — add `case .microsoft`, `case .xai`, or a `default` branch to fix.

### Added
- **`ClientMessageTranscript`** exposes new optional fields: `assistantVersion` (`Nullable<String>?`), `assistantId` (`String?`), `assistantName` (`String?`), `confidence` (`Double?`), and `confidenceSource` (`ClientMessageTranscriptConfidenceSource?`) for richer transcript metadata.
- **`assistantVersion`** (`Nullable<String>?`) added to `ClientMessageTransferUpdate`, `ClientMessageUserInterrupted`, `ClientMessageVoiceInput`, and `ClientMessageWorkflowNodeStarted` to surface the active assistant version label on all client messages.
- **`ClientMessageTranscriptConfidenceSource`**, **`ConflictErrorBody`**, and **`ContextEngineeringPlanPreviousAssistantMessages`** are new public types available for decoding API responses.

### Breaking Changes
- **`CreateAnthropicBedrockCredentialDtoRegion`** — new `euCentral1` case added to this enum. Swift `switch` statements without a `default` branch will fail to compile; add a `default` case or handle `.euCentral1` explicitly.

### Added
- **`CreateAssistantDraftDto`** — new struct for creating assistant drafts, with optional fields covering transcriber, model, voice, plans, hooks, credentials, and a `baseVersion` pointer to the published version the draft was forked from.
- **`CreateAssistantDraftDtoBackgroundSound`** and **`CreateAssistantDraftDtoBackgroundSoundZero`** — supporting types for the background sound configuration on draft assistants.
- **`CreateAssistantDraftDtoClientMessagesItem`** — enum of client-message event types available on draft assistants.

### Breaking Changes
- **`CreateAssistantDraftDtoCredentialsItem`**, **`CreateAssistantDraftDtoModel`**, **`CreateAssistantDraftDtoTranscriber`**, **`CreateAssistantDraftDtoHooksItem`**, **`CreateAssistantDraftDtoFirstMessageMode`**, and **`CreateAssistantDraftDtoServerMessagesItem`** are new public enums. Because Swift `switch` statements over enums must be exhaustive, any existing code that switches over these types without a `default` clause will fail to compile if new cases are added in future releases. Add a `default` clause to future-proof your switch statements.

### Added
- **`CreateCartesiaCredentialDto.apiUrl`** — new optional `String?` property to point to an on-premises Cartesia instance (defaults to `api.cartesia.ai`).
- **`CreateElevenLabsCredentialDto.apiUrl`** — new optional `Nullable<CreateElevenLabsCredentialDtoApiUrl>?` property selecting the global or EU data-residency ElevenLabs endpoint; accompanied by the new **`CreateElevenLabsCredentialDtoApiUrl`** enum.
- **`CreateCustomerDto.squadOverrides`** — new optional `AssistantOverrides?` property for applying overrides when a call targets a `squadId`.
- **`CreateOutboundCallDtoTransport`** — new discriminated-union enum supporting `daily`, `telnyx`, `twilio`, `vapi.sip`, `vapi.websocket`, and `vonage` transport providers for outbound calls.
- **`CreateFilesRequestPurpose`** — new enum with `assistant`, `composer-attachment`, and `knowledge-base-v2` cases for specifying the product flow that owns an uploaded file.

### Added
- **`CreateSimulationRunResponse`** — new response type representing a simulation run, including status, target, simulations list, item counts, and a dashboard URL.
- **`CreateSimulationRunResponseStatus`**, **`CreateSimulationRunResponseSimulationsItem`**, and **`CreateSimulationRunResponseTarget`** — supporting enum types for the simulation run response.
- **`CreateStructuredOutputDto.conditions`** — new optional `Nullable<[CreateStructuredOutputDtoConditionsItem]>?` field that gates structured output execution; supports `endedReason`, `minCallDuration`, and `minMessages` condition types.
- **`CreateSonioxCredentialDto.apiUrl`** — new optional `String?` field for specifying a custom Soniox WebSocket endpoint (e.g. an EU-region server).

### Added
- **`CreateToolDraftDto`** — new struct (with supporting enums `CreateToolDraftDtoType`, `CreateToolDraftDtoMethod`, `CreateToolDraftDtoVerb`, and `CreateToolDraftDtoMessagesItem`) for creating and managing tool drafts forked from published versions.
- **`CreateTrafficAllocationTargetDto`** and **`CreateTrafficAllocationDtoAllocationIntent`** — new types for splitting assistant call traffic across published versions with explicit percentage targets or a follow-latest strategy.
- **`CreateWebCallDto.assistantVersion`** and **`CreateWebCallDto.squadVersion`** — new optional `Nullable<String>?` fields for pinning a web call to a specific published assistant or squad version.
- **`CreateToolsRequest.code`** and **`CreateToolsResponse.ghl` / `CreateToolsResponse.knowledgeBase`** — new enum cases added to the tools request and response discriminated unions to support code, GHL, and knowledge-base tool variants.

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

