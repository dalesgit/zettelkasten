---
created: 2025-07-09 04:42
source: https://dannb.org/blog/2022/obsidian-daily-note-template/ & https://forum.obsidian.md/t/dataviewjs-snippet-showcase/17847/21?u=gibson
---
tags:: [[+Daily Notes]]

# Wednesday, July 09, 2025

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
- Deal with stressors. The car not starting caused a fair amount. N.B. my high glucose readings the past several days. #health 

##### 🙌 One thing I'm excited about right now is …
- The wireless noise-canceling headphones. [[MP]] may want some also, for flying.

##### 🚀 One+ thing I plan to accomplish today is …
- [ ]exercise
- 

##### 👎 One thing I'm struggling with today is …
- [[MP]] sent this prayer: 

---
# 📝 Notes
- "I try to not lie at funerals." (They're especially prone to clichés and platitudes.)  [[funeral]]

---
### Notes created today
```dataview
List FROM "" WHERE file.cday = date("2025-07-09") SORT file.ctime asc
```

### Notes last touched today
```dataview
List FROM "" WHERE file.mday = date("2025-07-09") SORT file.mtime asc
```
