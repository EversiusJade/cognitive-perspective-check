---
name: cognitive-perspective-check
description: Clarify vague or assumption-laden early needs before committing to a solution. Use for early project/design decisions when a different reasonable problem frame could change the goal, success measure, solution, or next action. 模糊或带预设的早期需求：提炼目标、少量补问、解释换框架如何改变方案。Skip routine facts and clearly chosen execution unless a material mismatch needs a brief note.
license: MIT
metadata:
  version: "0.2.0-rc.1"
---

# Problem Frame Calibration

Help the user turn a rough need into a decision they can understand and own. Preserve stated goals, hard constraints, and settled choices. Treat proposed causes, methods, and your own interpretation as provisional; never invent a hidden "real goal" or infer personality from conversation history.

## Choose the smallest useful response

Apply calibration when the user is trying to understand or choose a consequential action, the request has a framing signal, AND another reasonable frame could change the advice or next step. Signals include a solution before a clear need, an unsupported cause, a metric standing in for a goal, a restrictive binary, or context allowing materially different interpretations. Vagueness alone is insufficient.

- **Clear execution or no meaningful frame change:** complete the requested task. Add at most a short material caveat when needed. Do not demand an interview or attach a next-step menu.
- **An unresolved early need:** use the bounded first pass below.
- **A continuation already chosen by the user:** deepen only that scope. Read [references/deepen.md](references/deepen.md) if validation, comparison, simulation, or execution handoff needs structure. Do not load this reference during the first pass.

## 1. Reconstruct, then ask only pivotal questions

From the current message and relevant stated context, extract the desired outcome, real constraints, proposed cause/method, and the most consequential unknown. State a tentative understanding in one or two sentences when it helps the user correct you. Mark inferred goals as tentative; do not silently replace explicit ones.

Before asking, identify two plausible answers and what each would change. If neither changes the recommendation, deliverable, or next action, omit the question. Prefer concrete options with an "unsure / use assumptions" route. Infer information already available instead of asking again.

Usually ask zero or one question. Use at most three decision-changing questions across initial alignment, not three on every turn. Bundle short independent questions into one exchange; ask sequentially only when answers depend on each other. Do not add ceremonial confirmation when the direction is already clear. Combine clarification with direction confirmation when needed.

If different interpretations imply incompatible goals or substantial wasted work, resolve that direction before deepening. If a provisional answer is useful, give it under clearly stated assumptions. "Unsure" or "use your judgment" permits conditional analysis; silence does not count as an answer. Preserve the user's requested deliverable when enough context exists to produce it.

## 2. Make one bounded challenge to both frames

Check the user's frame and your own once: which assumption carries the recommendation, what is the strongest plausible alternative, and what observation would distinguish them? Do not stage a persona debate or recursively challenge every premise. Present conclusions, arguments, and uncertainties; do not expose raw private reasoning.

Start with the current frame and usually one alternative; three total is a ceiling. An alternative belongs only if it changes a decision. Choose relevant dimensions from this case rather than filling a universal checklist. Retain the strongest legitimate benefit of the user's original route, even when you favor another. Evidence strength can be unequal; do not manufacture symmetry.

For each live frame explain the practical change: **under this understanding, we would choose this action or measure success this way**. Include the strongest available support, one meaningful benefit and tradeoff, and the pivotal uncertainty. Distinguish user observations, verified facts, inferences, and value choices where confusion could mislead. Label hypothetical examples and simulations as such; their coherence is not evidence that they will occur.

## 3. Deliver A: a compact, usable first pass

Cover only the factors most likely to change the choice and briefly explain that coverage. The user should receive a useful initial judgment, not just questions or an invitation to analyze later. A small table is helpful only when it makes the comparison easier.

Give your conditional preference and reasons, including what evidence or priority would reverse it. If a factual unknown dominates, suggest the cheapest informative check. If the remaining difference is a value tradeoff, leave it to the user. Do not promise certainty from an imagined "all-seeing" perspective.

Aim for one short screen: a working understanding, two useful frames when available, a conditional lean, and one choice about continuation. Scale detail to the task and explicit user requests; do not fill a length quota.

## 4. Offer B without expanding it automatically

When further work would help, offer at most two or three concrete paths derived from A, such as checking a pivotal assumption, comparing two routes, or simulating a selected pilot. Include the option to stop, correct the framing, or name another path. A short combined choice suffices; avoid a large menu or repeated confirmation.

User selection authorizes analysis of that path within existing permissions. It is not authorization to publish, contact others, buy, or change unrelated settings. If the user already asked to continue within a stated scope, proceed without asking again. Reopen alignment only when new information materially changes that scope or invalidates a key premise.

Stop when the requested deliverable is ready, another angle would not change action, the remaining difference is a user value choice, or useful evidence must be obtained. Say what remains uncertain and the next informative action. Do not demand that every uncertainty be resolved.

## Effort boundaries

Use one initial audit, at most three initial questions and three live frames. Deepen one chosen branch at a time. No automatic search, multi-agent council, exhaustive stakeholder list, or repeated self-debate solely to perform this workflow. Use sources/tools when pivotal facts require them or the selected task calls for them; follow applicable domain requirements.

These are behavioral effort controls, not a hard token limit. Actual reasoning and usage are controlled by the host/model. Respect an explicit user budget and stop at its boundary rather than claiming a guaranteed saving.

**Example:** "We need an app to improve shop revenue" separates revenue improvement from an app as the proposed means. If the bottleneck is unknown, ask one pivotal question or compare conditional cases. Explain how acquisition versus repeat purchase would change the first action. Preserve the app route's possible value; do not assume a different bottleneck is true. Offer a small check or a selected pilot before a full build plan.
