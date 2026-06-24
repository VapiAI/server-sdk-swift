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

