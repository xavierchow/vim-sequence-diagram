Vim Sequence-diagram Preview
====================

- [Intro](#intro)
- [Installation](#installation)
- [Usage](#usage)
- [License](#licnese)

Intro
-----
A Vim plugin for previewing sequence diagram in a browser. It's inspired with [vim-markdown-preview](https://github.com/JamshedVesuna/vim-markdown-preview)
and [JS Sequence Diagram](https://github.com/bramp/js-sequence-diagrams).

[JS Sequence Diagram](https://github.com/bramp/js-sequence-diagrams) is awesome! 
And its [online editing feature](https://bramp.github.io/js-sequence-diagrams/) is cool as well.
However, there're 2 drawbacks:

1. Online editing is opt to lost, especiall an unexpected browser fresh or history-back.
2. You have to copy&paste between the online web page and your text editor.

This vim plugin helps you hanlde the issues above, write your sequence defination in vim, press a hotkey to preview it in browser!


Installation
------------

* With [Pathogen](https://github.com/tpope/vim-pathogen): Place `vim-sequnce-diagram/` in `.vim/bundle/`.
* With [Vundle](https://github.com/VundleVim/Vundle.vim):
    * Add `Plugin 'xavierchow/vim-sequnce-diagram'` to your `.vimrc`.
    * Launch `vim` and run `:PluginInstall`

Usage
-----

The default keymap is `<leader>t`, it brings up a browser window and shows the sequence diagram for you.
You can also define your keymap in vimrc.
```
nmap <unique> <leader>t <Plug>GenerateDiagram 
```

License
-----------------

MIT

