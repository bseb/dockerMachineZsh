# dockerMachineZsh
Oh-my-zsh plugin that provides helper functions for working with docker machine.

- dm-activate activates created Docker machine, set related environment variables and updates PROMPT to reflect running machine.

- dm-create creates a new docker machine, sets environment variables and updates PROMPT to reflect running machine.

- dm-deactivate stops current running Docker machine and unsets environment.

- dm alias for docker-machine

## Installation

- To install in oh-my-zsh clone this repo into
 ~/.oh-my-zsh/plugins and add docker-machine to the plugins section of your zshrc.  
- If you're not using oh-my-zsh then source this file in your zshrc by adding "source /path/to/docker-machine.zsh.plugin"
- Using Antigen add the following to your .zshrc
  ```
  antigen bundle bseb/dockerMachineZsh
  ```
