## [2.0.0] - 2026-11-27
### Breaking Changes
- **`assistant` property** on `CreateCallDto`, `CreateChatDto`, `CreateSessionDto`, `OpenAiResponsesRequest`, `OpenAiWebChatRequest`, `EvalRunTargetAssistant`, and `HandoffDestinationAssistant` changed type from `CreateAssistantDto` to `TransientAssistantDto`; update all construction and pattern-matching sites.
- **Tavus voice cases** (`.tavus(TavusVoice)`) removed from all voice union enums (`AssistantVoice`, `AssistantOverridesVoice`, `CreateAssistantDtoVoice`, `UpdateAssistantDtoVoice`, `ConversationNodeVoice`, `WorkflowVoice`, `RecordingConsentPlanStayOnLineVoice`, `RecordingConsentPlanVerbalVoice`, `TransferAssistantVoice`, and fallback variants); remove `.tavus` arms and migrate to `.microsoft` or `.xai`.
- **Trieve types and credential cases** — `TrieveKnowledgeBase` and all related types (`TrieveKnowledgeBaseChunkPlan`, `UpdateTrieveKnowledgeBaseDto`, etc.) removed, and `.trieve` credential cases removed from all `CredentialsItem` enums; remove all references and exhaustive switch arms.
- **New enum cases added** to `AssistantModel`, `AssistantOverridesModel`, `AssistantTranscriber`, `AssistantOverridesTranscriber`, `AssistantServerMessagesItem`, `AssistantOverridesServerMessagesItem`, `CallEndedReason`, `AnthropicModelModel`, `AnthropicBedrockModelModel`, `AssistantBackgroundSoundZero`, `DeepgramVoiceModel`, and `ElevenLabsTranscriberLanguage`; any exhaustive `switch` without a `default` branch will fail to compile — add `default` or handle each new case.
- **Miscellaneous removals** — `Requests.CreateCampaignDto`, `Requests.UpdateCampaignDto`, `ByoSipTrunkCredential.sbcConfiguration`, `VapiModelProvider`, `VapiVoiceVoiceId`, `InviteUserDtoRole` string-backed enum, `DeepgramTranscriber.eagerEotThreshold`, `AssistantsClient.create`/`update` return type changed from `Assistant` to `AssistantSaveResponse`, and `StructuredOutputsClient.structuredOutputControllerRun` return type changed from `StructuredOutput` to `StructuredOutputControllerRunResponse`; see full changelog for all changes.

### Added
- **New clients** — `BoardClient`, `SimulationPersonalitiesClient`, `SimulationScenariosClient`, `SimulationRunsClient`, `SimulationSuitesClient`, `SimulationsClient`, `KnowledgeBasesV2Client`, and `TrafficAllocationsClient` added for boards, simulations, v2 knowledge bases, and traffic allocation management.
- **`CampaignsClient`** gains six v2 API methods (`campaignControllerFindAllV2`, `campaignControllerCreateV2`, etc.) and `CallsClient` gains seven call-artifact download methods for recordings, PCAP, and logs.
- **`Artifact`** gains presigned URL fields and `skippedStructuredOutputs`; `AssistantSaveResponse` is a new struct returned by `AssistantsClient.create`/`update`; `AssistantVersion`, `AssistantDraft`, and their supporting paginated-response types added for version-history tracking.
- **New voice and credential providers** — `MicrosoftVoice` and `XaiVoice` cases added to all voice enums; `CreateMicrosoftCredentialDto`, `CreateReson8CredentialDto`, and `CreateS3CompatibleCredentialDto` cases added to all credential-item enums.
- **Expanded model and transcriber capabilities** — `toolRefs: [ToolRef]?` added to Anthropic, Anyscale, Google, Groq, InflectionAI, Minimax, and OpenAI models; `DeepgramTranscriber` gains `redaction` and `languages`; `AssemblyAiTranscriber` gains Universal Pro fields; `AnthropicModel`/`AnthropicBedrockModel` gain `reasoningEffort`; `sortBy`, `idAny`, and `purpose` filter parameters added to numerous paginated list methods; see full changelog for all changes.

### Changed
- **`temperature` default** documentation updated from `0` to `0.5` across `InflectionAiModel`, `MinimaxLlmModel`, and `OpenAiModel`; verify your temperature settings if you relied on the previous default.
- **`ElevenLabsPronunciationDictionaryLocator.versionId`** changed from required `String` to optional `String?`; update initializer call sites accordingly.

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

