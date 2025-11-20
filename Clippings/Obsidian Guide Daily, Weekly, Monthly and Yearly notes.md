---
title: "Obsidian Guide: Daily, Weekly, Monthly and Yearly notes"
source: "https://vaultofjosh.com/blog/obsidian-periodic-notes/"
author:
  - "[[Joshua Knipe]]"
published: 2024-09-15
created: 2025-11-19
description: "“I’d like to use your Obsidian templates, but they look so complicated?” Not anymore! A comprehensive guide on how to set up periodic notes to keep track of your habits, goals, reflections and more."
tags:
  - "clippings"
---
 ![Daily note in Obsidian](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/dailyNoteHead_hu9884979f54924ffa7b0ed21b44bc965b_341286_330x0_resize_q75_h2_box_3.webp)

My daily note template in Obsidian

## Why I created these templates

As mentioned in my [previous post](https://vaultofjosh.com/blog/obsidian-as-a-second-brain/), I use my Obsidian vault as my second brain, where I keep track of my learnings, ideas and projects.

Over time, I realized I wanted to keep track of much more than that. I needed a system where I could fully track habits, goals, health metrics, to-do lists, and more. Through a lot of experimentation, I discovered that the best system for me involved automated periodic notes in Obsidian. In other words, using smart daily, weekly, monthly, and yearly note templates that are easy to populate and automatically interconnected. The key for me was having a low-friction space to capture everything.

![Daily note in Obsidian](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/dailyNoteFoot_hu38a9b4599b272125e816214f4f2ac8ab_558659_330x0_resize_q75_h2_box_3.webp)

My daily note template in Obsidian

The templates I’m currently using—and sharing in this post—were created in November 2023. Since then, I’ve generated over 300 daily and 50 weekly notes using this format. I’m sharing these templates and setup guide because, when I first started with Obsidian, I was searching for inspiration too. Although the templates may seem a bit overwhelming at first, most of the content is automatically generated, making it easy to create new notes.

![Weekly note in Obsidian](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/weeklyNote_hu0067e0dbd23572bd7677e77cc88105a3_341187_330x0_resize_q75_h2_box_3.webp)

My weekly note template in Obsidian

By the end of this post, you’ll have a system that captures everything you want to track—and more. You’ll also gain a solid understanding of Templater, Dataview, and how to customize the templates to suit your needs. If you’d rather skip the detailed walkthrough, you can access the entire collection of templates [here](https://github.com/joshuaknipe/obsidian-templates/).

## Set up

### Plugins required

To make this system work, you’ll need to install a few Obsidian plugins through the *Community plugins* tab:

- [Templater](https://github.com/SilentVoid13/Templater) (required): Defines a templating language that lets you insert variables, functions and JavaScript code into your notes. I’ll explain the Templater/JS code used in each part of the templates below.
- [Dataview](https://github.com/blacksmithgu/obsidian-dataview) (required): Provides a JavaScript API and query language for filtering, sorting, and extracting data from Markdown pages. This lets you query your Obsidian vault and fetch or filter information from other notes.
- [Periodic Notes](https://github.com/liamcain/obsidian-periodic-notes) and [Calendar](https://github.com/liamcain/obsidian-calendar-plugin) (recommended): Enable the creation of daily, weekly, and other periodic notes by clicking on a day or week in the calendar UI.
- [DB Folder](https://github.com/RafaelGB/obsidian-db-folder) (recommended): Allows for Notion-like databases based on folders, making it easier to edit tracked items in daily notes.
- [Charts](https://charts.phib.ro/Meta/Charts/Charts+Documentation) (optional): Enables easy creation of charts from your notes.
- [Heatmap Calendar](https://github.com/Richardsl/heatmap-calendar-obsidian) (optional): Allows for the creation of heatmap calendars from your notes.
- [Todoist](https://github.com/jamiebrynes7/obsidian-todoist-plugin) (optional): Enables bidirectional syncing of Todoist tasks with your Obsidian notes.

### Installation

1. Copy the templates from [here](https://github.com/joshuaknipe/obsidian-templates/tree/main) and put them into your Obsidian vault in a folder called `Templates`.
2. Go to *Templater* settings and:
	- Enable `Trigger Templater on new file creation`.
	- Select `Add new folder template`.
	- Make `filename_template.md` [^1] the default template for the root directory as below.
	![Templater settings](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/templaterSettings_hu339b0488a556824d0af1a1350f9c876a_70372_330x0_resize_q75_h2_box_3.webp)
	Templater settings
3. Go to *Periodic Notes* settings and update the paths in each box to use the new template files.
	![Periodic plugin settings](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/periodicSettings_hu14eba7c2531b212f4b6209a6da3a6483_196141_330x0_resize_q75_h2_box_3.webp)
	Periodic plugin settings
	This will let you create notes by clicking on a day or week in the Calendar (provided by *Calendar plugin*) or by running *Periodic Notes* ’ commands from the Command Palette i.e. CMD + P on Mac, CTRL + P on Windows or simply swiping down on mobile.![Periodic plugin commands](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/periodicCommand_hu6a1e7a37e382abfb565378e0f9cc0785_76519_330x0_resize_q75_h2_box_3.webp)
	Periodic plugin commands
	The templates use the **default filename formats**. If you are using customized filename formats, modify the templates accordingly (refer to the [Moment.js](https://momentjs.com/docs/#/parsing/string-format/) documentation for more information).
	| Periodic Note | Filename format | Example |
	| --- | --- | --- |
	| Daily | YYYY-MM-DD | 2024-09-10 |
	| Weekly | gggg-\[W\]ww | 2024-W37 |
	| Monthly | YYYY-MM | 2024-09 |
	| Quarterly | YYYY-\[Q\]Q | 2024-Q3 |
	| Yearly | YYYY | 2024 |
4. Go to *Dataview* settings and switch on `Enable JavaScript queries` and `Enable inline JavaScript queries`. This lets you write queries using JavaScript within the Dataview plugin (and thus access more complex logic and operations). Don’t worry if you don’t know JavaScript, I’ll explain the code snippets below and you can modify them to your needs.

### How it works

Whenever a new file is created in your Obsidian Vault, the `filename_template.md` template is triggered. It contains a Templater snippet that is used to check if the title of the current note matches one of the filename formats of your periodic notes. If it does, the template for that periodic note is inserted. The highlighted lines [^2] should be updated if you are using customized filename formats.

Templates/filename\_template.md

```
1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12

let templater      = app.plugins.plugins["templater-obsidian"];

let templateFolder = templater.settings.templates_folder;

let noteTypes = [

    {format: "YYYY-MM-DD",     template: "Daily Template.md"},

    {format: "gggg-[W]ww",     template: "Weekly Template.md"},

    {format: "YYYY-MM",     template: "Monthly Template.md"},

    {format: "YYYY-[Q]Q",     template: "Quarterly Template.md"},

    {format: "YYYY",     template: "Yearly Template.md"},

    {format: "YYYY-MMDD-HHmm", template: "unique-note.md"},

    // ...etc

];

...
```

Each periodic template also has a Templater snippet like this:

```js
await tp.file.move(\`path/to/periodic/notes/${tp.file.title}\`);
```

This automatically moves your periodic note to the correct location as it is created i.e. move daily notes to `Journal/Daily/`, weekly notes to `Journal/Weekly/` etc. This setup allows for seamless navigation through days, weeks, months, and years, whether you’re working with existing notes or creating new ones on the fly.

![Periodic plugin settings](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/periodicNavigation_hu2ca3627f3bcdd892f5ae756fb0b001d3_1144801_330x0_resize_box_1.gif)

Periodic plugin settings

## Daily template explained

Let’s go through each part of the daily template in detail and explore what’s happening behind the scenes. This will allow you to customise the template to your needs.

At the beginning of every daily file, you’ll find a list of attributes stored as YAML front matter. These attributes are used to track habits, health metrics, and anything else you want to monitor each day, feeding this data into your other notes. The highlighted lines can be customized (or removed) to suit your needs!

Templates/Daily Template

```
1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
13
14
15
16
17

---

week: <% moment(tp.file.title).format("gggg-[W]WW")%>

weekday: <% tp.date.now("dddd", 0, tp.file.title,"YYYY-MM-DD")%>

tag:

 - Daily

aliases: 

location:

mood: 

sleep:

weight:

prayer:

meditation:

exercise: 

study:

stretch:

nocomplaint:

---
```

Templater runs automatically on new file creation (thanks to Step 2 above), so lines 2 and 3 will be converted to the correct week and weekday for each note. As you go through your day, you’ll fill in the values starting from line 6 and below.

Let’s go through the Templater code in lines 2 and 3 to start getting a feel for how it works:

**Week number calculation:**

```
2

week: <% moment(tp.file.title).format("gggg-[W]WW")%>
```

This calculates the week number of the year based on the current note’s title and outputs it in the format `YYYY-WXX` e.g. “2024-W37”.
- `<% ... %>`: This is Templater’s way of embedding JavaScript-like code inside your note, allowing you to perform operations or calculations.
- **`tp.file.title`**: Refers to the note’s title (assumed to be a date).
- **`moment().format("gggg-[W]WW")`**: Uses Moment.js to format the date, where `gggg` is the ISO year, `[W]` is the literal “W”, and `WW` is the week number.

**Weekday calculation:**

```
3

weekday: <% tp.date.now("dddd", 0, tp.file.title,"YYYY-MM-DD")%>
```

This outputs the full weekday name based on the current note’s title, e.g., “Wednesday”. The function **`tp.date.now(format, offset, referenceDate, referenceFormat)`** takes four arguments:
1. `format` (required): Date format string. We use `"dddd"` in our template to get the full weekday name. Some other common formats are:
	| Format | Example | Description |
	| --- | --- | --- |
	| YYYY-MM-DD | 2024-09-12 | Year-Month-Day |
	| MM/DD/YYYY | 09/12/2024 | Month/Day/Year |
	| DD-MM-YYYY | 12-09-2024 | Day-Month-Year |
	| MMMM D, YYYY | September 12, 2024 | Month Day, Year |
2. `offset` (optional): Days to add/subtract (e.g., `0`, `1`, `-1`).
3. `referenceDate` (optional): Date string to use as reference (e.g., `"2024-09-18"`). In this case, we use `tp.file.title` to get the note’s title.
4. `referenceFormat` (optional): Format of the reference date. Update this if you use a custom filename format for your daily notes.

Here’s an example of what a typical daily note might look like by the end of the day:

Journal/Daily/2024-09-11

```
1
 2
 3
 4
 5
 6
 7
 8
 9
10
11

---

week: 2024-W37

weekday: Wednesday

tag:

 - Daily

aliases: The day we went to the UCT comedy night

location: London

mood: 4

sleep: 80

weight: 77

...
```

You can populate your chosen values for these attributes directly within each daily note (if you have the attributes view enabled in your global Obsidian settings), or you can edit them from a table view using DB Folder. Check out this [video](https://youtu.be/ibarYqG4W5I?si=lnbGZ6yyst31eVKd) to get started with DB Folder.

![Templater settings](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/dbfolderUpdated_hue843c32f25bee65b5457de4fefd4b6cd_179233_330x0_resize_q75_h2_box_3.webp)

DB Folder table view of daily note attributes

Any edits you make to the DB Folder database will automatically update the attributes for the relevant days. The daily notes are essentially where the database is stored.

### File navigation

![Templater settings](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/dailyNoteHeader_hu6939466b274366c99889fb495ee7476f_53260_330x0_resize_q75_h2_box_3.webp)

Templater settings

The next piece of the template is needed to automatically create the linking between daily, weekly, monthly and yearly notes:

Templates/Daily Template

```
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33

<%*

await tp.file.move(\`Journal/Daily/${tp.file.title}\`);

let titleDate = moment(tp.file.title);

// # Sunday, 1 January 2001

tR += '# ' + titleDate.format('dddd, DD MMMM YYYY') + '\n';

// 2023 / Q1 / January / Week 1

tR += '[[' + titleDate.format('YYYY') + ']] / ';

tR += '[[' + titleDate.format('YYYY-[Q]Q') + '|' + titleDate.format('[Q]Q') + ']] / ';

tR += '[[' + titleDate.format('YYYY-MM') + '|' + titleDate.format('MMMM') + ']] / ';

tR += '[[' + titleDate.format('gggg-[W]WW') + '|' + titleDate.format('[Week] w') + ']]';

tR += '\n\n';

// ❮ 2022-12-31 | 2023-01-01 | 2023-01-02 ❯

tR += '❮ [[' + titleDate.subtract(1, 'days').format('YYYY-MM-DD') + ']]';

tR += ' | ' + titleDate.add(1, 'days').format('YYYY-MM-DD') + ' | ';

tR += '[[' + titleDate.add(1, 'days').format('YYYY-MM-DD') + ']] ❯';

%>
```

Here’s what each part of the code does:

1. **Move the file to a specific folder:**
	```
	19
	await tp.file.move(\`Journal/Daily/${tp.file.title}\`);
	```
	Moves the current file to the folder `Journal/Daily/` as discussed [above](https://vaultofjosh.com/blog/obsidian-periodic-notes/#how-it-works).
2. **Create a moment object from the file title:**
	```
	20
	let titleDate = moment(tp.file.title);
	```
	Creates a `moment` object called `titleDate` using the file title, which is expected to be a date string that Moment.js can interpret.
3. **Format and insert the date as a header:**
	```
	21
	22
	// # Sunday, 1 January 2001
	tR += '# ' + titleDate.format('dddd, DD MMMM YYYY') + '\n';
	```
	Adds a Markdown header with the formatted date, like `# Sunday, 01 January 2023`.
4. **Insert hierarchical date links:**
	```
	23
	24
	25
	26
	27
	28
	 // 2023 / Q1 / January / Week 1
	 tR += '[[' + titleDate.format('YYYY') + ']] / ';
	 tR += '[[' + titleDate.format('YYYY-[Q]Q') + '|' + titleDate.format('[Q]Q') + ']] / ';
	 tR += '[[' + titleDate.format('YYYY-MM') + '|' + titleDate.format('MMMM') + ']] / ';
	 tR += '[[' + titleDate.format('gggg-[W]WW') + '|' + titleDate.format('[Week] w') + ']]';
	 tR += '\n\n';
	```
	Inserts navigational links formatted hierarchically: Year // Quarter // Month // Week. For example:
	- `[[2023]] / [[2023-Q1|Q1]] / [[2023-01|January]] / [[2023-W01|Week 1]]`.
	In Obsidian, when using the `[[ ]]` syntax for linking, the text before the pipe (`|`) is the target of the link (i.e., the actual file or note that the link points to). The text after the pipe (`|`) is the display text (i.e., what you will see in the note instead of the file name).
5. **Create previous, current, and next day navigation links:**
	```
	29
	30
	31
	32
	33
	 // ❮ 2022-12-31 | 2023-01-01 | 2023-01-02 ❯
	 tR += '❮ [[' + titleDate.subtract(1, 'days').format('YYYY-MM-DD') + ']]';
	 tR += ' | ' + titleDate.add(1, 'days').format('YYYY-MM-DD') + ' | ';
	 tR += '[[' + titleDate.add(1, 'days').format('YYYY-MM-DD') + ']] ❯';
	 %>
	```
	Generates navigation links for the previous, current, and next days. For instance:
	- `❮ [[2022-12-31]] | [[2023-01-01]] | [[2023-01-02]] ❯`

These links allow for easy navigation through days, weeks, months etc and can also be used to create new notes that do not yet exist.

### Visual view of attributes

![Templater settings](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/dailyAttributesVisual_hu5a0a89c95d23f045bff88d32b5e49cfc_46702_330x0_resize_q75_h2_box_3.webp)

Templater settings

The next section of the template is a Dataview query which visualizes the attributes you are tracking. I’ve found this to be a valuable way to get a quick overview of my day and stay accountable for the habits I’m trying to build.

Once again, the highlighted lines can be customized with any attributes, symbols or emojis.

Templates/Daily Template

```
34
35
36
37
38
39
40
41
42
43
44
45

\`\`\`dataview

table without id

    mood + " #_/habits" AS "🌄",

    prayer AS "🙏",

    choice(meditation,"✅","❌") AS "🧘‍♂️",

    choice(exercise,"✅","❌") AS "🏃‍♂️",

    choice(study,"✅","❌") AS "📚",

    choice(stretch,"✅","❌") AS "🤸",

    choice(nocomplaint,"✅","❌") AS "🤷‍♂️"

from "Journal/Daily"

where file.name = "<% moment(tp.file.title).format("YYYY-MM-DD")%>"

\`\`\`
```

The `choice()` function takes three arguments, and returns the second argument if the first is true. Otherwise it returns the third argument. In this case, it is used to return a tick if the attribute is true, and a cross if it is false. Lines 43-44 filters the data from the `Journal/Daily` folder to only show the current day.

Also worth pointing out is the `" #_/habits "` in Line 37. This activates a custom CSS style that reduces the padding between columns—a necessary tweak to make the table fit on phone screens. If you’d like to do the same, add the following CSS to your vault (`Appearance` > `CSS Snippets`)

CSS Snippets/dataview-width.css

```
1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
13
14
15
16
17
18
19
20
21
22
23

[href="#_/habits"] {

    display: none;

}

table:has([href="#_/habits"]) {

    & tr > th,

    & tr > td {

       max-width: 40px;

        min-width: 40px;

        width: 40px;

        padding: 0px;

        margin: 0px;

    }

    & tr > td {

        padding-left: 1.5px;

        padding-right: 1.5x;

        text-align: left;

    }

    & tr > td:first-child {

        min-width: 5px;

        max-width: inherit;

    }
```

### Practice gratitude and a random learning

![Templater settings](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/practiceGratitude_hu413eabb83c822e560ec1578417c15e8d_328642_330x0_resize_q75_h2_box_3.webp)

Templater settings

The next section of the template is a DataviewJS snippet that extracts, randomizes, and displays a random gratitude and learning from your previous daily notes. I’ve found this helps me reflect more and encourages me to write gratitudes and learnings regularly, knowing they’ll resurface again in the future.

Templates/Daily Template

```
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80

\`\`\`dataviewjs

// List of gratitudes

let gratitudes = [];

// Extract gratitudes from pages that have them

dv.pages()

    .where(page => page.gratitude)

    .forEach(page => {

        dv.array(page.gratitude)

            .forEach(gratitude => {

                gratitudes.push({

                    message: gratitude,

                    page: page

                });

                })});

let learnings = [];

// Extract learnings from pages that have them

dv.pages()

    .where(page => page.learning)

    .forEach(page => {

        dv.array(page.learning)

            .forEach(learning => {

                learnings.push({

                    message: learning,

                    page: page

                });

                })});

let gratitudegreeting = gratitudes[Math.floor(Math.random()*gratitudes.length)] 

let learninggreeting = learnings[Math.floor(Math.random()*learnings.length)]

dv.paragraph("*Practice gratitude:* " + gratitudegreeting.message + 

    " (" + gratitudegreeting.page.file.link + ")" + "<br>" + 

    "*A random learning:* " + learninggreeting.message + " (" + learninggreeting.page.file.link + ")");

\`\`\`
```

Here’s a step-by-step breakdown of what the code does for the random gratitude (and similar for random learning):

1. **Initialize Array and Extract Gratitudes**:
	- `dv.pages()` collects all pages (notes) in your vault and then filters pages that have a `gratitude` field using `.where(page => page.gratitude)`. These are any pieces of text within your notes with the format: “Gratitude:: \[your gratitude here\]”
	- For each page with a `gratitude` field, it pushes each gratitude item into the `gratitudes` array along with a reference to the page.
2. **Random Selection**:
	- A random gratitude message is selected from the `gratitudes` array using `Math.floor(Math.random()*gratitudes.length)`.
3. **Display Output**:
	- The code generates a paragraph (`dv.paragraph`) that displays the randomly selected gratitude, along with a link back to the source page where the gratitude was found.

### Daily Quote & Goals for this week

![Obsidian Daily Template with quote and goals](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/quoteAndGoals_hu8dafd3e5a03ea1925dd0c6171e666f44_120061_330x0_resize_q75_h2_box_3.webp)

Obsidian Daily Template with quote and goals

The next section fetches a random daily quote from the web and displays it in the daily note using Templater. Keep in mind that the API used in the background ([quotable](https://github.com/lukePeavey/quotable)) can occasionally go down, which may result in an “Error generating daily quote” message instead of the quote.

Below that, I’ve set it up to fetch the goals for the current week from the weekly note and display them in the daily note.

Templates/Daily Template

```
79
80
81

<% tp.web.daily_quote() %>

![[Journal/Weekly/<%moment(tp.file.title).format("gggg-[W]WW")%>#Goals for this week:]]
```

- `![[...]]`: Obsidian syntax for embedding a link to another note within your current note. The exclamation mark (!) at the beginning means that the link will be displayed as an embedded preview rather than just a link.
- `Journal/Weekly/<%moment(tp.file.title).format("gggg-[W]WW")%>#Goals for this week`: This dynamically generates the path to the target file by getting the date from the current daily note title and formatting it to match the filename of the weekly note.
- `#Goals for this week`: This part specifies the heading within the target file that contains the goals.

Any changes made to the “Goals for this week” section in your weekly note will automatically update in all daily notes linked to that week. You can also mark a goal as complete directly from the daily notes.

### Todoist integration

![Obsidian Todoist integration](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/todoist_hu6a7e81f7322b6d405d546666d640ff37_95876_330x0_resize_q75_h2_box_3.webp)

Obsidian Todoist integration

The next section allows you to fetch your Todoist tasks for the day and display them in your daily note. You can add new tasks to your Todoist account from within Obsidian by clicking the `+` button. This requires the Todoist plugin to be installed and configured with your Todoist account.

The highlighted line can be modified to filter tasks by project, due date etc. My filter is set to show all tasks that are not in the “Work” project and that are due before tomorrow.

Templates/Daily Template

```
1
2
3
4
5
6
7
8
9

> [!todo]- Tasks of the day

>\`\`\`todoist  

>name: '' 

>filter: "(!#Work) & due before: tomorrow"

>sorting:  

>- date  

>- priority  

>group: true  

>\`\`\`
```

The `> [!todo]` statement is optional but enables the Obsidian callout formatting i.e. the box around the tasks. The dash after `> [!todo]` tells Obsidian to default to having the block collapsed when the note is opened.

### Highlights/learnings of the day:

![Obsidian highlights of the day](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/highlights_hub4361e732787b7122398a6602bcd5ea0_144056_330x0_resize_q75_h2_box_3.webp)

Obsidian highlights of the day

These sections (and similar ones below) are where I document my learnings, highlights, and other reflections for each day. I’ve found that writing these down regularly encourages more thoughtful reflection. If you have multiple learnings or highlights in a day, add them in the same format, e.g., “Highlight:: \[your highlight here\]”. The double colon is recognised by Dataview as a field and ensures that your entries filter through to other notes.

### Kindle and podcast highlights

![Obsidian random kindle highlights and random notes](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/kindleAndPodcast_hu41ed93b5fd5e90bba83fbe45b82110fd_265591_330x0_resize_q75_h2_box_3.webp)

Obsidian random kindle highlights and random notes

The next section of the daily note template displays a random highlight from my collection of Kindle and podcast notes. I added this feature because I found it challenging to keep track of all the highlights I made from podcasts and Kindle notes, and I thought it would be helpful to fetch a random one each day to bring past highlights back to mind.

This requires your underlying notes to be formatted with the “Kindle:: \[your highlight here\]” or “Podcast:: \[your learning here\]” fields.

![Obsidian random kindle highlights and random notes](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/kindleHighlights_hu92c3398b2e91b348bcd0431549b4ad5d_174222_330x0_resize_q75_h2_box_3.webp)

One of my Kindle notes (Kindle/Paul Graham Essays)

This is easy to achieve automatically for all your kindle notes by using the [Obsidian Kindle Plugin](https://github.com/hadynz/obsidian-kindle-plugin) to sync your kindle notes to Obsidian, along with a template like this:

![Obsidian random kindle highlights and random notes](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/kindlePluginTemplate_hu4aebd7ed3e0cebf5268354414b468326_58409_330x0_resize_q75_h2_box_3.webp)

Kindle plugin settings

### Random notes and files created on this day

![Obsidian random kindle highlights and random notes](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/randomNotes_hu2b645dd36eeb38b6782ce483f6e36a99_60960_330x0_resize_q75_h2_box_3.webp)

Obsidian random kindle highlights and random notes

The final section of the daily note template displays 3 random notes from your vault. I’ve found this useful for recalling concepts or ideas I’ve noted down in the past. Once again, we rely on DataviewJS to fetch the random notes. The highlighted lines are used to exclude certain folders (like Journal, Templates, Assets etc), but you can add more exclusions as needed.

Templates/Daily Template

```
1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
13
14
15
16
17

\`\`\`dataviewjs

const noOfNotes = 3

app.vault.getFiles()

const files = app.vault.getFiles().filter(f => !f.path.includes ("Journal") 

    && !f.path.includes("Templates") && !f.path.includes ("textgenerator") 

    && !f.path.includes("Assets"))

const random = Math.floor(Math.random() * (files.length - 1))

const randomNote = files[random]

for (let i = 0; i < noOfNotes; i++) {

  const random = Math.floor(Math.random() * 

                            (files.length - 1))

  const randomNote = files[random] 

  dv.paragraph('[[' + randomNote.basename + ']]')

  }

\`\`\`
```

The “Files created on this day” section lets you see all the notes you created on this day. Not the most useful, but it’s a nice feature to have when going through old daily notes.

Templates/Daily Template

```
1
2
3
4

> [!note]- Files created on this day

>\`\`\`dataview  

>LIST WHERE file.cday = date(this.file.name)

>\`\`\`
```

## Weekly template explained

![Weekly note template in Obsidian](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/weeklyHead_hu7a84847cfed149059495924f45768cd6_258040_330x0_resize_q75_h2_box_3.webp)

Weekly note template

As you move from the daily notes to the weekly notes, you’ll notice that less manual input is required, since most of the data is already captured in the daily notes. While the daily note template is where I track my day-to-day activities and habits, the weekly note template is primarily used to monitor my goals for the current week. Any changes made to the “Goals for the week” section will automatically reflect in all daily notes linked to that week. I also link to my monthly goals from the monthly note template to track progress over a longer period.

Similar to the daily template, I have a Dataview table visualization that displays all the habits I’m tracking in the daily notes, allowing me to quickly assess my progress for the week. I found that I stuck to my habits more consistently when I knew big red crosses would be staring at me every time I opened my weekly note.

![Templater settings](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/weeklyAttributesVisual_hu6e9c17d3e841437ea648122fb9a40e86_178087_330x0_resize_q75_h2_box_3.webp)

Dataview visualisation of daily note attributes within the weekly note template

As before, the highlighted lines can be customized with any symbols or emojis you prefer.

Templates/Weekly Template

```
1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
13
14
15

\`\`\`dataview

table without id

    file.link AS "Date",

    mood + " #_/habits" AS "🌄",

    sleep AS "🛌",

    prayer AS "🙏",

    choice(meditation,"✅","❌") AS "🧘‍♂️",

    choice(exercise,"✅","❌") AS "🏃‍♂️",

    choice(study,"✅","❌") AS "📚", 

    choice(stretch,"✅","❌") AS "🤸",

    choice(nocomplaint,"✅","❌") AS "🤷‍♂️"

from "Journal/Daily"

where week = "<% moment(tp.file.title).format("gggg-[W]ww")%>"

sort file.name ASC

\`\`\`
```

## Monthly template explained

![Monthly note template](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/monthlyHead_hub29ac8a1147c1dfc1779d1d378d326dc_151606_330x0_resize_q75_h2_box_3.webp)

Monthly note template

Similar to the weekly note template, the monthly note template is where I track my goals for the current month. These goals are also the only manual input required in this template each month. Any changes made to the “Goals for the month” section will automatically reflect in all weekly notes linked to that month.

Below that, I have a Dataview query that lists memorable days from the current month, which helps in quickly recalling significant events or achievements from the month.

![Monthly note template in Obsidian](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/monthReview_hu5f1c4ae025a2804940b8e5247874591b_101965_330x0_resize_q75_h2_box_3.webp)

Monthly note template in Obsidian

The list is generated by searching for pages in the vault that have an `alias` property in the metadata, and then checking if the `month` field matches the current month.

Templates/Monthly Template

```
1
2
3
4
5
6
7
8

\`\`\`dataview

TABLE aliases

FROM "Journal"

WHERE aliases != null

AND file.day.year = number(substring(this.file.name, 0, 4))

AND dateformat(date(file.name), "yyyy-MM") = replace(this.file.name, "M", "")

SORT file.day

\`\`\`
```

Below this, I have Dataview queries that list all the daily learnings and highlights from the current month. It’s a great way to reflect on what you’ve learned and revisit the highlights you’ve noted throughout the month.

![Monthly note template in Obsidian](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/monthLearning_huc0f31ff8787d60f200d5d9886e9b0d1a_98550_330x0_resize_q75_h2_box_3.webp)

Monthly note template in Obsidian

Templates/Monthly Template

```
1
2
3
4
5
6
7
8

\`\`\`dataview

TABLE WITHOUT ID file.day.weekyear AS Week, learning

FROM "Journal/Daily"

WHERE learning != null

AND file.day.year = number(substring(this.file.name, 0, 4))

AND dateformat(date(file.name), "yyyy-MM") = replace(this.file.name, "M", "")

SORT file.day

\`\`\`
```

## Yearly template explained

![Monthly note template in Obsidian](https://vaultofjosh.com/blog/obsidian-periodic-notes/images/yearlyNote_hud71ba36cfa08aaf62fdb25bc809e325a_351943_330x0_resize_q75_h2_box_3.webp)

Monthly note template in Obsidian

Finally, the yearly note template offers an overview of the attributes I track in my daily notes. It’s a great way to monitor long-term progress and identify trends or patterns. This note is fully automated and requires no manual input once the template is set up.

We use DataviewJS to fetch data from the daily notes, and the *Charts* or *Heatmap* plugins to visualize it. You’ll just need to adjust the highlighted lines to match the attributes you’re tracking.

Templates/Yearly Template

```
1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47

\`\`\`dataviewjs

dv.span("**🏋️ Exercise 🏋️**")

const currentYear = Number(dv.current().file.name.match(/\d{4}/)?.[0]);

const calendarData = {

    year: currentYear,

    colors: {

        red: ["#ff9e82","#ff7b55","#ff4d1a","#e73400","#bd2a00",]

    },

    entries: []

}

for(let page of dv.pages('"Journal/Daily"').where(p=>p.exercise)){

    calendarData.entries.push({

        date: page.file.name,

        intensity: page.exercise

    })    

}

renderHeatmapCalendar(this.container, calendarData)

\`\`\`

\`\`\`dataviewjs  

dv.span("**Sleep Log**")  

// Extract the year from the current file name 

const currentYear = dv.current().file.name.match(/\d{4}/)?.[0]; 

// Filter pages to include only those that match the current year

const pages = dv.pages('"Journal/Daily"') .where(p => p.file.name.includes(currentYear)) .sort(p => p.file.name); 

const dates = pages.map(p => p.file.name).values  

const sleeps = pages.map(p => p.sleep).values  

const chartData = {  

type: 'line',  

data: {  

labels: dates,  

datasets: [{  

label: 'Sleep',  

data: sleeps,  

backgroundColor: [  

'rgba(53, 252, 167, 1)'  

],  

borderColor: [  

'rgba(138, 102, 204, 0.8)'  

],  

borderWidth: 1.5,  

spanGaps: true,  

}],  

},  

};  

window.renderChart(chartData, this.container)  

\`\`\`
```

## Wrapping up

I hope you found this guide helpful! I didn’t anticipate the walkthrough to be this detailed, but I hope it clarified the various components of my daily, weekly, monthly, and yearly note templates. I think of my periodic notes as a second homepage (my actual dashboard might gets its own blog post!). They’ve been invaluable in helping me stay on top of my habits, goals, and more.

If you have any questions or feedback, please feel free to leave a comment below.

[^1]: Credit to [ljavuras](https://github.com/ljavuras/obsidian-power-tools/tree/main/Filename%20Template) for filename\_template.md

[^2]: Getting the code block formatting right for this post required a deep dive into TailwindCSS, Javascript and the inner workings of Hugo, but it will make for a good future blog post.