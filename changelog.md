## [2.0.0] - 2026-11-20
### Breaking Changes
- **`assistant` properties on `CreateCallDto`, `CreateChatDto`, `CreateSessionDto`, `CreateOutboundCallDto`, `OpenAiWebChatRequest`, `HandoffDestinationAssistant`, `Personality`, `SquadMemberDto`, and `CreatePersonalityDto`** — type changed from `CreateAssistantDto` to `TransientAssistantDto`; update all construction and decoding sites to use `TransientAssistantDto`.
- **`transport` on `CreateCallDto` and `CreateOutboundCallDto`** — type changed from `[String: JSONValue]` to a typed struct (`CreateCallDtoTransport` / `CreateOutboundCallDtoTransport`); replace raw dictionary literals with the new typed value.
- **Removed types** — `Requests.CreateCampaignDto`, `Requests.UpdateCampaignDto`, `SbcConfiguration`, `ByoSipTrunkCredential.sbcConfiguration`, `TrieveKnowledgeBase*` family, `CreateTrieveCredentialDto` (renamed to `CreateReson8CredentialDto`), `UpdateTrieveCredentialDto` (renamed to `UpdateReson8CredentialDto`), `VapiModelProvider`, `VapiVoiceVoiceId`, and several simulation/hook typealiases have been removed; update all references accordingly.
- **`.tavus` and `.trieve` enum cases** removed from all voice and credential union types (`AssistantVoice`, `AssistantOverridesVoice`, `CreateAssistantDtoVoice`, `UpdateAssistantDtoVoice`, `CreateWorkflowDtoVoice`, `WorkflowVoice`, and all credential item enums); exhaustive `switch` statements must remove these cases and add the new `.microsoft`, `.xai`, `.reson8`, and `.s3Compatible` cases.
- **`CallEndedReason`, `CampaignStatus`, `AssistantModel`, `AssistantTranscriber`, and several background-sound enums** gain new cases; exhaustive `switch` statements will fail to compile — add a `default` branch or handle each new case.
- See full changelog for all changes

### Added
- **New clients** — `BoardClient`, `KnowledgeBasesV2Client`, `SimulationPersonalitiesClient`, `SimulationRunsClient`, `SimulationScenariosClient`, `SimulationSuitesClient`, `SimulationsClient`, and `TrafficAllocationsClient` added for boards, v2 knowledge bases, simulation management, and traffic allocation.
- **`CampaignsClient`** — six new v2 campaign methods targeting `/v2/campaign`, plus `sortBy` and contact-listing support; `CallsClient` gains `callArtifactController*` methods for downloading recordings and call logs.
- **`toolRefs: [ToolRef]?`** and **`reasoningEffort`** — new optional properties added to `AnthropicModel`, `AnthropicBedrockModel`, `OpenAiModel`, `GoogleModel`, `GroqModel`, and other LLM model types for version-pinned tool references and adaptive thinking control.
- **`AssistantDraft` and `AssistantVersion`** — new versioned assistant snapshot types with full configuration plus draft/version metadata, supporting paginated listings and conflict-response handling.
- **New voice and credential providers** — `MicrosoftVoice`, `XaiVoice`, `CreateMicrosoftCredentialDto`, `CreateReson8CredentialDto`, and `CreateS3CompatibleCredentialDto` added across all voice and credential union enums; `AssemblyAiTranscriberSpeechModel` gains `universal35Pro` and `universal36Pro` cases.
- See full changelog for all changes

### Changed
- **`SonioxTranscriberLanguage`** — doc comment clarifies that when `languages` is set this field is ignored; defaults to `en` if neither is set.
- **`SipAuthentication.realm`** — default now documented as region-specific (`sip.vapi.ai` for US, `sip.eu.vapi.ai` for EU) rather than a fixed value.

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

