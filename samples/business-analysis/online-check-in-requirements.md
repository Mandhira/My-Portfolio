# Business requirements: online check-in for StayEasy Manager

**Document:** BRD-014, version 0.3 (draft for review)
**Prepared by:** Mandhira Nayagi, business analyst
**Date:** 14 October 2026
**Status:** Waiting for review by the Operations and Finance leads

> **Sample document.** StayEasy Manager is a fictional product. The company,
> people, figures and dates in this document are examples that I created to show
> how I write business requirements. They are not from a real project.

## 1. Summary

Guests at StayEasy properties queue at the front desk to check in. Each check-in
takes about 6 minutes, and front-desk staff re-type the details that the guest
already gave when booking. This document describes an online check-in feature that
lets a guest confirm their details before arrival, so that the front desk only
needs to hand over the key.

## 2. Business problem and goal

| Item | Detail |
| --- | --- |
| Problem | Check-in takes about 6 minutes per guest. Between 3 pm and 6 pm, guests wait up to 25 minutes. |
| Cause | Staff re-enter guest details, check identity documents and collect the signed registration form on paper. |
| Goal | Reduce the average front-desk check-in time to **2 minutes or less** within three months of launch. |
| Success measures | Average check-in time. Share of guests who complete online check-in (target: 50%). Number of data-entry corrections made by staff. |

The figures above are working estimates from a one-week staff timing exercise. They
need to be confirmed before approval (see open question Q1).

## 3. Scope

| In scope | Out of scope |
| --- | --- |
| A check-in link in the booking confirmation email and reminder | Digital room keys |
| Guest confirms contact details and arrival time | Payment of the room balance |
| Guest uploads an identity document and signs the registration form | Group bookings of more than 5 rooms |
| Staff see each guest's check-in status in the bookings list | Changes to the booking or cancellation process |
| Staff review and approve the identity document | Languages other than English (planned for a later release) |

## 4. Stakeholders

| Stakeholder | Interest | Involvement |
| --- | --- | --- |
| Guest | Faster arrival and less paperwork | Informed through user testing |
| Front-desk agent | Less typing and fewer queues | Reviewer, tester |
| Property manager | Shorter queues, fewer complaints | Approver for process change |
| Operations lead | Staff time, training | Approver |
| Finance lead | Storage cost, data-protection risk | Reviewer |
| Development team | Effort and technical constraints | Consulted on feasibility |

## 5. Current process and future process

| Step | Today | With online check-in |
| --- | --- | --- |
| 1 | Guest arrives and joins the queue | Guest receives a link 48 hours before arrival |
| 2 | Agent finds the booking and checks the guest's details | Guest confirms details, uploads identity document and signs online |
| 3 | Agent types in any missing details and scans the document | Agent sees status **Ready** in the bookings list |
| 4 | Guest signs the paper registration form | Agent checks the guest's face against the uploaded document and approves |
| 5 | Agent hands over the key | Agent hands over the key |

If the guest does not complete online check-in, the current process applies. No guest
is turned away because they did not use the online option.

## 6. Requirements

Priority uses MoSCoW: **M**ust, **S**hould, **C**ould.

### Functional requirements

| ID | Requirement | Priority | Source |
| --- | --- | --- | --- |
| FR-01 | The system sends a check-in link to the guest's email address 48 hours before the check-in date. | M | Operations lead |
| FR-02 | The guest can confirm or correct their name, phone number and expected arrival time. | M | Front-desk agents |
| FR-03 | The guest can upload one identity document as a JPG, PNG or PDF file of up to 5 MB. | M | Operations lead |
| FR-04 | The guest can sign the registration form on screen. | M | Property manager |
| FR-05 | The bookings list shows a check-in status for every booking: **Not started**, **Submitted**, **Ready** or **Needs attention**. | M | Front-desk agents |
| FR-06 | An agent can approve a submitted check-in, or reject it with a reason that is sent to the guest. | M | Operations lead |
| FR-07 | The link stops working after the guest's check-out date. | M | Finance lead |
| FR-08 | The system sends one reminder 24 hours before arrival to guests who have not started. | S | Property manager |
| FR-09 | The guest can come back and finish check-in later without losing what they entered. | S | Front-desk agents |
| FR-10 | The dashboard shows the share of guests who completed online check-in each day. | C | Property manager |

### Non-functional requirements

| ID | Requirement | Priority |
| --- | --- | --- |
| NFR-01 | The check-in pages work on current mobile and desktop browsers, and are usable at a screen width of 360 pixels. | M |
| NFR-02 | Uploaded identity documents are encrypted when stored and are deleted 30 days after check-out. | M |
| NFR-03 | Only front-desk agents and property managers at the guest's property can view the document. | M |
| NFR-04 | Each page meets WCAG 2.1 level AA. | M |
| NFR-05 | A guest can complete the steps in 3 minutes or less on a mobile phone. | S |

## 7. User stories and acceptance criteria

### Story 1: Guest confirms details before arrival (FR-01, FR-02)

**As a** guest, **I want to** confirm my details before I arrive, **so that** I do not
have to fill in forms at the front desk.

- **Given** a booking with a check-in date in 48 hours, **when** the time is reached, **then** the guest receives an email with a check-in link.
- **Given** the guest opens the link, **when** the page loads, **then** their name and phone number are already filled in.
- **Given** the guest changes the phone number, **when** they select **Continue**, **then** the new number is saved on the booking.

### Story 2: Guest uploads an identity document (FR-03)

**As a** guest, **I want to** upload my identity document from my phone, **so that** the
front desk does not need to scan it.

- **Given** the guest selects a PDF of 3 MB, **when** the upload finishes, **then** the file name is shown with a **Remove** option.
- **Given** the guest selects a file of 8 MB, **when** the upload starts, **then** the message "The file is too large. Choose a file of 5 MB or less." is shown and nothing is saved.
- **Given** the guest selects a Word file, **when** the upload starts, **then** the message "Choose a JPG, PNG or PDF file." is shown.

### Story 3: Agent approves a check-in (FR-05, FR-06)

**As a** front-desk agent, **I want to** see which guests are ready, **so that** I can
check in the guests with the shortest wait first.

- **Given** a guest has submitted all steps, **when** the agent opens the bookings list, **then** the booking shows **Submitted**.
- **Given** the agent selects **Approve**, **when** the page refreshes, **then** the status is **Ready**.
- **Given** the agent selects **Reject** and enters a reason, **when** they confirm, **then** the status is **Needs attention** and the guest receives the reason by email.

## 8. Assumptions, constraints and dependencies

- **Assumption:** Every booking has a valid guest email address. Today, about 8% do not (to be checked in the data, see Q2).
- **Assumption:** Front-desk agents have a tablet or computer that can display the document.
- **Constraint:** The feature must follow the company's data-retention policy and local data-protection law.
- **Dependency:** The email service must be able to send scheduled messages (Development team to confirm).
- **Dependency:** Legal must confirm that an on-screen signature is acceptable for the registration form.

## 9. Risks

| Risk | Likelihood | Impact | Response |
| --- | --- | --- | --- |
| Guests do not use online check-in | Medium | High | Put the link in the booking confirmation as well as the reminder. Review the rate after four weeks. |
| An identity document is exposed | Low | High | Encrypt the files, limit access, and delete after 30 days (NFR-02, NFR-03). |
| Agents do not trust the online status | Medium | Medium | Train agents, and let them reject a check-in with a reason. |
| Guests without email cannot be reached | Medium | Low | Keep the current process. Ask for an email address at booking. |

## 10. Open questions

| # | Question | Owner | Needed by |
| --- | --- | --- | --- |
| Q1 | Can we confirm the 6-minute figure with a second week of timings? | Operations lead | 28 October 2026 |
| Q2 | How many bookings have no valid email address? | Development team | 28 October 2026 |
| Q3 | Is an on-screen signature accepted for the registration form? | Legal | 4 November 2026 |
| Q4 | How long should we keep the document, if the guest has a dispute? | Finance lead | 4 November 2026 |

## 11. Approval

| Name | Role | Decision | Date |
| --- | --- | --- | --- |
| [Name] | Operations lead | [Approve / Changes needed] | [Date] |
| [Name] | Finance lead | [Approve / Changes needed] | [Date] |
| [Name] | Property manager | [Approve / Changes needed] | [Date] |

## Revision history

| Version | Date | Change |
| --- | --- | --- |
| 0.1 | 2 October 2026 | First draft |
| 0.2 | 8 October 2026 | Added scope table and risks after the stakeholder workshop |
| 0.3 | 14 October 2026 | Added acceptance criteria and open questions |
