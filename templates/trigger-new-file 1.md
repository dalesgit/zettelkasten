---
tags: [ma222]
---
<%*
  // Prompt for the title
  let title = await tp.system.prompt('Enter title name');
  
  // Rename the file to the entered title
  await tp.file.rename(title);
%>

<%- title %>

---

Place holder text that will proceed here.