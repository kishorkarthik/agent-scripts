# Project Brief Workflow

Turn an informal idea into a well-reasoned, implementation-ready `project-brief.md` inside a chat environment (like Google AI Studio), or compare multiple ideas before committing engineering time.

---

## Core Rules

1. **One Question at a Time:** During discovery, ask **one focused question per turn**. Never dump a multi-part questionnaire.
2. **Proportional Depth:** Match rigor to project complexity. A small script gets a tight 1-page brief; anything handling sensitive data or complex state gets rigorous edge-case and safety contracts.
3. **Label Provenance:** Never silently invent requirements. Explicitly tag decisions as:
   - `[Confirmed]` — Stated or approved by the user.
   - `[Proposed]` — Suggested by the AI (pending approval).
   - `[Open]` — Unverified assumptions or technical claims needing validation.
4. **No Premature Stack Lock-In:** Don't commit to languages, frameworks, or databases during discovery unless driven by a hard user constraint.
5. **What & Why, Not How:** Define the problem, behavior, boundaries, and first milestone. Keep sprint tasks and step-by-step coding plans out of the brief.
6. **Self-Contained Output:** Always output the full `project-brief.md` inside a single Markdown code block so the user can easily copy-paste it into a fresh review thread or save it locally.

---

## Workflow Stages

### Stage 1 — Discovery
**Goal:** Understand the problem before proposing solutions.
1. Accept the user's raw idea. Do **not** draft a brief yet (unless asked to skip ahead).
2. Ask **one question at a time** to uncover:
   - The core pain point or trigger.
   - The target user and their current workaround.
   - What success looks like in practice.
   - Hard constraints (privacy, offline/local-only, budget, time, environment).
3. Summarize your understanding alongside initial **assumptions, unknowns, and risks** before moving to Stage 2.

### Stage 2 — Exploration & Scoping
**Goal:** Pressure-test the idea and trim v1 to its essence.
1. Propose 2–3 solution shapes—always including the simplest viable option (e.g., existing tool, thin script, or manual workflow) alongside fuller builds.
2. Challenge unnecessary complexity ("Do we actually need X in v1?").
3. Separate **Essential v1 Core** from **Explicit Non-Goals (Later)**.
4. Confirm whether to generate the brief (Stage 3), pivot, or drop the idea.

### Stage 3 — Brief Generation
**Goal:** Output a crisp, accurate `project-brief.md` in a single Markdown code block. Include only sections relevant to the project:
- **Header:** `Status` (`Exploring | Draft | In Review | Prototyping | Ready | Deferred | Abandoned`) and `Last Updated` (`YYYY-MM-DD`).
- **Problem & Core Value:** The pain point, why current workarounds fail, and why this is better.
- **Users & Core Behavior:** Primary workflow(s), UX/CLI contract, and expected outputs.
- **Scope:** Essential v1 vs. Explicit Non-Goals.
- **Technical Direction:** Key components, data/state boundaries, and security/privacy posture (`[Confirmed]` vs. `[Proposed]`).
- **Risks & Unknowns:** Unverified assumptions (`[Open]`) and required prototypes.
- **Milestone 1:** The smallest end-to-end slice that validates the core risk or delivers value.

### Stage 4 — Critical Review
**Goal:** Stress-test `project-brief.md` as an adversarial engineering reviewer (in the same chat or a fresh context window).
1. Inspect the brief across five lenses:
   - **Contradictions:** Do scope, behavior, and non-goals conflict?
   - **Unverified Claims:** Are unvalidated API, OS, or LLM behaviors treated as guaranteed?
   - **Failure Modes:** What happens on bad input, partial failure, offline state, or security boundaries?
   - **Scope Creep:** Are v2 features disguised as v1 must-haves?
   - **Provenance:** Are AI suggestions accidentally written as `[Confirmed]`?
2. Output prioritized findings: **Critical** (must resolve/prototype first), **Important** (gaps/ambiguities), and **Trade-offs** (needs user decision).

### Stage 5 — Revision Loop
**Goal:** Converge on a coherent brief (`Draft → Review → Revise`).
1. Incorporate review critiques (from Stage 4 or pasted by the user).
2. Fix unambiguous technical flaws directly while preserving `[Confirmed]` decisions.
3. Surface genuine product/UX trade-offs for user approval (one at a time interactively, or as a short numbered list for batch critiques).
4. Output the **complete updated `project-brief.md`** (never just a diff), tagging unresolved technical uncertainties as `[PROTOTYPE REQUIRED]`, followed by a brief summary of changes.

### Optional: Multi-Project Comparison
When given 2+ candidate briefs to choose between:
1. Compare them qualitatively across **Personal Usefulness**, **Problem Pain**, **Technical Risk**, **Learning Value**, and **Effort to v1**.
2. Recommend one clear front-runner (or a small validation spike) and explain the trade-offs against the runner-up.

### Stage 6 — Decision & Handoff
**Goal:** Make an explicit commitment before writing implementation plans.
1. Choose an outcome and update `Status` in the brief:
   - **Proceed (`Ready`):** All critical assumptions resolved, non-goals clear, and Milestone 1 concrete. Hand off the brief as the source of truth for implementation.
   - **Spike First (`Prototyping`):** Define the exact 1–2 technical questions to answer and stop criteria before committing to v1.
   - **Re-Scope (`Draft`):** Note what feels oversized and return to Stage 2.
   - **Stop (`Deferred` / `Abandoned`):** Add a 2-line note explaining why so the reasoning isn't lost.
