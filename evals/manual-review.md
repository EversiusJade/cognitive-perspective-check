# Manual review — cognitive-perspective-check

Historical review of the pre-v0.2 version. For the current candidate's executed installation checks and independent execution samples, see [validation.md](validation.md). The rule-coverage table below remains an author review, not measured behavioral results.

This is an author rule-coverage review, not an independent model benchmark or a measured run of six separate model responses. “Covered” means the written instructions explicitly address the expected behavior. Independent baseline/with-skill runs and trigger-rate measurements remain future validation work.

## Observed baseline failure

During the design conversation, repeated one-question-per-turn elicitation made the user feel the design was never ending. The skill now caps initial clarification at three questions, usually zero or one, and asks only for decision-changing information. This is an observed interaction failure, not a controlled experiment.

## Scenario review

| Scenario | Expected behavior | Rule coverage |
|---|---|---|
| Vague request to build an app for local-shop revenue | Separate outcome from proposed means; ask only which business bottleneck matters, or offer bounded comparison | Pass: the example asks one high-value question and does not jump to features. |
| Simple unit conversion | Answer directly without frame analysis | Pass: explicit non-trigger rule covers it. |
| Team misses deadlines; leadership proposes daily meetings despite meeting overload | Extract objective, constraint, and proposal; compare materially different paths; confirm direction if interpretations alter the work | Pass: workflow supports context extraction and direction alignment. |
| Newsletter open rate fell “because subject lines are boring” | Treat cause as a hypothesis; still help with requested rewrite; mention other plausible causes only if consequential | Pass: goal/means distinction and direct-answer boundary allow both. |
| Assistant initially assumes a paid course is right because people ask questions | Test assistant's own frame; distinguish interest from willingness to pay; suggest low-cost validation if it can change the recommendation | Pass: self-audit and factual-check rules cover this. |
| User selects a pilot simulation after A | Continue only on chosen B path and state scope | Pass: A/B handoff explicitly prevents automatic expansion into every branch. |

## Remaining limitations

- The review was performed by the skill author and is vulnerable to self-confirmation.
- No independent baseline run was performed, so improvement over an unassisted model is not measured.
- Trigger reliability varies by host platform; the skill description cannot guarantee activation.
- The initial question cap and output compactness should be checked with real users after publication.
