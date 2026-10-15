# Before and after: editing samples

Three examples of how I turn confusing text into clear text, with a note on every
change I make and why.

> **Sample document.** The "before" text in each example is something I wrote on
> purpose to show common problems in technical writing. It is not taken from any
> real product or person's work. StayEasy Manager and the StayEasy Booking API are
> fictional products. In real work, I confirm every fact with a subject matter
> expert before I publish.

## How I edit

I ask the same questions every time:

1. **Who is reading, and what are they trying to do?** The text should help them do it.
2. **Can they act on every sentence?** Steps tell the reader what to do, one action at a time.
3. **Is anything missing or hidden?** Requirements and limits come *before* the step where they matter.
4. **Are the words plain and consistent?** One name for each thing, and everyday words.
5. **Does the text say what happens next?** The reader should know when a step has worked.

## Example 1: a procedure

### Before (95 words)

> The booking export function can be accessed by users who have been granted the Reports permission. The Reports menu should be opened and the Bookings report selected. A date range needs to be chosen, and it should be noted that exports of more than 10,000 rows are not supported and will fail. Clicking the Export button causes a file to be generated. When the file has been generated a notification will be displayed and the file can then be downloaded. If the Export button is greyed out, the permission may not have been granted.

### What is wrong

- **It is one block of text.** The reader cannot tell the steps apart or follow along while using the product.
- **The steps are mixed with warnings.** The date range and the Export button sit in the middle of a paragraph, next to a limit and a tip.
- **The most important limit is buried.** "More than 10,000 rows ... will fail" appears after the reader has already started, so they find out too late.
- **Passive voice hides who does what.** "Should be opened" and "needs to be chosen" do not say who acts.
- **The troubleshooting tip points the wrong way.** It says the permission "may not have been granted". It never says what the reader should do.

### After (74 words)

> **Export bookings**
>
> Use this procedure to download a list of bookings.
>
> **Before you begin**
>
> You need the **Reports** permission. If the **Export** button is greyed out, you do not have it. Ask your administrator to give you access. An export can contain up to 10,000 rows. If you have more bookings than that, choose a shorter date range.
>
> **Steps**
>
> 1. Select **Reports > Bookings**.
> 2. Set the date range.
> 3. Select **Export**. StayEasy Manager creates the file.
> 4. When the notification appears, select **Download**.

### What I changed

| Change | Why |
| --- | --- |
| Added a title and a one-sentence purpose | The reader knows straight away that they are in the right place |
| Moved the permission and the 10,000-row limit into **Before you begin** | Requirements come before the step where they matter, so nobody fails halfway |
| Turned the paragraph into four numbered steps | One action per step makes the order clear |
| Started each step with a verb ("Select", "Set") | Steps are commands, so the reader knows what to do |
| Used active voice and "you" | The text says who acts, and speaks directly to the reader |
| Bolded the names of buttons and menus | Readers can find them on the screen at a glance |
| Replaced "may not have been granted" with "ask your administrator" | The reader gets a next action, and not only a possible cause |
| Kept the facts the same, with one addition | The only new information is "Ask your administrator". In real work, I would confirm with the subject matter expert who gives out permissions |

## Example 2: a dense paragraph

### Before (56 words, one sentence)

> In order to facilitate the utilisation of the idempotency functionality, API consumers are advised to leverage the Idempotency-Key header such that, in the event that a request is retried subsequent to a network failure, duplicate bookings will not be created as a result of the retried request being processed by the server for a second time.

### What is wrong

- **It is one very long sentence.** The reader has to hold five ideas in mind before reaching the point.
- **Heavy words hide the meaning.** "Facilitate the utilisation of", "leverage", "subsequent to" and "in the event that" all have simpler forms.
- **It names the feature, not the benefit.** "Idempotency functionality" means little to a reader who has not met the word.
- **The action is hidden.** The reader has to work out what to do from the middle of the sentence.

### After (51 words, three sentences)

> To avoid duplicate bookings when you retry a request, send an `Idempotency-Key` header with a unique value, such as a UUID. If a network error stops you from seeing the response, send the request again with the same key. The API returns the original booking instead of creating a second one.

### What I changed

| Change | Why |
| --- | --- |
| Started with the goal: "To avoid duplicate bookings..." | The reader sees the benefit before the instruction |
| Split one sentence into three | Each sentence has one idea |
| Replaced "utilisation", "leverage", "subsequent to" and "in the event that" with "send", "when" and "if" | Plain words are quicker to read and easier for non-native English speakers and translation tools |
| Dropped the word "idempotency" from the instruction | The feature name stays in the header name, where it is needed. The explanation does not depend on it |
| Wrote what to do in order: send the header, then resend with the same key | The sentences match the order the reader acts in |
| Added what the API does: "returns the original booking" | The reader knows what result to expect |

## Example 3: an error message

### Before (6 words)

> Error 4012: Invalid input in field.

### After (14 words)

> Check-out date must be after check-in date. Change the check-out date and try again.

### What I changed

| Change | Why |
| --- | --- |
| Removed the code from the front | Codes help support teams, but the reader needs the problem first. A code can go at the end if it is useful |
| Named the problem: the check-out date | "Invalid input in field" does not say which field |
| Said what is wrong: it must be after the check-in date | The reader learns the rule, not only that they broke it |
| Told the reader what to do next | "Change the check-out date and try again" is the fix |
| Did not apologise or blame the user | Error messages should be calm and specific |

## Results at a glance

| Example | Words before | Words after | Main improvement |
| --- | --- | --- | --- |
| 1. Procedure | 95 | 74 | Steps the reader can follow in order, with the limit up front |
| 2. Paragraph | 56 | 51 | One idea per sentence, in plain words |
| 3. Error message | 6 | 14 | Says what is wrong and how to fix it |

Shorter is not always the goal. The error message got longer, from 6 to 14 words,
because the reader needed to know the problem and the fix. The goal is that the
reader can do the task the first time.

## My editing checklist

- [ ] The title says what the reader will do or learn.
- [ ] Requirements and warnings come before the step they affect.
- [ ] Each step has one action and starts with a verb.
- [ ] Interface labels are bold and match the screen exactly.
- [ ] Sentences are short, and the active voice is the default.
- [ ] I used one name for each thing, all the way through.
- [ ] The reader knows what result to expect.
- [ ] Every fact was checked with a subject matter expert or the product itself.
