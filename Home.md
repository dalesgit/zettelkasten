---
tags:
aliases:
created: 2023-11-21, 20:38
modified: 2025-03-30, 16:03
banner: "![[IMG_0319.png]]"
banner_x: 0.5
lead: Startpage for Zettelkasten. To be revised if necessary.
visual: "![[image.jpg]]"
template_type: Structure
template_version: "1.12"
view_count: 185
---

[Home](Home.md) | [ARCO](ARCO%20View.md) |  [Inspect](Inspect%20View.md) 
This query gives a random quote (tagged "quote")
```dataviewjs
const numberToShow = 1; 
const notes = dv.pages('#quote') 
	.sort(() => 0.5 - Math.random()) 
	.slice (0, numberToShow) 
	.map (note => `![[${note.file.name}]]`); 
dv.span(notes);   
```

[[an-old-query-from-Home-page]]
