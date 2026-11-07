## [2.0.0] - 2026-11-07
### Breaking Changes
- **`CreateAssistantDto` → `TransientAssistantDto`** — the `assistant` property on `CreateCallDto`, `CreateChatDto`, `CreateSessionDto`, `CreateWebCallDto`, `CreateWebChatDto`, `HandoffDestinationAssistant`, and `SquadMemberDto` changed type; update all construction and pattern-match sites to use `TransientAssistantDto`.
- **Removed types** — `TrieveKnowledgeBaseChunkPlan`, `TrieveKnowledgeBaseCreate`, `TrieveKnowledgeBaseProvider`, `VapiModelProvider`, `VapiVoiceVoiceId`, `UpdateScenarioDto`, `UpdateSimulationDto`, and `UpdateSimulationSuiteDto` have been removed; delete all references.
- **`.tavus` and `.trieve` enum cases removed** — `AssistantVoice`, `ConversationNodeVoice`, `CreateAssistantDtoVoice`, `TransferAssistantVoice`, `UpdateAssistantDtoVoice`, `FallbackPlanVoicesItem`, `RecordingConsentPlanStayOnLineVoice`, `RecordingConsentPlanVerbalVoice`, `WorkflowVoice`, and related workflow/credential enums no longer have `.tavus` or `.trieve` cases; replace with `.microsoft`, `.xai`, `.reson8`, or `.s3Compatible` as appropriate.
- **New enum cases require `default` branches** — `CallEndedReason`, `CampaignStatus`, `CampaignControllerFindAllRequestStatus`, `AnthropicModelModel`, `AnthropicBedrockModelModel`, `AssistantBackgroundSoundZero`, `AssistantTranscriber`, `AssistantModel`, `AssistantServerMessagesItem`, and others gained new cases; exhaustive `switch` statements will fail to compile without a `default` branch.
- **Miscellaneous type changes** — `StructuredOutputsClient.structuredOutputControllerRun` now returns `StructuredOutputControllerRunResponse`; `GladiaTranscriber.languages` changed to `[GladiaTranscriberLanguagesItem]?`; `TavusConversationProperties` is now a `typealias` for `JSONValue`; `DeepgramTranscriber.eagerEotThreshold` replaced by `feedbackFilterEnabled`; `CreateCallDto.transport` changed to `CreateCallDtoTransport?`; `CredentialEndUser.organizationId` is now optional; `Subscription.callRetentionDays`/`chatRetentionDays` changed to `Nullable<Double>?`.
- See full changelog for all changes

### Added
- **New simulation clients** — `SimulationsClient`, `SimulationSuitesClient`, `SimulationScenariosClient`, `SimulationPersonalitiesClient`, and `SimulationRunsClient` provide full CRUD and AI-assisted onboarding for the simulation platform.
- **New infrastructure clients** — `BoardClient`, `KnowledgeBasesV2Client`, `TrafficAllocationsClient`, `GuardrailPacksClient`, `GuardrailRulesClient`, and `CampaignsClient` (v2 endpoints) are now available.
- **Call artifact downloads** — `CallsClient` gains seven artifact download methods covering mono/stereo/video/customer/assistant recordings, PCAP, and call logs.
- **`MicrosoftVoice`, `XaiVoice`, and new credential types** — Microsoft and xAI TTS voice cases and `CreateMicrosoftCredentialDto`, `CreateReson8CredentialDto`, `CreateS3CompatibleCredentialDto` credential cases added across all voice and credential union enums.
- **`AssistantDraft` and `AssistantVersion` families** — new structs and supporting enums for versioned assistant drafts and snapshots, including paginated response types, conflict DTOs, and full provider coverage for model/transcriber/voice/credential fields.
- See full changelog for all changes

### Changed
- **`ElevenLabsVoice` and `FallbackElevenLabsVoice`** — doc comments clarify that several audio-quality properties are ignored by `eleven_v4_turbo` and `eleven_v3_conversational` models.
- **Doc comments expanded** — `InsightClient`, `ObservabilityScorecardClient`, `PhoneNumbersClient`, `ProviderResourcesClient`, `SquadsClient`, `TurnLatency`, `SubscriptionLimits`, `TransferPlan`, `ToolMessageDelayed`, and all `Update*ToolDto` structs received detailed parameter-level documentation.

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

