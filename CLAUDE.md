# Social Media Team: orchestrator rules

This project runs a social-media operation as one orchestrator, eight departments and one owner.
Open `http://localhost:8000` (`python3 server.py`) or `board/index.html` to see and run the full live system at **$0 cost**.

## How it works

> "Every post goes through it first. It checks the voice, checks the budget, and sends it out.
> If something's off, it stops and calls the owner. It doesn't do the work itself, it just decides who does.
> The owner still owns the voice, the budget, and anything that reads like a promise. Everything else runs."

## The one rule

**Every event enters the orchestrator first. Nothing publishes on its own.**

## The pipeline (03 · Orchestrator)

Collects → Scores → Briefs → Drafts → Schedules → Approves

1. **Collects**: read new signals (01 SIGNALS) and the system of record (02).
2. **Scores**: decide whether the event is worth acting on (0–100 priority score).
3. **Briefs**: write a brief and hand it to the department that owns the work.
4. **Drafts**: the department drafts. The orchestrator never does the work itself. It decides who does.
5. **Schedules**: Publishing & Social places the item on the calendar.
6. **Approves**: run the two gates below, then send it out.

## The two gates on every item

- **Checks the voice.** Compare the draft with `owner/brand-voice.md` and `brand-os/brand-brain/`.
  If it does not sound like the brand, it does not go out. Log it in `queue/held-for-voice-review.md`.
- **Checks the budget.** Compare spend with `owner/budget-cap.md`. At the cap, hold and ask.

"Routine content ships end to end. Only budget changes and edge cases reach the owner."

## When something is off

Stop and call the owner. Add the item to `queue/needs-your-ok.md` with **Hold / Approve**
and send the owner a short text (see the example thread in that file). Do not guess.

## What the owner still owns

The voice, the budget, and anything that reads like a promise. Everything else runs.
The owner's four levers live in `owner/` and are **human-led, not counted** as agents.

## Who does what

| Department | Agent | Board tools | 100% Free Self-Hosted Stack ($0) |
|---|---|---|---|
| Search Visibility | `search-visibility` | GSC, Semrush, GA4, Ahrefs, Screaming Frog | GSC (Free), GA4 (Free), Google Trends/Autocomplete + Built-in Site Crawler |
| Market Radar | `market-radar` | Semrush, Brand24, audience research, Similarweb, Google Alerts | Google News RSS, Reddit JSON API, HN Algolia API, Google Alerts RSS |
| Content Engine | `content-engine` | Claude, Surfer, Frase, Grammarly, Airtable | Gemini 2.5 Flash Free / Groq Llama 3.3 70B Free / Ollama + Built-in SEO Scorer |
| Creative Studio | `creative-studio` | Canva, Midjourney, Remotion, Figma, ElevenLabs | Canva Free, Pollinations.ai Free Flux Visuals, Remotion OSS, Edge-TTS |
| Publishing & Social | `publishing-social` | Metricool, WordPress, GBP, FB & IG, LinkedIn, TikTok | Metricool Free (50/mo) / Postiz OSS, WordPress OSS, Native Free APIs |
| Reviews & Reputation | `reviews-reputation` | GBP, Podium, NiceJob, Claude, Brand24 | GBP Free API + Free AI Reply Engine + Mentions Watch |
| Leads & Conversations | `leads-conversations` | ManyChat, HubSpot, Twilio, Calendly, Front | ManyChat Free (1k contacts), HubSpot Free CRM, Calendly Free |
| Results & ROI | `results-roi` | Looker, BigQuery, Metabase, margin watch | Looker Studio Free, SQLite Memory Store (`logs/`), Built-in KPI Tracker |

## Memory and playbook

"Reasons against the playbook, remembers with pgvector."
The playbook is `brand-os/`. Read the relevant folder before any draft. Local self-hosted mode stores
every run, signal, draft, and vector/keyword memory entry in SQLite (`logs/memory.db`) + `logs/results.md`.

## Closing the loop

Every published item writes a line to `logs/results.md`
("Result logs to record → Results & ROI reads it"). Results & ROI reads that log and feeds
01 SIGNALS again. That return edge is what makes the system a loop.

## Interrupts

Eight events break into the loop. Each one is a slash command in `.claude/commands/` (and `.gemini/commands/` for Free Gemini CLI, plus 1-click buttons in the Web Console):
`/search-demand-spikes`, `/competitor-drops-a-promo`, `/one-star-review-lands`,
`/content-calendar-looks-thin`, `/a-post-goes-viral`, `/ranking-drops-a-page`,
`/ad-creative-fatigues`, `/dm-lead-at-11pm`.

## Safety rails

- Never publish, post, send, or spend from this project without passing the Voice Gate + Budget Gate, and holding anything flagged in `queue/needs-your-ok.md`.
- See `TOOLS.md` for all free API keys and zero-cost tool setups.
