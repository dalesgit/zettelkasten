---
title: "Summarize Daily Notes Using Dataview - Share & showcase"
source: "https://forum.obsidian.md/t/summarize-daily-notes-using-dataview/18049"
author:
  - "[[Obsidian Forum]]"
published: 2021-05-12
created: 2025-11-18
description: "If you use front matter in your daily notes, via a template or otherwise, you can use data view to create a note that summarized all your daily notes: This how the daily note looks like with the front matter key:value p…"
tags:
  - "clippings"
---
[Rishi](https://forum.obsidian.md/u/Rishi) Insider

Also, you can use the inline `Key:: Value` as well if you like something to be a part of the note body and not be hidden in YAML. And that works with tags! I used to have a #watched tag which I’d write in my daily note bullets where I watched an interesting YouTube video or movie. Now I do it like this,

```lua
- Some note about something
- #watched:: [[Inception (2009)]] with [[John Doe]]
- More notes about other things
```

And the query in my `Watch Log` note,

```csharp
TABLE watched as Watched
FROM #watched
SORT file.ctime ASC
```

**Caveats**: The `Key:: value` part needs to either be on it’s own line OR start as the first part of a sentence. Something like

`I #watched:: Inception` doesn’t work but

`Woke up late today. #watched:: Inception` works.

[emailkgnow](https://forum.obsidian.md/u/emailkgnow)

These are great tips! They take Dataview to a new level by organically integrating it right into the body of the note itself instead of the front matter.

Many thanks

1 year later

[SiliasOS](https://forum.obsidian.md/u/SiliasOS) Insider

Hi,  
I also want to generate a daily note summery.  
I don’t use yaml and inline-metadata so far, but I do have different headings in my daily note template, like

```shell
## Gratitude
## what happend today?
## ...
```

Now I’m wondering, if I could use dataview, to just summerize all the content, I wrote underneath the “what happend today?”-heading.  
Is that possible, and if yes, how could I accomplish this?

Thanks in advance,  
Silias

[scholarInTraining](https://forum.obsidian.md/u/scholarInTraining)

Can you embed a link to the “what happened today” heading? That would not need Dataview at all.

[SiliasOS](https://forum.obsidian.md/u/SiliasOS) Insider

Yes, in my summary, I could embed links to the “what happened today” headings in my daily notes.  
but that would mean, if I have 10 daily notes, I would need to manually generate a link to each of the 10 daily note headings…  
But I’d like the summary to be automatically generated and that new daily notes dynamically be integrated in the summary.  
\=> to get such a dynamical summary, I assumed that dataview could be the right tool…

Unfortunately, I’m not so deep in dataview so far. Is it possible to use headings in dataview queries? And if yes, could you give me an example? I didn’t find anything in the doc, or maybe I didn’t understand the doc correctly.

Thanks in advance,  
Silias

[scholarInTraining](https://forum.obsidian.md/u/scholarInTraining)

I see what you mean. Unfortunately Dataview is not the right tool here since it focuses only on metadata and not text or location in the file. You would be able to use dataview to generate your list of filenames for your daily notes, but unfortunately its support for embed links is not great.

A possible alternative might be using Obsidian’s built-in search, which you can stick in a note via a `query` block. You could use that to search for the heading you want to show.

There also may be community plugins that can help with this, since aggregating from daily notes is something lots pf people want to do.

Good luck!

[SiliasOS](https://forum.obsidian.md/u/SiliasOS) Insider

Hi,  
Thanks for the tip!!!

I used that query:

```
block:("what happend today")
```

Unfortunately, the result just shows the files in which the heading “what happend today” appears, and not the content underneath these headings. How could I achieve a list of the contents underneath the “what happend today” headings?

[AlanG](https://forum.obsidian.md/u/AlanG) VIP

You can extract the full “What happened today?” section via regex.

For best performance you’ll want to change the Dataview query `dv.pages()` to limit it to your daily notes only. If you use the tag “ #daily ”, that would be `dv.pages('#daily')`

```
\`\`\`dataviewjs
const header = '## What happened today\\?'

// You can update this to filter as you like - filtering for just your daily notes would be good
const pages = dv.pages()

// This regex will return text from the Summary header, until it reaches
// the next header, a horizontal line, or the end of the file
const regex = new RegExp(\`\n${header}\r?\n(.*?)(\n#+ |\n---|$)\`, 's')

for (const page of pages) {
    const file = app.vault.getAbstractFileByPath(page.file.path)
    // Read the file contents
    const contents = await app.vault.read(file)
    // Extract the summary via regex
    const summary = contents.match(regex)
    if (summary) {
        // Output the header and summary
        dv.header(2, file.basename)
        dv.paragraph(summary[1].trim())
    }
}
\`\`\`
```

[SiliasOS](https://forum.obsidian.md/u/SiliasOS) Insider

Hi Alan,  
thanks a lot for your help und the example-code!!!

I did the following:  
I generated a new note, called “diary”, there I pasted your code, in order to get a summarization of all “what happend today?”-headers in my daily notes, and get the following result:

![image](https://forum.obsidian.md/uploads/default/original/3X/0/c/0c1a44cbd537c35f96ee0d0ac516fbfd1c158398.png)

Can you help me with that Evaluation Error?

Thanks in advance,  
Silias

[AlanG](https://forum.obsidian.md/u/AlanG) VIP

Can you paste the code that you used?

If you used my code without any changes, I can confirm that code is working. Just check that you pasted with Ctrl+Shift+V so that you don’t paste with any formatting. Or you could paste in source mode rather than Live Preview.

[SiliasOS](https://forum.obsidian.md/u/SiliasOS) Insider

You’re right, I didn’t copy your code with “Strg+Shift+V”. I copied your code with “Strg+V” and did some formating on my own, so maybe here is the failure…

But hmmm… after copying your code with “Strg + Shift + V”, I see a strange behaviour here:  

[![image](https://forum.obsidian.md/uploads/default/optimized/3X/b/b/bb8c7ef3bff389b5609db1703052ca89c85330f5_2_10x10.png)](https://forum.obsidian.md/uploads/default/original/3X/b/b/bb8c7ef3bff389b5609db1703052ca89c85330f5.png "image")

The rows from 2-76 are not really visible…

[AlanG](https://forum.obsidian.md/u/AlanG) VIP

That’s because there are no notes matching your search. You need to make sure the `header` variable matches what your actual headers are.

In your original post you have the headers as `## what happend today?` with ‘happened’ misspelled. If it’s spelled that way in your actual notes, you’ll need to change my code on the first line where it says:

```csharp
const header = '## What happened today\\?'
```

If you want to include the question mark, make sure to put it with a double backslash before it like this: `today\\?`.

[SiliasOS](https://forum.obsidian.md/u/SiliasOS) Insider

Woohoooooooooooooooooo!!!:DDD

Thanks Alan!!! I didn’t know, that I must write the complete header in the query, not just a part of it.  
… I’m german, so in my daily notes there’s no “what happened today?” but “was ist heute passiert?” instead…

But no, everything works perfectly fine. Thanks for your help!

[SiliasOS](https://forum.obsidian.md/u/SiliasOS) Insider

Haha, one last question:  
The result of the dataviewjs query is not sorted yet. Is ist possible to sort the result chronologically, corresponding to the filenames of my daily notes, which have the format YYYY-MM-DD?  
The sorting hierarchy should be from new to old (up to down of the note).

Thanks!

[AlanG](https://forum.obsidian.md/u/AlanG) VIP

Dataview can sort for you:

```csharp
const pages = dv.pages().sort(x => x.file.name, 'desc')
```

[SiliasOS](https://forum.obsidian.md/u/SiliasOS) Insider

Wow, very, very nice, thanks!

Okay, and now, the very last question (promise! ):  
![image](https://forum.obsidian.md/uploads/default/original/3X/2/d/2df26931069c8e6c63aedae9989e762291ed692a.png)

As you can see, I don’t have entries underneath the “what happened today”-header in every daily note. For example on 2022-08-28 I don’t have an entry. Is it possible to sort these daily notes out of the query, which don’t have an entry underneath the “what happened today”-header?

[AlanG](https://forum.obsidian.md/u/AlanG) VIP

Change the end to be:

```
if (summary && summary[1].trim()) {
```

instead of

```
if (summary) {
```

Can I recommend that you have a look at a beginners Javascript course. There’s an amazing German instructor who I love, and this is where I learned Javascript:

[https://www.udemy.com/course/javascript-the-complete-guide-2020-beginner-advanced/](https://www.udemy.com/course/javascript-the-complete-guide-2020-beginner-advanced/)

It’s very easy, and it will open up a world of possibilities for you in Obsidian and so many other applications.

[SiliasOS](https://forum.obsidian.md/u/SiliasOS) Insider

Hey Alan,  
thank you so much for your help, and also for that valuable recommendation! I consider that severly!

## Topic: The file.lists by example (PART I/2)

- The file.lists by example - Chapter 3: using DQL to gather list items or task items under the specific heading (and filter by a field) (and sum up a field) (and display each DVIF)
Summary
- How to gather list items or task items under the specific heading? (`DQL90`, `DVJS90`)
- How to gather list items or task items under the specific heading
	- Each of the following DQLs requires a specific note.
	- How to filter by a field? (`DQL10`, `DQL20`, `DQL30`)
	- How to sum up a field? (`DQL63`, `DQL65`)
	- How to display each DVIF in items as a table
		- case\_FLST\_HLSS: `DQL10`
		- case\_FLST\_HLSSS: `DQL20`
		- case\_FLST\_HLDSS: `DQL30`
		- case\_FLST\_HLDDD: `DQL61`, `DQL63`, `DQL65`

### Q1: How to gather list items or task items under the specific heading and display each DVIF in items as a table?

#### Answers: DQL10, DQL20, or DQL30

---

### Q2: How to gather root list items or root task items under the specific heading?

#### Answers: DQL61, DQL63, or DQL65

---

### Q3: How to distinguish list items from task items from the file.lists data?

#### Answers

- How to distinguish list items from task items from the file.lists data?
	- a list item:!L.task
	- a task item: L.task
	- a root list item:!L.parent AND!L.task
	- a root task item:!L.parent AND L.task
	- L: each element of file.lists of each page
	- No one can distinguish a list item from a task item from the value of L.text where L is an element of file.lists.

---

## Structures:

Summary

### Q1: How to use the file.lists data to design a Markdown file as a table in the database, where each record consists of multiple columns?

Summary\_Q1

#### A1\_11:

##### Another Example: A1\_11

- There are at least four methods to do that by using the file.lists data.

| Code Name | Data type | Cases | Headings(list items) | Headings(task items) | Remark |
| --- | --- | --- | --- | --- | --- |
| DQL10 | file.lists | case\_FLST\_HLSS | milestones | main tasks |  |
| DQL20 | file.lists | case\_FLST\_HLSSS | some events | some tasks |  |
| DQL30 | file.lists | case\_FLST\_HLDSS | other events | other tasks |  |
| DQL61 | file.lists | case\_FLST\_HLDDD | what happened today | what happened today |  |
| DQL63 | file.lists | case\_FLST\_HLDDD | what happened today | what happened today |  |
| DQL65 | file.lists | case\_FLST\_HLDDD | what happened today | what happened today |  |

---

## Test

Summary
- dataview: v0.5.41

---

## DQL10\_flatten\_fLists\_and\_display\_list\_items\_and\_task\_items\_under\_the\_heading\_and\_filter: case\_FLST\_HLSS

Summary

### Main DQL

| Code Name | Data type | Group By | Purposes | Remark |
| --- | --- | --- | --- | --- |
| DQL10\_flatten\_fLists   \_and\_display\_list\_items   \_and\_task\_items   \_under\_the\_heading   \_and\_filter | file.lists | yes | 0.To require the note in the following form: case\_FLST\_HLSS   1.To flatten file.lists   2.To gather list items where the heading contains “milestones”   3.To gather task items where the heading contains “main tasks”   4.To filter by F\_duration\_days   5.To filter by L.tags and L.outlinks   6.To sort by file.link in ascending order   7.To display each DVIF in items as a table \[without the desired structure\] | Note:   Require the files with the `case_FLST_HLSS` structure |

### Notes

#### Require the files with the case\_FLST\_HLSS structure

> case\_FLST\_HLSS: use file.lists where L.text contains one field separator like " "  
> FLST: Use file.lists  
> H: a header  
> L: an element of file.lists  
> S: field separators

---

- filename: `dic_20040301` contains the heading “milestones”
```
\`\`\`md
---
Date: 2004-03-01
---
#Project/P03

Areas:: #research

#### input
##### milestones
- 2004-03-01 add this feature_A #Test/d01 [[Note J]] , [[Note K]]
- 2004-03-02 add this feature_B #Test/d02 [[Note J]] 
- 2004-03-03 add this feature_C [[Note K]]
- 2004-03-04 add this feature_D #Test/d04
- 2004-03-05 add this feature_E  #Test/d05 [[Note K]] 
- 2004-03-06 add this feature_F  #Test/d06
- 2004-73-07 add this feature_G #Test/d07
- 2004-03-08 add this feature_H [[Note J]] , [[Note K]]
- 2004-03-09 add this feature_I 
- 2004-03-10 add this feature_J
- It is finished!

\`\`\`
```

---

- filename: `dic_20040401` contains the heading “main tasks”
```
\`\`\`md
---
Date: 2004-04-01
---
#Project/P04

Areas:: #mocap

## input
### main tasks
- [ ] 2004-04-01 add this feature_a #Test/d01 [[Note P]] , [[Note Q]]
- [ ] 2004-04-02 add this feature_b #Test/d02  [[Note P]]
- [ ] 2004-04-03 add this feature_c  [[Note Q]]
- [ ] 2004-04-04 add this feature_d #Test/d04
- [x] 2004-04-05 add this feature_e  #Test/d05 [[Note Q]]
- [ ] 2004-04-06 add this feature_f  #Test/d06
- [ ] 2004-74-07 add this feature_g #Test/d07
- [ ] 2004-04-08 add this feature_h [[Note P]] , [[Note Q]]
- [ ] 2004-04-09 add this feature_i 
- [ ] 2004-04-10 add this feature_j 
- [ ] It is finished!

\`\`\`
```

---

### Code DQL10\_flatten\_fLists\_and\_display\_list\_items\_and\_task\_items\_under\_the\_heading\_and\_filter: case\_FLST\_HLSS

Summary\_code
```
title: DQL10_flatten_fLists_and_display_list_items_and_task_items_under_the_heading_and_filter =>0.Require the files with the \`case_FLST_HLSS\` structure
collapse: close
icon: 
color: 
\`\`\`dataview
TABLE WITHOUT ID
      file.link AS "File",
      choice(L.task, "- [" + L.status + "] " + "",  "- " + "") AS "m_or_t",
      F_duration_days AS "dur_days",    
      F_text_without_outlinks AS "Event",
      F_sDate_of_L AS "L_sDate",
      F_fsDate_of_L AS "L_fsDate",
      L.tags AS "tags",
      L.outlinks AS "outlinks"

FROM "100_Project/02_dataview/Q92_FileLists/Q92_test_data" AND #Project

FLATTEN file.lists AS L
FLATTEN meta(L.header).subpath AS F_subpath
FLATTEN meta(L.header).type AS F_type
WHERE (contains(F_subpath, "milestones") AND F_type = "header")
      OR (contains(F_subpath, "main tasks") AND F_type = "header")
WHERE regexmatch("^\d{4}-\d{2}-\d{2}\s+", L.text)

FLATTEN split(L.text, " ")[0] AS F_sDate_of_L
FLATTEN regexreplace(L.text, "^\d{4}-\d{2}-\d{2} ", "") AS F_text_without_date
FLATTEN regexreplace(F_text_without_date, "\s+#.+$", "") AS F_text_without_tags
FLATTEN regexreplace(F_text_without_tags, "(\s+\[\[.+\]\].*$)", "") AS F_text_without_outlinks
WHERE F_sDate_of_L != null
WHERE date(F_sDate_of_L) != null

FLATTEN date(F_sDate_of_L) AS F_dtDate_of_L
FLATTEN dateformat(F_dtDate_of_L, "yyyy-MM-dd") AS F_fsDate_of_L
FLATTEN Date AS YAML_Date
FLATTEN dur(F_dtDate_of_L - YAML_Date).days AS F_duration_days
WHERE F_duration_days != 0
WHERE (contains(L.tags, "#Test/d05") AND contains(L.outlinks, [[Note K]]))
      OR (contains(L.tags, "#Test/d05") AND contains(L.outlinks, [[Note Q]]))
SORT file.link ASC

\`\`\`
```

---

#### Screenshots(DQL10)

[![20220908_DQL10_output_a01](https://forum.obsidian.md/uploads/default/optimized/3X/6/4/64d2bae16827f383488a3aedbf7be246b1688186_2_690x280.png)](https://forum.obsidian.md/uploads/default/original/3X/6/4/64d2bae16827f383488a3aedbf7be246b1688186.png "20220908_DQL10_output_a01")

---

## DQL20\_flatten\_fLists\_and\_display\_list\_items\_and\_task\_items\_under\_the\_heading\_and\_filter: case\_FLST\_HLSSS

Summary

### Main DQL

| Code Name | Data type | Group By | Purposes | Remark |
| --- | --- | --- | --- | --- |
| DQL20\_flatten\_fLists   \_and\_display\_list\_items   \_and\_task\_items   \_under\_the\_heading   \_and\_filter | file.lists | yes | 0.To require the note in the following form: case\_FLST\_HLSSS   1.To flatten file.lists   2.To gather list items where the heading contains “some events”   3.To gather task items where the heading contains “some tasks”   4.To filter by L.tags   5.To sort by file.link in ascending order 6.To display each DVIF in items as a table \[without the desired structure\] | Note:   Require the files with the `case_FLST_HLSSS` structure |

### Notes

#### Require the files with the case\_FLST\_HLSSS structure

> case\_FLST\_HLSSS: use file.lists where L.text contains at least one field separator like “|”  
> FLST: Use file.lists  
> H: a header  
> L: an element of file.lists  
> S: field separators

---

- filename: `dic_20040301` contains the heading “some events”
```
\`\`\`md
---
Date: 2004-03-01
---
#Project/P03

Areas:: #research

#### input
##### some events
- 2004-03-01 | drinks | Black Coffee | 11 | #Test/d01 [[Note J]] , [[Note K]]
- 2004-03-02 | drinks | Black Coffee | 21 | #Test/d02  [[Note J]]
- 2004-03-03 | drinks | Black Coffee | 31 |  [[Note K]]
- 2004-03-04 | drinks | Black Coffee | 41 | #Test/d04
- 2004-03-05 | drinks | Black Coffee | 51 | #Test/d05 [[Note K]] 
- 2004-03-06 | drinks | Black Coffee | 61 | #Test/d06 
- 2004-73-07 | drinks | Black Coffee | 71 | #Test/d07
- 2004-03-08 | drinks | Black Coffee | 81 |  [[Note J]] , [[Note K]]
- 2004-03-09 | drinks | Black Coffee | 91
- 2004-03-10 | drinks | Black Coffee
- It is finished!

\`\`\`
```

---

- filename: `dic_20040401` contains the heading “some tasks”
```
\`\`\`md
---
Date: 2004-04-01
---
#Project/P04

Areas:: #mocap

## input
### some tasks
- [ ] 2004-04-01 | drinks | Green Tea | 101 | #Test/d01 [[Note P]] , [[Note Q]]
- [ ] 2004-04-02 | drinks | Green Tea | 201 | #Test/d02  [[Note P]]
- [ ] 2004-04-03 | drinks | Green Tea | 301 |  [[Note Q]]
- [ ] 2004-04-04 | drinks | Green Tea | 401 | #Test/d04
- [x] 2004-04-05 | drinks | Green Tea | 501 | #Test/d05 [[Note Q]]
- [ ] 2004-04-06 | drinks | Green Tea | 601 | #Test/d06 
- [ ] 2004-74-07 | drinks | Green Tea | 701 | #Test/d07
- [ ] 2004-04-08 | drinks | Green Tea | 801 |  [[Note P]] , [[Note Q]]
- [ ] 2004-04-09 | drinks | Green Tea | 901
- [ ] 2004-04-10 | drinks | Green Tea
- [ ] It is finished!

\`\`\`
```

---

### Code DQL20\_flatten\_fLists\_and\_display\_list\_items\_and\_task\_items\_under\_the\_heading\_and\_filter: case\_FLST\_HLSSS

Summary\_code
```
title: DQL20_flatten_fLists_and_display_list_items_and_task_items_under_the_heading_and_filter =>0.Require the files with the \`case_FLST_HLSSS\` structure
collapse: close
icon: 
color: 
\`\`\`dataview
TABLE WITHOUT ID
      file.link AS "File",
      choice(L.task, "- [" + L.status + "] " + "",  "- " + "") AS "m_or_t",
      F_sDate_of_L AS "L_sDate",
      F_fsDate_of_L AS "L_fsDate",
      F_type AS "type",
      F_desc AS "desc",
      F_cost AS "cost",
      L.tags AS "tags",
      L.outlinks AS "outlinks"   

FROM "100_Project/02_dataview/Q92_FileLists/Q92_test_data" AND #Project

FLATTEN file.lists AS L
FLATTEN meta(L.header).subpath AS F_subpath
FLATTEN meta(L.header).type AS F_type
WHERE contains(F_subpath, "some events") AND F_type = "header"
      OR (contains(F_subpath, "some tasks") AND F_type = "header")
WHERE regexmatch("^\d{4}-\d{2}-\d{2}\s+", L.text)

FLATTEN split(L.text, "\s+\|\s+")[0] AS F_sDate_of_L
FLATTEN split(L.text, "\s+\|\s+")[1] AS F_type
FLATTEN split(L.text, "\s+\|\s+")[2] AS F_desc
FLATTEN split(L.text, "\s+\|\s+")[3] AS F_cost
WHERE F_sDate_of_L != null
WHERE date(F_sDate_of_L) != null

FLATTEN date(F_sDate_of_L) AS F_dtDate_of_L
FLATTEN dateformat(F_dtDate_of_L, "yyyy-MM-dd") AS F_fsDate_of_L
WHERE contains(L.tags, "#Test/d02")
SORT file.link ASC

\`\`\`
```

---

#### Screenshots(DQL20)

[![20220908_DQL20_output_a01](https://forum.obsidian.md/uploads/default/optimized/3X/4/e/4e1a45607251135554830a560c07c5032a87b43b_2_690x280.png)](https://forum.obsidian.md/uploads/default/original/3X/4/e/4e1a45607251135554830a560c07c5032a87b43b.png "20220908_DQL20_output_a01")

---

## DQL30\_flatten\_fLists\_and\_display\_list\_items\_and\_task\_items\_under\_the\_heading\_and\_filter: case\_FLST\_HLDSS

Summary

### Main DQL

| Code Name | Data type | Group By | Purposes | Remark |
| --- | --- | --- | --- | --- |
| DQL30\_flatten\_fLists   \_and\_display\_list\_items   \_and\_task\_items   \_under\_the\_heading   \_and\_filter | file.lists | yes | 0.To require the note in the following form: case\_FLST\_HLDSS   1.To flatten file.lists   2.To gather list items where the heading contains “other events”   3.To gather task items where the heading contains “other tasks”   4.To filter by L.tags   5.To sort by file.link in ascending order   6.To display each DVIF in items as a table \[without the desired structure\] | Note:   Require the files with the `case_FLST_HLDSS` structure |

### Notes

#### Require the files with the case\_FLST\_HLDSS structure

> case\_FLST\_HLDSS: use file.lists where L.text consists of one DVIF and field separators  
> FLST: Use file.lists  
> H: a header  
> L: an element of file.lists  
> D: DVIF  
> S: field separators

---

- filename: `dic_20040301` contains the heading “other events”
```
\`\`\`md
---
Date: 2004-03-01
---
#Project/P03

Areas:: #research

#### input
##### other events 
- info:: 2004-03-01 | drinks | Black Coffee | 12 | #Test/d01 [[Note J]] , [[Note K]]
- info:: 2004-03-02 | drinks | Black Coffee | 22 | #Test/d02  [[Note J]]
- info:: 2004-03-03 | drinks | Black Coffee | 32 |  [[Note K]]
- info:: 2004-03-04 | drinks | Black Coffee | 42 | #Test/d04
- info:: 2004-03-05 | drinks | Black Coffee | 52 | #Test/d05 [[Note K]] 
- info:: 2004-03-06 | drinks | Black Coffee | 62 | #Test/d06       
- info:: 2004-73-07 | drinks | Black Coffee | 72 | #Test/d07  
- info:: 2004-03-08 | drinks | Black Coffee | 82 | [[Note J]] , [[Note K]]  
- info:: 2004-03-09 | drinks | Black Coffee | 92  
- info:: 2004-03-10 | drinks | Black Coffee
- It is finished!

\`\`\`
```

---

- filename: `dic_20040401` contains the heading “other tasks”
```
\`\`\`md
---
Date: 2004-04-01
---
#Project/P04

Areas:: #mocap

## input
### other tasks 
- [ ] (info:: 2004-04-01 | drinks | Green Tea | 102) #Test/d01 [[Note P]] , [[Note Q]]
- [ ] (info:: 2004-04-02 | drinks | Green Tea | 202) #Test/d02  [[Note P]]
- [ ] (info:: 2004-04-03 | drinks | Green Tea | 302)  [[Note Q]]
- [ ] (info:: 2004-04-04 | drinks | Green Tea | 402) #Test/d04
- [x] (info:: 2004-04-05 | drinks | Green Tea | 502) #Test/d05 [[Note Q]]
- [ ] (info:: 2004-04-06 | drinks | Green Tea | 602) #Test/d06       
- [ ] (info:: 2004-74-07 | drinks | Green Tea | 702) #Test/d07  
- [ ] (info:: 2004-04-08 | drinks | Green Tea | 802)  [[Note P]] , [[Note Q]]
- [ ] (info:: 2004-04-09 | drinks | Green Tea | 902) 
- [ ] (info:: 2004-04-10 | drinks | Green Tea) 
- [ ] It is finished!

\`\`\`
```

---

### Code DQL30\_flatten\_fLists\_and\_display\_list\_items\_and\_task\_items\_under\_the\_heading\_and\_filter: case\_FLST\_HLDSS

Summary\_code
```
title: DQL30_flatten_fLists_and_display_list_items_and_task_items_under_the_heading_and_filter =>0.Require the files with the \`case_FLST_HLDSS\` structure
collapse: close
icon: 
color: 
\`\`\`dataview
TABLE WITHOUT ID
      file.link AS "File",
      choice(L.task, "- [" + L.status + "] " + "",  "- " + "") AS "m_or_t",
      F_sDate_of_L AS "L_sDate",
      F_fsDate_of_L AS "L_fsDate",
      F_type AS "type",
      F_desc AS "desc",
      F_cost AS "cost",
      L.tags AS "tags",
      L.outlinks AS "outlinks"      

FROM "100_Project/02_dataview/Q92_FileLists/Q92_test_data" AND #Project

FLATTEN file.lists AS L
FLATTEN meta(L.header).subpath AS F_subpath
FLATTEN meta(L.header).type AS F_type
WHERE contains(F_subpath, "other events") AND F_type = "header"
      OR (contains(F_subpath, "other tasks") AND F_type = "header")
WHERE L.info != null

FLATTEN split(L.info, "\s+\|\s+")[0] AS F_sDate_of_L
FLATTEN split(L.info, "\s+\|\s+")[1] AS F_type
FLATTEN split(L.info, "\s+\|\s+")[2] AS F_desc
FLATTEN split(L.info, "\s+\|\s+")[3] AS F_cost
WHERE F_sDate_of_L != null
WHERE date(F_sDate_of_L) != null

FLATTEN date(F_sDate_of_L) AS F_dtDate_of_L
FLATTEN dateformat(F_dtDate_of_L, "yyyy-MM-dd") AS F_fsDate_of_L
WHERE contains(L.tags, "#Test/d02")
SORT file.link ASC

\`\`\`
```

---

#### Screenshots(DQL30)

  

[![20220908_DQL30_output_a01](https://forum.obsidian.md/uploads/default/optimized/3X/3/5/351bc93a28be63435591b71c38701f2be89ae491_2_690x280.png)](https://forum.obsidian.md/uploads/default/original/3X/3/5/351bc93a28be63435591b71c38701f2be89ae491.png "20220908_DQL30_output_a01")

---

## DQL61\_flatten\_fLists\_and\_display\_root\_list\_items\_and\_root\_task\_items\_under\_the\_heading: case\_FLST\_HLDDD

Summary

### Main DQL

| Code Name | Data type | Group By | Purposes | Remark |
| --- | --- | --- | --- | --- |
| DQL61\_flatten\_fLists   \_and\_display   \_root\_list\_items   \_and\_root\_task\_items   \_under\_the\_heading | file.lists | yes | 0.To require the note in the following form: case\_FLST\_HLDDD   1.To flatten file.lists   2.To gather root list items or root task items where the heading contains “what happened today”   3.To sort by file.link in ascending order   4.To display each DVIF in root items as a table \[without the desired structure\] | Note:   Require the files with the `case_FLST_HLDDD` structure |

### Notes

#### Require the files with the case\_FLST\_HLDDD structure

> case\_FLST\_HLDDD: use file.lists where L.text consists of more than one DVIF  
> FLST: Use file.lists  
> H: a header  
> L: an element of file.lists  
> D: DVIF

---

- filename: `dic_20040301` contains the heading “what happened today”
```
\`\`\`md
---
Date: 2004-03-01
---
#Project/P03

Areas:: #research

#### input
##### what happened today?
- [type:: "food"] [desc:: "breakfast"] [cost:: 10] #Test/d01 [[Note J]] , [[Note K]]
- [type:: "food"] [desc:: "breakfast"] [cost:: 20] #Test/d02  [[Note J]]

##### Each DVIF is aligned to the left
- [type:: "food"] 
  [desc:: "breakfast"] 
  [cost:: 10]
  #Test/d01 [[Note J]] , [[Note K]]
- [type:: "food"]
  [desc:: "breakfast"] 
  [cost:: 20] 
  #Test/d02  [[Note J]]
   
\`\`\`
```

---

- filename: `dic_20040401` contains the heading “what happened today”
```
\`\`\`md
---
Date: 2004-04-01
---
#Project/P04

Areas:: #mocap

## input
### what happened today?
- [ ] [type:: "food"] [desc:: "breakfast"] [cost:: 100] #Test/d01 [[Note P]] , [[Note Q]]
- [ ] [type:: "food"] [desc:: "breakfast"] [cost:: 200] #Test/d02  [[Note P]]

### Each DVIF is aligned to the left
- [ ] [type:: "food"] 
      (desc:: "breakfast") 
      %%(cost:: 100)%% 
      #Test/d01 [[Note P]] , [[Note Q]]
- [ ] [type:: "food"] 
      (desc:: "breakfast") 
      %%(cost:: 200)%%
      #Test/d02  [[Note P]]

\`\`\`
```

---

### Code DQL61\_flatten\_fLists\_and\_display\_root\_list\_items\_and\_root\_task\_items\_under\_the\_heading: case\_FLST\_HLDDD

Summary\_code
```
title: DQL61_flatten_fLists_and_display_root_list_items_and_root_task_items_under_the_heading =>0.Require the files with the \`case_FLST_HLDDD\` structure
collapse: close
icon: 
color: 
\`\`\`dataview
TABLE WITHOUT ID
      file.link AS "File",
      choice(L.task, "- [" + L.status + "] " + "",  "- " + "") AS "m_or_t",
      L.type AS "type",
      L.desc AS "desc",
      L.cost AS "cost",
      L.tags AS "tags", 
      L.outlinks AS "outlinks",
      L.header AS "header"

FROM "100_Project/02_dataview/Q92_FileLists/Q92_test_data" AND #Project

FLATTEN file.lists AS L
FLATTEN meta(L.header).subpath AS F_subpath
FLATTEN meta(L.header).type AS F_type

WHERE !L.parent
WHERE contains(F_subpath, "what happened today") AND F_type = "header"
SORT file.link ASC

\`\`\`
```

---

#### Screenshots(DQL61)

##### Part 1/2

  

[![20220908_DQL61_output_a01](https://forum.obsidian.md/uploads/default/optimized/3X/3/d/3d34befb15d883e6be9830fbf28b94592e05178c_2_690x333.png)](https://forum.obsidian.md/uploads/default/original/3X/3/d/3d34befb15d883e6be9830fbf28b94592e05178c.png "20220908_DQL61_output_a01")

##### Part 2/2

  

[![20220908_DQL61_output_a02](https://forum.obsidian.md/uploads/default/optimized/3X/1/7/1724ca33d469946f72abdeda8dafea8fdf523813_2_690x204.png)](https://forum.obsidian.md/uploads/default/original/3X/1/7/1724ca33d469946f72abdeda8dafea8fdf523813.png "20220908_DQL61_output_a02")

---

## DQL63\_flatten\_fLists\_groupBy\_fLink\_and\_display\_root\_list\_items\_under\_the\_heading\_and\_sum: case\_FLST\_HLDDD

Summary

### Main DQL

| Code Name | Data type | Group By | Purposes | Remark |
| --- | --- | --- | --- | --- |
| DQL63\_flatten\_fLists   \_groupBy\_fLink   \_and\_display   \_root\_list\_items   \_under\_the\_heading   \_and\_sum | file.lists | yes | 0.To require the note in the following form: case\_FLST\_HLDDD   1.To flatten file.lists   2.To gather root list items where the heading contains “what happened today”   3.To group by file.link and `let G_file_link = rows.file.link;`   4.To sort by G\_file\_link in descending order   5.To sum up rows.L.cost as “sum\_r\_cost”   6.To display each DVIF in root list items as a table \[without the desired structure\] | Note:   Require the files with the `case_FLST_HLDDD` structure |

### Code DQL63\_flatten\_fLists\_groupBy\_fLink\_and\_display\_root\_list\_items\_under\_the\_heading\_and\_sum: case\_FLST\_HLDDD

Summary\_code
```
title: DQL63_flatten_fLists_groupBy_fLink_and_display_root_list_items_under_the_heading_and_sum =>0.Require the files with the \`case_FLST_HLDDD\` structure
collapse: close
icon: 
color: 
\`\`\`dataview
TABLE WITHOUT ID
      G_file_link AS "File",
      rows.L.type AS "type",
      rows.L.desc AS "desc",
      rows.L.cost AS "cost",
      sum(map(rows.L.cost, (e) =>  sum(default(e, 0)))) AS "sum_r_cost",
      map(rows.L, (L) => choice(L.task, "- [" + L.status + "] ", "a list item")) AS "milestones_or_tasks"

FROM "100_Project/02_dataview/Q92_FileLists/Q92_test_data" AND #Project

FLATTEN file.lists AS L
FLATTEN meta(L.header).subpath AS F_subpath
FLATTEN meta(L.header).type AS F_type

WHERE !L.parent AND !L.task
WHERE contains(F_subpath, "what happened today") AND F_type = "header"

GROUP BY file.link AS G_file_link
SORT G_file_link DESC

\`\`\`
```

---

#### Screenshots(DQL63)

  

[![20220908_DQL63_output_a01](https://forum.obsidian.md/uploads/default/optimized/3X/0/0/0073ff6a356f8c5dea1d61dfc1ab90a70b06b0b6_2_690x280.png)](https://forum.obsidian.md/uploads/default/original/3X/0/0/0073ff6a356f8c5dea1d61dfc1ab90a70b06b0b6.png "20220908_DQL63_output_a01")

---

## DQL65\_flatten\_fLists\_groupBy\_fLink\_and\_display\_root\_task\_items\_under\_the\_heading\_and\_sum: case\_FLST\_HLDDD

Summary

### Main DQL

| Code Name | Data type | Group By | Purposes | Remark |
| --- | --- | --- | --- | --- |
| DQL65\_flatten\_fLists   \_groupBy\_fLink   \_and\_display   \_root\_task\_items   \_under\_the\_heading   \_and\_sum | file.lists | yes | 0.To require the note in the following form: case\_FLST\_HLDDD   1.To flatten file.lists   2.To gather root task items where the heading contains “what happened today”   3.To group by file.link and `let G_file_link = rows.file.link;`   4.To sort by G\_file\_link in descending order   5.To sum up rows.L.cost as “sum\_r\_cost”   6.To display each DVIF in root task items as a table \[without the desired structure\] | Note:   Require the files with the `case_FLST_HLDDD` structure |

### Code DQL65\_flatten\_fLists\_groupBy\_fLink\_and\_display\_root\_task\_items\_under\_the\_heading\_and\_sum: case\_FLST\_HLDDD

Summary\_code
```
title: DQL65_flatten_fLists_groupBy_fLink_and_display_root_task_items_under_the_heading_and_sum =>0.Require the files with the \`case_FLST_HLDDD\` structure
collapse: close
icon: 
color: 
\`\`\`dataview
TABLE WITHOUT ID
      G_file_link AS "File",
      rows.L.type AS "type",
      rows.L.desc AS "desc",
      rows.L.cost AS "cost",
      sum(map(rows.L.cost, (e) =>  sum(default(e, 0)))) AS "sum_r_cost",
      map(rows.L, (L) => choice(L.task, "- [" + L.status + "] ", "a list item")) AS "milestones_or_tasks"

FROM "100_Project/02_dataview/Q92_FileLists/Q92_test_data" AND #Project

FLATTEN file.lists AS L
FLATTEN meta(L.header).subpath AS F_subpath
FLATTEN meta(L.header).type AS F_type

WHERE !L.parent AND L.task
WHERE !rows.L.cost
WHERE contains(F_subpath, "what happened today") AND F_type = "header"

GROUP BY file.link AS G_file_link
SORT G_file_link DESC

\`\`\`
```

---

#### Screenshots(DQL65)

  

[![20220908_DQL65_output_a01](https://forum.obsidian.md/uploads/default/optimized/3X/f/c/fceb9943da4d6c0aeee8a0428d214862cf53fb02_2_690x292.png)](https://forum.obsidian.md/uploads/default/original/3X/f/c/fceb9943da4d6c0aeee8a0428d214862cf53fb02.png "20220908_DQL65_output_a01")

---

## Exercises: DQL90\_flatten\_fLists\_groupBy\_fLink\_and\_display\_list\_items\_and\_task\_items\_under\_the\_heading

Summary

### Main DQL

| Code Name | Data type | Group By | Purposes | Remark |
| --- | --- | --- | --- | --- |
| DQL90\_flatten\_fLists   \_groupBy\_fLink   \_and\_display\_list\_items   \_and\_task\_items   \_under\_the\_heading | file.lists | yes | 1.To flatten file.lists   2.To gather list items or task items where the heading contains “what happened today”   3.To group by file.link and `let G_file_link = rows.file.link;`   4.To sort by G\_file\_link in descending order   5.To display the result as a table \[without the desired structure\] | 1.The DQL90 is based on the DQL07 in the following topic.   1.1 Q93\_Tasks: [Solutions](https://forum.obsidian.md/t/grouping-tasks-in-dataview-by-content/42208/3) |

### Notes

#### dictionary files

- filename: `dic_20040301` contains the heading “what happened today”
```
\`\`\`md
---
Date: 2004-03-01
---
#Project/P03

Areas:: #research

#### input
##### what happened today?
- [type:: "food"] [desc:: "breakfast"] [cost:: 10] #Test/d01 [[Note J]] , [[Note K]]
- [type:: "food"] [desc:: "breakfast"] [cost:: 20] #Test/d02  [[Note J]]

##### Each DVIF is aligned to the left
- [type:: "food"] 
  [desc:: "breakfast"] 
  [cost:: 10]
  #Test/d01 [[Note J]] , [[Note K]]
- [type:: "food"]
  [desc:: "breakfast"] 
  [cost:: 20] 
  #Test/d02  [[Note J]]

\`\`\`
```

---

- filename: `dic_20040401` contains the heading “what happened today”
```
\`\`\`md
---
Date: 2004-04-01
---
#Project/P04

Areas:: #mocap

## input
### what happened today?
- [ ] [type:: "food"] [desc:: "breakfast"] [cost:: 100] #Test/d01 [[Note P]] , [[Note Q]]
- [ ] [type:: "food"] [desc:: "breakfast"] [cost:: 200] #Test/d02  [[Note P]]

### Each DVIF is aligned to the left
- [ ] [type:: "food"] 
      (desc:: "breakfast") 
      %%(cost:: 100)%% 
      #Test/d01 [[Note P]] , [[Note Q]]
- [ ] [type:: "food"] 
      (desc:: "breakfast") 
      %%(cost:: 200)%%
      #Test/d02  [[Note P]]

\`\`\`
```

---

### Code DQL90\_flatten\_fLists\_groupBy\_fLink\_and\_display\_list\_items\_and\_task\_items\_under\_the\_heading

Summary\_code
```
title: DQL90_flatten_fLists_groupBy_fLink_and_display_list_items_and_task_items_under_the_heading =>1.To flatten file.lists 2.To gather list items or task items where the heading contains "what happened today" 3.To group by file.link and \`let G_file_link = rows.file.link;\` 4.To sort by G_file_link in descending order 5.To display the result as a table [without the desired structure]
collapse: close
icon: 
color: 
\`\`\`dataview
TABLE WITHOUT ID
      G_file_link AS "File",
      map(rows.L, (L) => choice(L.task, "- [" + L.status + "] " + L.text,  L.text)) AS "milestones_or_tasks"

FROM "100_Project/02_dataview/Q92_FileLists/Q92_test_data" AND #Project

FLATTEN file.lists AS L
FLATTEN meta(L.header).subpath AS F_subpath
FLATTEN meta(L.header).type AS F_type

WHERE contains(F_subpath, "what happened today") AND F_type = "header"

GROUP BY file.link AS G_file_link
SORT G_file_link DESC

\`\`\`
```

---

#### Screenshots(DQL90)

##### Part 1/3

[![20220906_DQL90_output_a01](https://forum.obsidian.md/uploads/default/optimized/3X/d/9/d9681b418838587545267a2726d72aaea8488409_2_690x212.png)](https://forum.obsidian.md/uploads/default/original/3X/d/9/d9681b418838587545267a2726d72aaea8488409.png "20220906_DQL90_output_a01")

##### Part 2/3

[![20220906_DQL90_output_a02](https://forum.obsidian.md/uploads/default/optimized/3X/a/2/a20381b9b56a600d38a04e4cea8ce6f2a91983ed_2_690x244.png)](https://forum.obsidian.md/uploads/default/original/3X/a/2/a20381b9b56a600d38a04e4cea8ce6f2a91983ed.png "20220906_DQL90_output_a02")

##### Part 3/3

  

[![20220906_DQL90_output_a03](https://forum.obsidian.md/uploads/default/optimized/3X/4/c/4c56f5b39d5afe343257979ff278cc9b332e0483_2_690x228.png)](https://forum.obsidian.md/uploads/default/original/3X/4/c/4c56f5b39d5afe343257979ff278cc9b332e0483.png "20220906_DQL90_output_a03")

---

## Exercises: DVJS90\_groupBy\_fLink\_flatten\_fLists\_and\_taskList\_under\_the\_heading

Summary

### Main DVJS

| Code Name | Data type | Group By | Purposes | Remark |
| --- | --- | --- | --- | --- |
| DVJS90   \_groupBy\_fLink   \_flatten\_fLists   \_and\_taskList   \_under\_the\_heading | file.lists | yes   groupIn:no | 1.To groupBy page.file.link as G1 (G1=group.rows)   2.To flatten page.file.lists   3.To gather a list item(or a task item) under the heading “what happened today”   4.To display the result by using the dv.taskList \[with the desired structure\] | 1.The DVJS90 is based on the DVJS01 in the following topic.   1.1 Q17\_GroupIn: [Solutions](https://forum.obsidian.md/t/help-with-a-dataview-js-codeblock/42251/8) |

### code DVJS90\_groupBy\_fLink\_flatten\_fLists\_and\_taskList\_under\_the\_heading

Summary\_code
```
title: DVJS90_groupBy_fLink_flatten_fLists_and_taskList_under_the_heading => 1.To groupBy page.file.link as G1 (G1=group.rows) 2.To flatten page.file.lists 3.To gather a list item(or a task item) under the heading "what happened today" 4.To display the result by using the dv.taskList [with the desired structure]
collapse: close
icon: 
color: 
\`\`\`dataviewjs
// M11. define pages: gather all relevant pages
// #####################################################################
let pages = dv
    .pages('"100_Project/02_dataview/Q92_FileLists/Q92_test_data" and #Project')
    .where((page) => page.Areas);

// M21. define groups:
// To groupBy page.file.link AS G1 (G1=group.rows)
// #####################################################################
let groups = pages
    .groupBy((page) => page.file.link)
    .sort((group) => group.key, "desc");

// M31. output groups:
// #####################################################################
for (let group of groups) {

    // M31.FR13 define a_filtered_lists:
    // FLATTEN_CASE_10:To FLATTEN page.file.lists and gather them
    // WHERE_CASE_11  :To gather a list item(or a task item) 
    //                 under the heading "what happened today"
    // #####################################################################
    let a_filtered_lists = group.rows
        .flatMap((page) => page.file.lists)
        .where(
            (L) => dv.func.contains(L.header.subpath, "what happened today") && 
                   L.header.type === "header"
        );

    // M31.FR15 check a_filtered_lists.length :
    // #####################################################################
    if (a_filtered_lists.length === 0){
        continue;
    }
    
        
    // M31.FR21 output page.file.link :
    // #####################################################################
    dv.header(3, group.key);
    
    
    // M31.FR23 output a_filtered_lists.text: [with the desired structure]
    // #####################################################################
    dv.taskList(a_filtered_lists, false); 
}

\`\`\`
```

---

#### Screenshots(DVJS90):

##### Part 1/2

  

[![20221030_DVJS90_output_a01](https://forum.obsidian.md/uploads/default/optimized/3X/2/6/26c5c31a5d107762017d9aca52cd967303cdea74_2_690x491.png)](https://forum.obsidian.md/uploads/default/original/3X/2/6/26c5c31a5d107762017d9aca52cd967303cdea74.png "20221030_DVJS90_output_a01")

##### Part 2/2

  

[![20221030_DVJS90_output_a02](https://forum.obsidian.md/uploads/default/optimized/3X/6/e/6e23aa918db45635fbe83b5c50387588a77efa8d_2_690x421.png)](https://forum.obsidian.md/uploads/default/original/3X/6/e/6e23aa918db45635fbe83b5c50387588a77efa8d.png "20221030_DVJS90_output_a02")

---

## Reference

Summary

### Q93\_Tasks > DQL07

- Q93\_Tasks: [Solutions](https://forum.obsidian.md/t/grouping-tasks-in-dataview-by-content/42208/3)

### Q17\_GroupIn > DVJS01

- Q17\_GroupIn: [Solutions](https://forum.obsidian.md/t/help-with-a-dataview-js-codeblock/42251/8), [Q17\_DVJS10\_Notes](https://forum.obsidian.md/t/help-with-a-dataview-js-codeblock/42251/9), [Q17\_DVJS20\_Notes](https://forum.obsidian.md/t/help-with-a-dataview-js-codeblock/42251/10)

---