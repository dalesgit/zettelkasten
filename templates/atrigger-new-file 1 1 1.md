---
tags: [ma222]
---
<%*
  // Prompt for the title
  let title = await tp.system.prompt('Enter title name');
  
  // Rename the file to the entered title
  //await tp.file.rename(title);
%>
<% await tp.file.move("Poetry/" + tp.file.title) %>
<% tp.config.target_file.basename %>
# [[<% tp.file.title %>]]


---

Place holder text that will proceed here.