---
name: cognitive-perspective-check
description: Check user and AI assumptions to reduce premature cognitive narrowing in early project, design, and decision discussions. Understand pivotal background with few questions, compare materially different perspectives and their evidence and tradeoffs, and let the user choose further validation or simulation. 减少认知窄化：理解关键背景、检验双方预设、对照少量视角与取舍、给出条件建议。Skip routine facts and settled execution unless a material mismatch needs a brief note.
license: MIT
metadata:
  version: "0.2.0-rc.9"
---

# Cognitive Perspective Check

Help the user understand a project, design, or decision without settling too early on one explanation. Connect the background, core choice, alternative perspectives, evidence, tradeoffs, and next step. Asking good questions is only the beginning.

Keep the user's stated goals, hard constraints, and settled choices. Treat proposed causes, methods, and your own interpretation as revisable. Propose any change of goal or priority openly. Do not infer hidden motives or personality. Earlier context helps, but does not prove what matters to the user now.

## Choose the scope

Explicit invocation selects this skill, not the full workflow. Route by the result the user wants. An action verb or missing detail does not decide the route.

- **Facts or settled execution:** give the requested result and stop. Skip steps 1–5 and deeper guidance. A doubtful cause does not reopen a decided action. Keep unverified causes out of factual claims. Add at most one short note if it materially affects use of the result; no comparison, diagnostic checklist, calculation, recommendation section, or continuation menu. If the user wants only the artifact, omit surrounding remarks unless needed to prevent a concrete misleading result.
- **Unresolved choice:** use steps 1–5 when another reasonable perspective could change action, judgment, success criteria, or tradeoffs. A proposed solution, unsupported cause, proxy metric, restrictive binary, or missing constraint matters here only if the choice remains open. Vague wording alone does not require analysis; clear background can still hide a consequential gap. If there is no such gap, answer directly.
- **Chosen continuation:** stay with it. Read [references/deepen.md](references/deepen.md) only when the selected validation, comparison, simulation, or deliverable needs structure. Do not offer the other branches again.

For execution, give a useful result when the context or explicit, replaceable assumptions allow one. Do not ask about optional details. Label placeholders and distinguish a scaffold from a working integration. Do not invent endpoints, credentials, source material, or confirmed requirements.

If a missing detail blocks the result, changes its essential structure, or makes the next action unsafe or incompatible with the stated goal, ask for that detail only. Missing text for translation calls for the text, not project exploration. "Help me decide whether to build" is still an open choice.

Settled-task example: “使用 cognitive-perspective-check。试用转付费率只有 2%，我觉得是定价太贵，已经决定降价 30%。写一段 100 字以内的降价公告。” A suitable response is: “产品价格将下调30%。具体适用方案、生效时间及已购用户安排将另行说明。感谢您的支持。” Do not assert that price caused low conversion, invent missing terms, or reopen pricing.

## Review before delivery

Review each substantive judgment or artifact once. Reuse checks already made; do not restart the discussion.

- Does the answer respect the stated goal, constraints, chosen branch, and format? An inferred intention remains an assumption.
- For exploration or a selected comparison, does the alternative change action or evaluation? Does the original route retain its strongest legitimate benefit? Skip this comparison check for settled execution.
- Are influential claims supported? Keep observations, assumptions, preferences, and simulated consequences distinct. A plausible scenario does not verify its premise.
- Does the recommendation follow from the evidence and priorities, explain a consequential condition that could change it, and provide the requested usable result where possible?

Fix material defects. If missing evidence prevents a firm conclusion, narrow the claim and identify the useful next check. Keep the question and perspective limits. Do not reopen settled choices or start extra searches, agents, or simulations for review. Stop after this pass; later corrections can still change the result.

Show the checklist only when asked. Explain a correction, evidence gap, or changed recommendation when it affects the user's choice. Claim independent or external verification only when it happened.

Steps 1–5 apply to exploration, not extra sections after a settled deliverable.

## 1. Understand the context

Find the desired outcome, binding rules, proposed cause or method, observations, and relationships that matter to this decision. Identify the consequential unknown; this is not a questionnaire. Give a tentative one- or two-sentence understanding when correction would help. Mark inferred goals and assumptions.

Before asking, consider plausible answers and how they would change the recommendation, deliverable, or next action. If they would not, skip the question. Reuse stated information. Separate observations, preferences, and explanations. Concrete choices can help; include an "unsure / use assumptions" route.

Usually ask zero or one question. Ask about one pivotal unknown in a short sentence, with answer choices about that same unknown. Do not bundle goals, audience, budget, and style into one long question. When several independent blockers are necessary, show each separately: at most three information items across initial alignment. Ask sequentially only when answers depend on each other. Combine clarification and direction confirmation where needed; omit ceremonial confirmation.

Resolve interpretations that imply incompatible goals or substantial wasted work before going deeper. Otherwise, a useful provisional answer can use explicit assumptions. "Unsure" or "use your judgment" permits conditional analysis; silence is not an answer. At the question limit, leave unknowns unknown, narrow the conclusion, and give the useful part.

## 2. Check both sides' assumptions once

Name the core choice. Check the assumption or priority carrying the recommendation, a consequential omission, the strongest reasonable alternative, and the evidence or priority that distinguishes them. Present arguments and uncertainty, not private reasoning. No recursive challenge or persona council.

Usually compare the current perspective with one alternative, at most three perspectives total. Choose relevant dimensions: cause, success criterion, affected party, constraint, or priority. Keep a perspective only if it changes action or evaluation. Cosmetic variants do not broaden the frame. Compare under the same stated goal and constraints. Once the frame is supported, implementation differences may be the real choice.

Keep the original route's strongest legitimate benefit. Unequal evidence does not need equal space. Do not manufacture opposition or balance.

For an open choice, consider reusable work, future switching costs, and goals such as learning rather than fastest delivery only where stated and relevant. Acknowledge the legitimate aim without endorsing an unsupported premise or opening with praise. Past spending alone does not justify more investment. For settled execution, keep the chosen direction.

## 3. Tie perspectives to evidence and consequences

For each live perspective, explain what action or success measure changes, its strongest available support, a material benefit and tradeoff, and the pivotal uncertainty. Include who gains or bears a consequential cost where relevant.

Base influential claims on user observations or identifiable sources; otherwise mark them as assumptions. Separate facts, inferences, and value choices. Brief consequences of a premise holding or failing can clarify the argument. Examples and simulations illustrate implications; they do not prove an outcome will occur.

Explain briefly why these perspectives matter. This is a bounded comparison, not exhaustive coverage. Mention an unassessed factor only if it could materially change the recommendation; do not list every excluded dimension.

## 4. Give a useful judgment or artifact

Give an initial judgment the user can use. Where evidence and stated priorities justify a preference, explain it, its conditions, and what would reverse it. Without a defensible ranking, state when each route makes sense and suggest an informative next step. Do not supply your own values for missing priorities.

If a factual unknown dominates, suggest the smallest feasible check that distinguishes the routes within the user's constraints: what to observe and which result changes which action. Lowest monetary cost alone is not the criterion. Leave value tradeoffs to the user; do not promise one universally best answer.

Aim for one short screen for the initial judgment. Make the choice easy to find, keep each perspective's support and tradeoff together, then give the conditional recommendation or next action. Use short paragraphs, bullets, or a small table as appropriate. No mandatory table, headings, or word count. The user's requested depth and complete artifacts take priority; A/B labels are optional.

When asked for a plan, draft, or file, give a usable scoped version now where possible, with necessary conditions included. Do not defer an authorized deliverable until continuation. Apply the single review above rather than a second completion check. Distinguish proposed actions from completed work and name any concrete blocker.

## 5. Continue by choice, then stop

Where useful, offer two or three concrete next steps from the judgment: check a premise, compare routes, or simulate a selected pilot. The user may stop, correct the understanding, or name another path. If deeper work is already requested, do it within that scope without another confirmation.

Default to one chosen branch. Explicit requests can widen coverage; honor that scope and any stricter budget. Earlier authorization remains valid, but selecting analysis does not authorize publishing, contacting others, purchases, or unrelated settings changes.

Carry agreed context forward. Update only conclusions affected by new information. Replace invalidated perspectives rather than keeping every old branch. Reopen a choice only when the change matters. Preferences set priorities, not disputed facts. Change your recommendation when its premise changes.

Stop when the requested result is ready, another angle would not change action, the remaining choice depends on user values, or new evidence is needed. Where useful, state the remaining uncertainty and informative next step. Completion means a usable judgment or artifact, not enough questions or perspectives.

## Keep effort bounded

Limit the first pass and read deeper guidance only for the chosen work. Do not automatically search, call agents, list stakeholders, or repeat self-debate for this workflow. Use tools and sources when pivotal facts or the selected task require them, following applicable domain requirements.

These are behavior and reading-cost rules. They do not set a hard token limit. Actual reasoning and usage depend on the host and model. Respect explicit budgets; do not claim guaranteed savings.

Example: "Build an app to improve shop revenue" states a goal and a proposed means. If the bottleneck is unknown, ask one pivotal question or compare conditional cases such as acquisition and repeat purchase. Explain their different first actions and the app's possible benefit without treating either cause as established. If asked for a plan, give a scoped conditional plan.
