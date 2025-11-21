---
tags:
  - poetry
created: <% tp.file.creation_date() %>
---

<%*
  // Prompt for the title
  let title = await tp.system.prompt('Enter title name');
  
  // Rename the file to the entered title
 await tp.file.rename(title); %>
 <%  tp.config.target_file.basename %>

 <%* await tp.file.move("Poetry/(title)" + tp.file.title)%>

