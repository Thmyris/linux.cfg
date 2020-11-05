# Completion scripts

To be more productive with GMTool, you can install a completion script for your
shell. We provide completion scripts for Bash and Zsh shells.

## Installation

In this document we refer to two directories: `<GMTOOL_DIR>` and
`<COMPLETION_DIR>`.

`<GMTOOL_DIR>` is the path to the `gmtool` binary:
- On Linux and Windows this is where you installed Genymotion.
- On macOS this is `/Applications/Genymotion.app/Contents/MacOS` by default.

`<COMPLETION_DIR>` is the directory containing this README file. You can copy
it wherever you want on your machine.

### Requirements

To take advantage of shell completion, the `gmtool` binary and the `vboxmanage`
binary (provided by VirtualBox) should be in your PATH.

- For `gmtool`, add `<GMTOOL_DIR>` to `$PATH`.
- For `vboxmanage`, add your VirtualBox installation directory to `$PATH`.

### Installing the Bash completion script

Add this line to the end of your `~/.bashrc`:

    . <COMPLETION_DIR>/bash/gmtool.bash

Completion works with Bash 3.2 or later, but we recommend using at least version
4.0, especially if you work with file names which contain spaces.

### Installing the Zsh completion script

Open your `~/.zshrc` and add this line *before* the call to `compinit`:

    fpath=(<COMPLETION_DIR>/zsh $fpath)
