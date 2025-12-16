---
created: 2025-11-18T07:31:22 (UTC -05:00)
tags: [minimalist,blog,hugo,developer,software,writing]
source: https://kevinquinn.fun/blog/get-started-with-obsidian-periodic-notes-and-templater/
author: 
---

# Get Started With Obsidian Periodic Notes and Templater | Kevin Quinn

> ## Excerpt
> Configure Obsidian for seamless daily notes by adding the Periodic Notes, Templater, and Calendar community plugins.

---
###### UPDATED: APR 27, 2023 | PUBLISHED: DEC 10, 2021 | 1.61k words, 8 minute read — [GUIDES](https://kevinquinn.fun/categories/guides/)

###### [#OBSIDIAN](https://kevinquinn.fun/tags/obsidian/), [#OBSIDIAN-PLUGINS](https://kevinquinn.fun/tags/obsidian-plugins/), [#PERSONAL-DEVELOPMENT](https://kevinquinn.fun/tags/personal-development/)

-   [Daily Notes Steps](https://kevinquinn.fun/blog/get-started-with-obsidian-periodic-notes-and-templater/#daily-notes-steps)
-   [Extra Credit](https://kevinquinn.fun/blog/get-started-with-obsidian-periodic-notes-and-templater/#extra-credit)
    -   [Navigation Bar](https://kevinquinn.fun/blog/get-started-with-obsidian-periodic-notes-and-templater/#navigation-bar)
    -   [Period Completion Percentage](https://kevinquinn.fun/blog/get-started-with-obsidian-periodic-notes-and-templater/#period-completion-percentage)
    -   [Colorful Year Timeline](https://kevinquinn.fun/blog/get-started-with-obsidian-periodic-notes-and-templater/#colorful-year-timeline)
    -   [Other Plugins](https://kevinquinn.fun/blog/get-started-with-obsidian-periodic-notes-and-templater/#other-plugins)
-   [Fin](https://kevinquinn.fun/blog/get-started-with-obsidian-periodic-notes-and-templater/#fin)

I’ve enjoyed tracking my daily notes in Obsidian so far, but it was a bit more complicated to get configured than I thought it would be, so I’m sharing it here to hopefully make setup smoother for those in the future - as well as a few [extra credit](https://kevinquinn.fun/blog/get-started-with-obsidian-periodic-notes-and-templater/#extra-credit "extra credit") pieces I’ve picked up along the way.

> 🛑 _Realizing you don’t want to set everything up just yet? There’s [a few must have plugins](https://kevinquinn.fun/blog/obsidian-plugins-for-the-casual-user/ "a few must have plugins") that require **0** fiddling and make Obsidian **10x** easier to use, even without daily notes._

## Daily Notes Steps

1.  Create a folder for the periodic notes (`periodic_notes`), and then a sub folder for each of the time periods you want to use, .e.g `periodic_notes/daily`. You can choose whatever naming scheme you like.
2.  Create a folder for Templates, then a base template file for each period you will be using. Naming doesn’t matter for this, I chose the creative `Templates`.
3.  [Enable community plugins](https://help.obsidian.md/Advanced+topics/Community+plugins "Enable community plugins") and install Calendar, Periodic Notes, and Templater.
4.  Open settings and enable all the plugins.
5.  Open the sub-settings for Periodic Notes and enable all the time periods you will use. Feel free to adjust any of the file naming conventions, for me, I updated the weekly format to `gggg-[W]WW` to match my navigation bar template.

6.  Open the Templater sub-settings, then set your `Template folder location` to what you created in Step 2.
7.  Enable `Trigger Templater on new file creation`.
8.  Under `Folder Templates`, connect each of the periodic folders you created in Step 1 to the base template files from Step 2.

Now, whenever a new file is created in any of those folders, it will run Templater first. The Calendar sidebar is a handy tool for easily selecting any day’s file vs the Command Palette/File search .

You’ve got the basics set up, now bump it up a notch. Add a [Navigation Bar](https://kevinquinn.fun/blog/get-started-with-obsidian-periodic-notes-and-templater/#navigation-bar "Navigation Bar") , [Period Completion Percentage](https://kevinquinn.fun/blog/get-started-with-obsidian-periodic-notes-and-templater/#period-completion-percentage "Period Completion Percentage") , and/or [other fun plugins](https://kevinquinn.fun/blog/get-started-with-obsidian-periodic-notes-and-templater/#other-plugins "other fun plugins") .

### Navigation Bar

It’s a bit overkill, but I originally saw this on the [Obsidian Reddit](https://www.reddit.com/r/ObsidianMD/comments/my4ns4/planning_for_the_week_ahead_in_obsidian/ "Obsidian Reddit") and loved the idea of easily accessing not just the adjacent days, since Calendar plugin does that, but the other periods relevant for that day as well. Looks like this:

`❮❮ ⋮ 2021 › 12 › Q4 › W49 ⋮ ❯❯`

Want your own? This relies on your files having the date in the name, so as long as you are using Periodic Notes plugin and match up your chosen format setting with this code, you’ll be ready to rock. The section in the frontmatter sets up a number of variables, then later on the page I can access them.

```lua
---
<%*
var fileDate = moment(tp.file.title);
// moment dates are mutable
let prevDay = moment(fileDate).subtract(1, 'd').format('YYYY-MM-DD');
let nextDay = moment(fileDate).add(1, 'd').format('YYYY-MM-DD');
let yearLink = fileDate.format('YYYY');
let quarterLink = fileDate.format('YYYY-[Q]Q');
let monthLink = fileDate.format('YYYY-MM');
let weekLink = fileDate.format('gggg-[W]WW');
-%>
tags: daily_note <% fileDate.format("YYYYMMDD") %> <% weekLink %> <% monthLink %> <% quarterLink %> <% yearLink %>
weekday: <% fileDate.format("ddd") %>
---

<%*
// ❮❮ ⋮ 2021 › Q4 › 12 › W49 ⋮ ❯❯
// [[path/to/file|display_text]]
let navStr = `[[periodic_notes/daily/${prevDay}|❮❮]] ⋮ [[periodic_notes/yearly/${yearLink}|${yearLink}]] › [[periodic_notes/quarterly/${quarterLink}|${fileDate.format('[Q]Q')}]] › [[periodic_notes/monthly/${monthLink}|${fileDate.format('MM')}]] › [[periodic_notes/weekly/${weekLink}|${fileDate.format('[W]WW')}]] ⋮ [[periodic_notes/daily/${nextDay}|❯❯]]`;
tR += navStr
%>
```

### Period Completion Percentage

I’m a visual person, so it’s very handy for me to be able to see how far through the week/month/year I currently am. Can’t pretend you have plenty of time left if the ticker says 95% finished.

```makefile
Month: [██████████◽◽◽◽◽◽◽◽◽◽◽◽◽◽◽◽◽◽◽◽◽] 32% ( 10/31 )
Year: [███████████████████████████████◽◽] 94% ( 344/365 )

# Alternative
⊡⊡⊡⊡⊡⊡⊡⊡⊡⊡⊡⊡⊡⊡⊡⊡⊡⊡⊡⊡⊡⊡·········31|
```

Since I use the progress bar in a number of places, I have it stored as a Templater user function. To use mine specifically (else just copy the `function` in any Templater block you want it):

1.  create a folder in the vault for functions, then edit Templater settings to point to it.
    
2.  Create a `makeProgressBar.js` file in that folder and fill it with contents below.
    
    ```javascript
    function makeProgressBar(numerator, denominator, size = 50, filledChar = "█", unFilledChar = "◽", label="") {
        let percentage = numerator / denominator;
        let maxBlocks = size;
        let numFilled = Math.floor(percentage*maxBlocks)
        return `${label}: [${filledChar.repeat(numFilled)}${unFilledChar.repeat(maxBlocks-numFilled)}] ${Math.floor(percentage*100)}% ( ${numerator}/${denominator} )`
    }
    
    module.exports = makeProgressBar;
    ```
    
3.  Restart Obsidian, in the settings for Templater you should see it loaded your function.
    
4.  Now you can use it in your Daily Notes (or elsewhere) like so:
    
    ```csharp
    ---
     <%*
     var fileDate = moment(tp.file.title);
     ---
     ^^❗need this variable in the frontmatter section to get date from page name^^
    
     .... page contents .....
    
    <%* 
    function month() {
        let fileDateNum = fileDate.date();
        let numDays = fileDate.daysInMonth();
        // ignore leapyears
        tR += tp.user.makeProgressBar(fileDateNum, numDays, size=numDays, filledChar = "█", unFilledChar = "◽", label="Month");
    }
    month();
    -%>
    
    <%* 
    function year() {
        let dayNum = fileDate.dayOfYear();
        // ignore leapyears
        tR += tp.user.makeProgressBar(dayNum, 365, size=33,filledChar = "█", unFilledChar = "◽", label="Year");
    }
    year();
    %>
    
    # Blah Regular Content
    This is regular content to show you you can place the progress bars wherever.
    ```
    

### Colorful Year Timeline

If you want something more colorful with less work than the progress bars, there is an awesome [discussion on the Obsidian forum on how to use an SVG to create a beautiful timeline](https://forum.obsidian.md/t/svg-year-timeline-in-your-daily-note/31418 "discussion on the Obsidian forum on how to use an SVG to create a beautiful timeline") .

![Colorful Year Timeline with Day Marker](https://kevinquinn.fun/uploads/obsidian-forum-colorful-svg.png#center)

It requires the Daily Notes plugin, but you don’t have to set up any functions to make it work, just paste the svg code into your Daily template file. The ‘Day Marker’ is based off the day of the year. [From the MomentJs Docs](https://momentjs.com/docs/#/displaying/format/ "From the MomentJs Docs") :

> `DDD` = Day of Year = 1,2,3…365

Since I configure my notes from the date in file name & not the current day, I had to make a small adjustment to the marker:

### Other Plugins

If you’re interested in gleaning insights from Daily Notes over time, e.g. habit summaries in each Weekly Note, average number of hours you worked per day, pulling in summaries of tasks across many files, then I highly recommend adding the plugins [Dataview](https://blacksmithgu.github.io/obsidian-dataview "Dataview") and [Tracker](https://github.com/pyrochlore/obsidian-tracker "Tracker") . I have barely dipped my toes into what they can do and can already see huge potential to get a better understanding of my moods, habits, and more. There’s some great Dataview inspiration on the [Obsidian forum](https://forum.obsidian.md/t/dataview-plugin-snippet-showcase/13673/190 "Obsidian forum") . Emoji habit tracker, anyone? Didn’t do so hot on the example week 😬, oops.

![Weekly habit tracker with emoji symbols](https://kevinquinn.fun/uploads/weekly-emoji-habit-example.png#center)

## Fin

You should be all set with a basic configuration for taking Periodic Notes in Obsidian with Templater - though now that you have such a powerful tool, the sky is the limit. Get creative with daily rituals, morning routines, and the many community plugins available in Obsidian. To stay up to date with all the wild new happenings in the Obsidian world, make sure to check out the [Obsidian Roundup](https://www.obsidianroundup.org/ "Obsidian Roundup") .It’s a fantastic newsletter for finding plugins and new ways to use this awesome tool.

If you have any questions or feedback, feel free to reach out to me on [Twitter](https://twitter.com/maybekq "Twitter") .

  

We won't send you spam. Unsubscribe at any time.

### See Also

-   [Obsidian Plugins for the Casual User](https://kevinquinn.fun/blog/obsidian-plugins-for-the-casual-user/)
    
    APR 9, 2022, 3 minute read — [GUIDES](https://kevinquinn.fun/categories/guides)
    
    Plugins to make Obsidian as comfortable as other note apps, aimed at those who want tools that don’t need tinkering.
    
-   [Personalize your Development Environment with Dotfiles](https://kevinquinn.fun/blog/personalize-your-development-environment-with-dotfiles/)
    
    DEC 16, 2021, 6 minute read — [GUIDES](https://kevinquinn.fun/categories/guides)
    
    With a few small tweaks, take the default terminal and make it uniquely yours - then watch your dotfiles evolve as you find new tricks for your toolkit.
    
-   [Set Up Pi-hole Ad Blocker on Raspberry Pi Zero with a Netgear Router](https://kevinquinn.fun/blog/set-up-pi-hole-ad-blocker-on-raspberry-pi-zero-with-a-netgear-router/)
    
    DEC 11, 2021, 3 minute read — [GUIDES](https://kevinquinn.fun/categories/guides)
    
    Learn how to set-up the Pi-hole ad blocker on a headless Raspberry Pi Zero and connect your Android and Windows devices for maximum adblock protection!
    
-   [Make Your Own Venmo Wrapped](https://kevinquinn.fun/blog/venmo-wrapped/)
    
    JAN 4, 2023, 5 minute read — [GUIDES](https://kevinquinn.fun/categories/guides)
    
    Not overwhelmed yet by all the Spotify Wrapped clones? Follow along to make your own Venmo Wrapped!
    
-   [How to Self-Host n8n on Fly.io](https://kevinquinn.fun/blog/how-to-self-host-n8n-on-fly/)
    
    OCT 4, 2022, 5 minute read — [GUIDES](https://kevinquinn.fun/categories/guides)
    
    A simple guide to self-host n8n in just a few minutes on fly.io.
