---
tags:
  - poetry
created: <% tp.file.creation_date() %>
alias: <% tp.file.title %>
---
<%*
  // Prompt for the title
  let title = await tp.system.prompt('Enter title name');
  
  // Rename the file to the entered title
  await tp.file.rename(title);
  tp.file.move("Poetry/" + tp.file.title) 
  %>

# [[<% tp.file.title %>]]


---

Place holder text that will proceed here.
