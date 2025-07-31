---
created: 2025-07-30 08:14
source: https://dannb.org/blog/2022/obsidian-daily-note-template/ & https://forum.obsidian.md/t/dataviewjs-snippet-showcase/17847/21?u=gibson
---
tags:: [[+Daily Notes]]

# Wednesday, July 30, 2025

```dataviewjs
/*
    previous/next note by date for Daily Notes
    Also works for other files having a `date:` YAML entry.
    MCH 2021-06-14
*/
var none = '(none)';
var p = dv.pages('"' + dv.current().file.folder + '"').where(p => p.file.day).map(p => [p.file.name, p.file.day.toISODate()]).sort(p => p[1]);
var t = dv.current().file.day ? dv.current().file.day.toISODate() : luxon.DateTime.now().toISODate();
// Obsidian uses moment.js; Luxon’s format strings differ!
var format = app['internalPlugins']['plugins']['daily-notes']['instance']['options']['format'] || 'YYYY-MM-DD';
var current = '(' + moment(t).format(format) + ')';
var nav = [];
var today = p.find(p => p[1] == t);
var next = p.find(p => p[1] > t);
var prev = undefined;
p.forEach(function (p, i) {
    if (p[1] < t) {
        prev = p;
    }
});
nav.push(prev ? '[[' + prev[0] + ']]' : none);
//nav.push(today ? today[0] : none);
nav.push(today ? today[0] : current);
nav.push(next ? '[[' + next[0] + ']]' : none);

//dv.list(nav);
//dv.paragraph(nav.join(" · "));
dv.paragraph(nav[0] + ' ← ' + nav[1] + ' → ' + nav[2]);
```
---
### 📅 Daily Questions
##### 🌜 From yesterday I could have done better … 
- 

##### 🙌 One thing I'm excited about right now is …
- 

##### 🚀 One+ thing I plan to accomplish today is …
- [ ] 

##### 👎 One thing I'm struggling with today is …
- 
# 📝 Notes
- /mnt/chromeos/MyFiles/Downloads/my-files-inbox/index-7-30-25.md [[my-files-inbox-7-30-25/index-7-30-25|index-7-30-25]] 
- [[funeral]] 
- [[feddeler funeral]] 
- [[Help us, we pray, in the midst of things we cannot understand, to believe and trust in the communion of saints, the forgiveness of sins, and the resurrection to life everlasting. Amen.]]
- [[raisins-contents]]

### another shot at a table (last week files)

```dataview 
TABLE file.ctime, file.mtime, file.tags, file.folder FROM "" 
WHERE file.mtime >= date(today) - dur(7d) 
```
---
### Notes created today
```dataview
List FROM "" WHERE file.cday = date("2025-07-30") SORT file.ctime asc
```

### Notes last touched today
```dataview
List FROM "" WHERE file.mday = date("2025-07-30") SORT file.mtime asc
```
