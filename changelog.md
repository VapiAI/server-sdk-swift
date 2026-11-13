## [2.0.0] - 2026-11-13
### Breaking Changes
- **`CreateAssistantDto` → `TransientAssistantDto`** — the `assistant` property on `CreateCallDto`, `CreateChatDto`, `CreateSessionDto`, `CreateWebCallDto`, `CreateWebChatDto`, `OpenAiResponsesRequest`, `HandoffDestinationAssistant`, `TesterPlan`, and `Personality` now requires `TransientAssistantDto`; update all construction and pattern-match sites.
- **Removed types** — `TrieveKnowledgeBaseChunkPlan`, `TrieveKnowledgeBaseCreate`, `TrieveCredential`/`TrieveCredentialProvider` (renamed to `Reson8Credential`/`Reson8CredentialProvider`), `TavusVoice`/`TavusConversationProperties` (replaced by `JSONValue` typealiases), `User` (renamed to `UserWithRole`), and several other types have been removed or renamed; update all references accordingly.
- **Removed and added enum cases** — `.trieve` removed from all credential enums, `.tavus` removed from all voice enums, and `.llama3370B` removed from `CerebrasModelModel`; new cases `.microsoft`, `.reson8`, `.s3Compatible` (credentials) and `.microsoft`, `.xai` (voices) added across `AssistantCredentialsItem`, `CreateAssistantDtoCredentialsItem`, `UpdateAssistantDtoCredentialsItem`, workflow, and related enums — exhaustive `switch` statements must be updated.
- **Field type changes** — `GladiaTranscriber.languages` changed from `GladiaTranscriberLanguages?` to `[GladiaTranscriberLanguagesItem]?`; `CustomerSpeechTimeoutOptions.triggerResetMode` changed to `CustomerSpeechTimeoutOptionsTriggerResetMode?`; `ToolCallResult.message` changed to `ToolCallResultSpokenMessage?`; `RecordingConsent.type` changed to `RecordingConsentType`; `UserMessage.metadata` changed to `UserMessageMetadata?`; `UpdateUserRoleDtoRole` and `InviteUserDtoRole` changed to tagged unions.
- See full changelog for all changes

### Added
- **New simulation and board clients** — `SimulationsClient`, `SimulationRunsClient`, `SimulationScenariosClient`, `SimulationSuitesClient`, `SimulationPersonalitiesClient`, `BoardClient`, `KnowledgeBasesV2Client`, and `TrafficAllocationsClient` added for AI tester, dashboard board, v2 knowledge base, and traffic-split management.
- **Assistant versioning** — `AssistantDraft`, `AssistantVersion`, and their full supporting type families (credentials, model, transcriber, voice, hooks, paginated response) added for managing versioned assistant configurations.
- **Call Health Dashboard** — comprehensive new type family (`CallHealthDashboardIssueSummaryDto`, `CallHealthDashboardGoalSummaryDto`, `CallHealthDashboardCoverageDto`, and 20+ related types) added for monitoring call quality and issue tracking.
- **New model and voice capabilities** — `toolRefs: [ToolRef]?` and `reasoningEffort` added to Anthropic, OpenAI, Google, Groq, and other model types; `MicrosoftVoice` and `XaiVoice` added as new voice providers; seven new Rime AI voice IDs and new Deepgram/AssemblyAI model values added.
- See full changelog for all changes

### Changed
- **Doc comments** — all public methods across `CampaignsClient`, `EvalClient`, `FilesClient`, `InsightClient`, `PhoneNumbersClient`, `SquadsClient`, `SessionsClient`, and all `CreateXxxToolDto`/`Update*ToolDto` structs have been updated with accurate Swift doc comments.

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

