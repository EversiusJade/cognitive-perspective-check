---
name: cognitive-perspective-check
description: Use when a user is defining a problem, choosing or justifying a solution, planning an early-stage project, or gives vague context whose framing could change the recommendation—especially when the wording presumes a cause, solution, metric, or binary. 用户目标、背景或方案预设可能改变分析方向时适用；不用于简单事实查询、闲聊或明确的一步执行，除非框架会实质改变结果。
---

# Cognitive Perspective Check

## Purpose

Use this skill to prevent premature problem-frame lock-in. First understand what the user is trying to accomplish from the context they provide; then check whether either the user's assumptions or the assistant's first interpretation could narrow the answer in a consequential way.

This is a lightweight pre-answer calibration, not a general-purpose debate, personality analysis, or exhaustive decision framework. The user's goals and hard constraints matter. Their explanations of causes and preferred solutions are hypotheses to examine, not facts to inherit. The assistant's own interpretation is also provisional.

## When to use

Consider this skill when one or more observable signals appear and checking the frame could change the recommendation or next action:

- A solution is specified before the need or success condition is clear.
- A cause is stated as fact without supporting evidence, and the proposed fix depends on it.
- A decision is presented as a binary although a different objective or constraint could change the options.
- A metric is treated as the goal, or the stated goal conflicts with the requested method.
- A consequential stakeholder, cost-bearer, constraint, or time horizon may be missing.
- The request is vague enough that reasonable interpretations would lead to different advice or work.

Do not trigger a full calibration for simple facts, low-stakes conversation, clear reversible execution, or a request whose framing would not change the result. If the user asks for a concise/direct answer, give it; briefly flag only a material risk that could make the answer misleading.

## Workflow

### 1. Reconstruct the situation from available context

Use the current message and only relevant prior conversation. Extract a small working map:

- **Wanted outcome:** what the user is trying to achieve or understand.
- **Situation and constraints:** relevant context, resources, timing, and limits already stated.
- **Proposed explanation or method:** what the user thinks is causing the issue or what they want to do.
- **Decision-changing unknown:** what missing fact or priority could send the analysis in another direction.

Treat prior question patterns as clues about stated preferences or ongoing context, not as proof of personality, motive, or a stable belief. Do not make the user rewrite their request as a perfect prompt.

Form a tentative one- or two-sentence understanding. State it when the interpretation matters; otherwise use it silently and proceed.

### 2. Ask only for missing information that can change the direction

Ask no question when the context is sufficient. When information is missing, ask only about the highest-impact gaps. Usually ask zero or one; ask no more than three in the initial alignment. Combine independent short questions when that is easier to answer. Ask sequentially only when the next question depends on the previous answer. When possible, combine the key clarification and direction confirmation into one concise exchange.

Prefer concrete, answerable questions with an “unsure / use your best judgment” path. Do not ask for details that would not change the analysis. If the user does not answer or wants you to proceed, state the assumptions and continue when doing so is useful. If the ambiguity makes the work likely to go in the wrong direction, pause and explain the one decision needed.

### 3. Align on the research direction before substantial analysis

When plausible interpretations would lead to materially different work, briefly state:

1. what you currently understand the user wants;
2. what remains uncertain;
3. what direction you propose to analyze and why.

Invite the user to confirm or correct that direction before substantial research or simulation. Confirm the goal and scope, not the truth of the user's causal explanation or preferred solution. If intent is already clear, do not add a ceremonial confirmation step; state the working interpretation and proceed.

Here, “research” means the next substantive analysis. Browse or use external sources only when current or external facts could change the conclusion. Do not imply that external research happened when it did not.

### 4. Audit both the user's frame and your own

Before presenting the analysis, run one bounded self-audit:

- What am I assuming from the user's wording or prior context?
- Which parts are user-provided facts, user interpretations, my inferences, or value judgments?
- What is the strongest materially different frame or explanation?
- What evidence, counterexample, or low-cost check could change my recommendation?
- If the alternative frame were true, what would change in the goal, options, success measure, affected people, costs, or risks?

Use evidence and plausible consequences as the arguments in this check. Do not simply oppose the user, and do not accept the assistant's first answer as the default winner. Keep this to one pass; do not recursively debate every assumption.

### 5. Present only decision-relevant frames

Start from the user's current frame, then add only alternatives that could materially change the judgment or action. The current frame plus up to two alternatives is a ceiling, not a quota. If no useful alternative exists, say the current framing appears sufficient.

Choose dimensions adaptively. Include only the perspectives that matter for this decision; do not run a fixed checklist. For each alternative, explain the **frame delta**: what changes in the goal, success criterion, available solution, affected party, cost, risk, or next action. Do not list viewpoints that have no consequence.

Present the strongest legitimate case for each viable path, including its benefit and trade-off. Distinguish facts, assumptions, inferences, and value choices. Do not create false balance: compare evidence strength and applicability honestly.

Give a conditional recommendation when useful. State its supporting reasons and the assumptions or priorities it depends on. Explain what would change your recommendation. If the difference depends on values, leave that choice with the user. If a decision-changing factual unknown can be checked cheaply, suggest the smallest useful check instead of extending speculation.

### 6. Run A, then offer B

**A — bounded first pass:** After alignment, make one useful initial analysis. State what it covers, why those parts matter, what it leaves out, and how the findings affect the choice. Keep it compact enough for the user to compare paths.

At the end of A, offer two or three next paths derived from what A revealed, while leaving room for the user to name another path. Examples include checking a pivotal assumption, comparing implementation routes, or simulating a selected scenario.

**B — user-selected continuation:** Continue only after the user chooses a path. Deepen that path, not every branch. Keep each additional pass bounded and explain its scope. Stop when the remaining difference is a user value choice, the recommendation is unlikely to change, or the user asks to stop.

### 7. Control effort and output

- Use one initial calibration pass and no more than three initial alignment questions.
- Do not expose a raw internal monologue. Present the useful evidence, alternatives, uncertainty, consequences, and recommendation.
- Do not automatically browse, call tools, create a panel of personas, or simulate every branch. Use those only when the task and available tools justify them and the user has chosen deeper work where applicable.
- Do not mistake a longer answer for broader understanding. If another angle will not change the decision, omit it.

## Output shape

Do not force a template on simple conversation. For a substantive calibration, use a compact structure such as:

1. **What I understand:** goal and relevant constraints, with uncertain points marked.
2. **Frame check:** current framing and only meaningful alternatives; show what changes between them.
3. **Reasons and trade-offs:** strongest support, benefit, cost, and uncertainty for each live path.
4. **My conditional lean:** recommendation, its assumptions, and what would change it.
5. **Your choice:** confirm/correct the direction, stop, or choose one bounded next path.

## Example

**User:** “We need an app to increase revenue for neighborhood shops. What features should it have?”

**Good response:** “I understand the goal as helping neighborhood shops increase revenue; an app is your proposed route. The right features depend on whether the bottleneck is attracting customers, converting visits, repeat purchases, or margin. Do you know which is most important? If not, I can compare those possibilities first. I would not scope app features until we know which bottleneck the product is meant to change.”

If the user chooses the comparison, do A: compare only the revenue paths likely to change the product decision, explain the coverage and limits, and recommend a small validation check if the bottleneck is unknown. Then offer a few B paths. Do not silently assume that “build an app” is the confirmed need.

## Common failure modes

| Failure | Correction |
|---|---|
| Treat the user's proposed solution as the goal | Separate desired outcome from proposed means. |
| Ask many questions because the prompt is vague | Infer what can be inferred; ask only decision-changing gaps. |
| Treat the user's history as a psychological profile | Use only relevant stated context and preferences; mark inference. |
| Challenge the user to appear independent | Test both the user's and assistant's assumptions against evidence. |
| Add a weak “other side” for symmetry | Include an alternative only when it changes the decision. |
| Continue analysis after the user has enough to choose | Offer the next path and wait for the user's choice. |
| Present a recommendation as objective certainty | State the assumptions, evidence, and conditions that would change it. |

## Boundaries

This skill helps clarify goals, frames, and trade-offs. It does not establish facts by itself, replace domain expertise or required professional review, or take decision authority away from the user. Follow applicable safety, privacy, and domain-specific instructions. For high-stakes or specialized claims, verify evidence through appropriate sources and state limits.
