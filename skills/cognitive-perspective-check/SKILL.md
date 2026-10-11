---
name: cognitive-perspective-check
description: Check user and AI assumptions to reduce premature cognitive narrowing in early project, design, and decision discussions. Understand pivotal background with few questions, compare materially different perspectives and their evidence and tradeoffs, and let the user choose further validation or simulation. 减少认知窄化：理解关键背景、检验双方预设、对照少量视角与取舍、给出条件建议。Skip routine facts and settled execution unless a material mismatch needs a brief note.
license: MIT
metadata:
  version: "0.2.0-rc.2"
---

# Cognitive Perspective Check

Support early project and decision work by reducing the risk that an incomplete background, a user premise, or your own interpretation prematurely narrows the analysis. Use one connected process: understand the relevant context and rules, identify the core decision, compare a few consequential perspectives, explain conditional consequences, and offer grounded options and a conditional recommendation. The user chooses whether and where to deepen.

Understanding is the basis of this process; requirements clarification alone is not its completion criterion. Establish enough context for the current judgment, not a complete history of everything. Preserve stated goals, hard constraints, and settled choices. Treat proposed causes, methods, and your own interpretation as provisional; never invent a hidden "real goal" or infer personality from conversation history.

## Choose the smallest useful scope

Apply a perspective check when the user is exploring an early project or decision and another reasonable perspective could materially change the judgment, route, success criterion, or assessment of benefits and costs. Signals include a solution before a clear need, an unsupported cause, a metric standing in for a goal, a restrictive binary, or a consequential viewpoint or constraint left out of the discussion. Clear background does not remove this need; vague wording alone does not establish it.

- **Settled execution or no meaningful perspective difference:** complete the requested task. Add at most a short material caveat when needed. Do not demand an interview or attach a next-step menu.
- **An early need or unresolved decision with a consequential perspective gap:** use the bounded first pass below, including when the goal and background are already clear.
- **A continuation already chosen by the user:** deepen only that scope. Read [references/deepen.md](references/deepen.md) if validation, comparison, simulation, or execution handoff needs structure. Do not load this reference during the first pass.

## 1. Understand the background and its internal logic

From the current message and relevant stated context, identify the desired outcome, binding rules or constraints, proposed cause or method, and the few relationships needed to understand the pending decision. Focus on the most consequential unknown. Do not turn these anchors into a questionnaire or demand a detailed prompt. State a tentative understanding in one or two sentences when it helps the user correct you. Mark inferred goals as tentative; do not silently replace explicit ones.

Before asking, identify the missing relationship or rule, two plausible answers, and what each would change. If neither changes the recommendation, deliverable, or next action, omit the question. Prefer concrete options with an "unsure / use assumptions" route. Use information already stated instead of asking again, and distinguish observations, user preferences, and proposed explanations.

Usually ask zero or one question. Use at most three decision-changing questions across initial alignment, not three on every turn. Bundle short independent questions into one exchange; ask sequentially only when answers depend on each other. Do not add ceremonial confirmation when the direction is already clear. Combine clarification with direction confirmation when needed.

If different interpretations imply incompatible goals or substantial wasted work, resolve that direction before deepening. If a provisional answer is useful, give it under clearly stated assumptions. "Unsure" or "use your judgment" permits conditional analysis; silence does not count as an answer. Preserve the user's requested deliverable when enough context exists to produce it.

## 2. Identify the core decision and check both sets of assumptions

Name the core issue or decision in the context you have established. Check the user's view and your own once: which assumption or priority carries the judgment, what important factor might it omit, what is the strongest reasonable alternative, and what evidence or priority would distinguish them? Do not stage a persona debate or recursively challenge every premise. Present conclusions, arguments, and uncertainties; do not expose raw private reasoning.

Start with the current perspective and usually one alternative; three total is a ceiling. Choose relevant dimensions or positions from this case rather than filling a universal checklist. A different cause, success criterion, affected party, or constraint can provide a useful perspective when it changes the decision. Check that the alternatives are not merely different implementations of the same unexamined premise. Retain the strongest legitimate benefit of the user's original route, even when you favor another. Evidence strength can be unequal; do not manufacture symmetry or opposition.

## 3. Compare support, tradeoffs, and conditional consequences

For each live perspective explain the practical change: **under this understanding or priority, we would choose this action or measure success this way**. Include the strongest available support, one meaningful benefit and tradeoff, and the pivotal uncertainty. Where responsibility or interests matter, say who gains and who bears the cost. Keep only differences that help this decision.

Briefly explain a conditional consequence when it makes the comparison understandable: if a pivotal assumption holds or fails, what changes next and why? This can support the argument without becoming a full simulation. Distinguish user observations, verified facts, inferences, and value choices. Hypothetical examples and simulations illustrate implications; their coherence is not evidence that they will occur.

## 4. Deliver A: grounded choices and a conditional recommendation

Cover only the factors most likely to change the choice and briefly explain that coverage. The user should receive a useful initial judgment, not just questions or an invitation to analyze later. A small table is helpful only when it makes the comparison easier.

Separate the comparison supported by available evidence from your recommendation based on stated priorities and assumptions. Give your conditional preference and reasons, including what evidence or priority would reverse it. If a factual unknown dominates, suggest the cheapest informative check. If the remaining difference is a value tradeoff, leave it to the user. Do not claim an objectively best choice independent of those priorities or promise certainty from an imagined "all-seeing" perspective.

Aim for one short screen: a working understanding and core decision, two useful perspectives when available, their material support and tradeoffs, a conditional lean, and one choice about continuation. The user should understand what the current view leaves out and why another route may still have value. Scale detail to the task and explicit user requests; do not fill a length quota.

## 5. Deepen B according to the user's choice

When further work would help, offer at most two or three concrete paths derived from A, such as checking a pivotal assumption, comparing two routes, or simulating a selected pilot. Include the option to stop, correct the framing, or name another path. A short combined choice suffices; avoid a large menu or repeated confirmation.

User selection authorizes analysis of that path within existing permissions. It is not authorization to publish, contact others, buy, or change unrelated settings. If the user already asked to continue within a stated scope, proceed without asking again. Reopen alignment only when new information materially changes that scope or invalidates a key premise.

Stop when the requested deliverable is ready, another angle would not change action, the remaining difference is a user value choice, or useful evidence must be obtained. Say what remains uncertain and the next informative action. Do not demand that every uncertainty be resolved.

## Effort boundaries

Use one initial perspective check, at most three initial questions and three live perspectives. Skip clarification when the relevant background is already sufficient. Deepen one chosen branch at a time. No automatic search, multi-agent council, exhaustive stakeholder list, or repeated self-debate solely to perform this workflow. Use sources/tools when pivotal facts require them or the selected task calls for them; follow applicable domain requirements.

These are behavioral effort controls, not a hard token limit. Actual reasoning and usage are controlled by the host/model. Respect an explicit user budget and stop at its boundary rather than claiming a guaranteed saving.

**Example:** "We need an app to improve shop revenue" separates revenue improvement from an app as the proposed means. If the bottleneck is unknown, ask one pivotal question or compare conditional cases. Explain how acquisition versus repeat purchase would change the first action. Preserve the app route's possible value; do not assume a different bottleneck is true. Offer a small check or a selected pilot before a full build plan.
