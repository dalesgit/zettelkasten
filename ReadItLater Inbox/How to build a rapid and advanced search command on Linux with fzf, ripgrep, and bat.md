[[ReadItLater]] [[Article]]

# [How to build a rapid and advanced search command on Linux with fzf, ripgrep, and bat](https://www.howtogeek.com/how-one-bash-function-gives-me-real-time-search-across-thousands-of-files/)

[![4](https://static0.howtogeekimages.com/wordpress%2Fwp-content%2Fauthors%2F681d5801adcf2-folded_arms_1_500x500.jpg?fit=crop&w=90&h=90)](https://www.howtogeek.com/author/graeme-peacock/)

Published Feb 10, 2026, 7:00 AM EST

Graeme Peacock is a seasoned Linux expert with more than 15 years of hands-on experience. He has worked extensively with Ubuntu, Gentoo, Arch Linux, Qubes, and Fedora, gaining deep proficiency in everything from routine terminal operations to highly customized system builds.

Graeme began his journey with Ubuntu, quickly mastering the command line and essential system administration skills. A year later, he moved to Arch Linux, where he spent nearly a decade refining his expertise through the installation and configuration of multiple minimalist systems. After some time, he moved to Gentoo, where he configured and compiled both server and desktop environments using normal and hardened profiles and frequently compiled custom kernels. Graeme moved to Qubes in 2016, where he has remained ever since.

Graeme has extensive experience with highly configurable tools such as Vim, Neovim, and Emacs, and he maintains his own complex configurations. He is also highly proficient with Bash, Zsh, and dozens of utilities.

Graeme holds a B.S. in software engineering and has a strong passion for programming and web development. He is proficient in Golang, Python, Bash, JavaScript, TypeScript, HTML, and CSS. He also has considerable experience with Docker and is currently working on learning Kubernetes.

Do you spend most of your time in the terminal? If you do, you’ve probably encountered the classic find, grep, and cat commands when searching for files. However, I find these awkward to use and think they could be a lot better, and I have a command that delivers a much more advanced search experience.

I'll get right to the point. The following command builds upon and combines [fzf](https://www.howtogeek.com/these-fzf-tricks-will-transform-how-you-use-the-linux-terminal/), [ripgrep](https://www.howtogeek.com/alternative-cli-tools-i-immediately-install-on-linux/#ripgrep-grep-on-steroids), and [bat](https://www.howtogeek.com/alternative-cli-tools-i-immediately-install-on-linux/#bat-like-cat-but-better) to provide a modern and interactive search interface. Below I'll explain what each flag means, so you can modify it to suit your needs.

```
s() {
  : | fzf \
    --ansi \
    --disabled \
    --bind "change:reload:sleep 0.1; \
                  command rg --line-number \
                            --column \
                            --no-heading \
                            --color=always \
                            --smart-case {q} \
                            $* \
                  || :" \
    --bind "enter:execute:nano +{2},{3} {1}" \
    --bind "ctrl-o:become:nano +{2},{3} {1}" \
    --delimiter ":" \
    --preview "command bat --style=full \
                           --color=always \
                           --highlight-line {2} \
                           {1}" \
    --preview-window 'up:80%,border-bottom,~4,+{2}+4/3'
}
```

   ![An animation that demonstrates the fzf search script in action, showing interactive searching with ripgrep and a bat preview.-anim](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2026/02/an-animation-that-demonstrates-the-fzf-search-script-in-action-showing-interactive-searching-with-ripgrep-and-a-bat-preview-anim.gif?q=70&fit=crop&w=825&dpr=1)

## Bind ripgrep for powerful search capabilities

Let’s begin by looking at fzf’s “--bind” flag and how it associates events with external commands.

An event is a significant occurrence within fzf, for example, start, load, change, result, focus, etc. There are several available, so I refer you to [the manual](https://man.archlinux.org/man/fzf.1.en) for more.

```
man fzf
```

The “change” event allows us to execute (“reload”) a command when the query passed to fzf changes. In the following example, “{q}” is whatever we type into fzf:

```
fzf --bind "change:reload:echo {q}"
```

   ![An fzf window displays a single result from the echo command. The query and result both read It reloads echo when the query changes.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2026/02/an-fzf-window-displays-a-single-result-from-the-echo-command-the-query-and-result-both-read-it-reloads-echo-when-the-query-changes.png?q=70&fit=crop&w=825&dpr=1)

We can replace echo with any command:

```
fzf --bind "change:reload:rg {q}"
```

   ![An fzf window displays ripgrep search results for the query foobar. Two matching lines from different files are shown.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2026/02/an-fzf-window-displays-ripgrep-search-results-for-the-query-foobar-two-matching-lines-from-different-files-are-shown.png?q=70&fit=crop&w=825&dpr=1)

Let's build up that example and make ripgrep more useful:

```
--bind "change:reload:sleep 0.1; \
              command rg --line-number \
                         --column \
                         --no-heading \
                         --color=always \
                         --smart-case {q} \
                         $* \
              || :" \
```

The “change:reload:sleep 0.1” is called a debouncer, and it’s used to prevent an excessive flood of command executions. When you type without one, fzf reloads the command immediately, causing expensive re-executions upon every key press. If we sleep for 100 ms first, keystrokes interrupt that instead. Longer delays will execute “rg” as normal.

The “command rg” part executes “rg” with no shell modifications (e.g., an [alias](https://www.howtogeek.com/439736/how-to-create-aliases-and-shell-functions-on-linux/)). This keeps the result layout predictable, so we can process it with fzf.

The “--column” flag causes ripgrep to include a column number in the results. We’ll use it to help open a text editor at the matched line and column.

Since ripgrep is the main search component, we probably want a way to quickly configure it when performing a search. The “$\*” allows us to do that by passing any arguments directly to it—like a file path.

The other flags, “--no-heading,” “--color=always,” and “--smart-case,” are quality-of-life features. Smart case means only filter results by case if the query contains uppercase letters.

For colors to display correctly in fzf, provide it with the “--ansi” flag. Also, “--disabled” prevents fzf from applying its own filtering to the results, leaving the search entirely to ripgrep. Essentially, fzf will no longer recognize special symbols like “^,” but ripgrep will.

Lastly, the “|| :” at the end of the command is the same as “|| true.” It’s a little trick to swallow errors returned from a command. It prevents ripgrep from causing fzf to exit.

## Bind a text editor and jump quickly to results

When you press a key on a selected result, you probably want it to do something, like open a text editor—these two lines do that:

```
--bind "enter:execute:nano +{2},{3} {1}" \
--bind "ctrl-o:become:nano +{2},{3} {1}"
```

The first “bind” expression executes Nano after pressing Enter, but the second opens it differently after pressing the Ctrl+O keys.

The difference between “execute” and “become” is that “become” replaces the fzf process, but “execute” does not. In simple terms: when you quit the text editor, “execute” will exit back to the fzf menu, but “become” exits to the shell. There are dozens of these actions detailed in the fzf manual.

The “+{2},{3} {1}” part opens a file at a specific line and column. It’s a mix of Nano command syntax and fzf placeholder values. You can try it in your terminal yourself:

```
nano +10,30 foo.txt  # Line 10, column 30.
```

In the fzf command, the curly brace syntax (e.g., “{1}”) represents placeholder values. The numbers represent the Nth column in the result window.

   ![An fzf window displays ripgrep results. Numbered arrows point to the four colon-separated columns in each result - file path, line number, column number, and matched text.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2026/02/an-fzf-window-displays-ripgrep-results-numbered-arrows-point-to-the-four-colon-separated-columns-in-each-result-file-path-line-number-column-number-and-matched-text.png?q=70&fit=crop&w=825&dpr=1)

1.  The file path: “{1}”.
2.  The line number (provided by “rg --line-number”): “{2}”.
3.  The column number (provided by “rg --column”): “{3}”.
4.  The matching text, but we can ignore this.

To open files at a specific location with Vim and Neovim, use:

```
--bind "enter:execute:nvim '+call cursor({2},{3})' {1}" \
--bind "ctrl-o:become:nvim '+call cursor({2},{3})' {1}"
```

For Emacs, use:

```
--bind "enter:execute:emacs +{2}:{3} {1}" \
--bind "ctrl-o:become:emacs +{2}:{3} {1}"
```

## Use the “--preview” flag to display rich results

Fzf makes choosing a result lightning fast, but it’s much better with a preview window. We’ll use bat because it has a rich set of display options.

```
--preview "command bat --style=full \
                       --color=always \
                       --highlight-line {2} \
                       {1}"
```

We can control what the preview window looks like with “--style.” The “full” option displays everything, which includes line numbers, a file header, and borders. See bat’s man page for a complete list of options.

The “--highlight-line” flag emphasizes the matched line, and we get the line number from “{2}.”

Lastly, we provide bat the file path (“{1}”) so bat can read the data.

### \--preview-window

The next flag, “--preview-window,” controls the layout:

```
--preview-window 'up:80%,border-bottom,~4,+{2}+4/3'
```

It looks complicated, but when broken down, it’s not.

The order of these segments is flexible. Fzf can determine what they do, based on syntactical elements like “~” or “+.” The general form I used is `position:size,border-style,fixed-header,scroll-offset`.

The “position” defines where the preview window goes: up (top), down (bottom), left, or right. The “size” defines what percentage of the window it occupies.

The “border-style” displays a border that separates the preview window from everything else. I think “border-bottom” is a sensible value:

   ![An fzf window with a bat preview on top and search results on the bottom, separated by a border-bottom style divider. An arrow points to the border.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2026/02/an-fzf-window-with-a-bat-preview-on-top-and-search-results-on-the-bottom-separated-by-a-border-bottom-style-divider-an-arrow-points-to-the-border.png?q=70&fit=crop&w=825&dpr=1)

The “fixed-header” segment makes the preview window display a few metadata lines at the top, with “~4” defining the exact number. We use this to display the bat header permanently (activated with “--style=full”).

The “scroll-offset” segment controls where the highlighted line goes in the preview window.

   ![An fzf window with a bat preview pane and search results. The preview pane displays a file with a highlighted line, and the matched lines are highlighted in the results below.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2026/02/an-fzf-window-with-a-bat-preview-pane-and-search-results-the-preview-pane-displays-a-file-with-a-highlighted-line-and-the-matched-lines-are-highlighted-in-the-results-below.png?q=70&fit=crop&w=825&dpr=1)

Earlier, we defined it using “+{2}+4/3”:

-   The first “+,” I assume, defines the segment as a scroll offset.
-   The “{2}” is the line number placeholder provided by fzf, so we’re telling bat where to go in the file.
-   The “+4” offsets the display by four lines to account for the “~4” line header.
-   The “/3” tells fzf to display the highlighted line at the top 1/3 of the screen.

I’ve found that a value of “1/3” displays the highlighted line roughly in the middle of the preview window, despite the manual claiming otherwise. It took some tweaking, but it looks good.

 ![Ghostty terminal logo and the Linux mascot as a ghost around it.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/01/ghostty-terminal-logo-and-the-linux-mascot-as-a-ghost-around-it.jpg?q=49&fit=crop&w=220&h=182&dpr=2)

Related

---

Now, place the script in your [bashrc](https://www.howtogeek.com/the-linux-bashrc-file-explained/), or shell configuration file, and reload it. Execute it by typing "s," and start typing a query. You can pass any ripgrep flags to it, including a path:

```
s --search-zip ~/
```

Also, note that the “: | fzf” (at the beginning of the command) prevents fzf from initially displaying files from the current working directory. It simply pipes a null.

The major flaw with this command is the lack of [*indexing*](https://en.wikipedia.org/wiki/Database_index). An index of your entire file system contents would be huge and would take forever to build. Despite that, ripgrep still makes quick work of raw searches, which is impressive. I’d advise you pass ripgrep a path to narrow the search scope. Also, pass it some flags to filter out unnecessary files. Both should significantly speed up searches.

 ![Konsole Terminal open on the Kubuntu Focus Ir14 Linux laptop.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2024/08/52972123178_c7bc15383d_o.jpg?q=49&fit=crop&w=220&h=182&dpr=2)

Related