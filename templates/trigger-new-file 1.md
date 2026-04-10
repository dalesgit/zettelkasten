<%*
  let title = tp.file.title;
  if (title.startsWith("Untitled")) {
    title = await tp.system.prompt("Enter note title");
    await tp.file.rename(title);
  }
%>   