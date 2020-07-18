# openai.vim

A vim plugin for auto-completing a line of text with 
[OpenAI's GPT-3 API](https://openai.com/blog/openai-api/).

> **NOTE:** This was more like a fun experiment if you are looking for fully
> functional AI-powered completion check out 
> [Codata](https://www.codota.com/)'s [TabNine Vim Plugin](https://www.tabnine.com/install/vim/).

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Installation](#installation)
- [Usage](#usage)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Installation

This plugin follows the standard runtime path structure. Below are some helper lines
for popular package managers:

* [Vim 8 packages](http://vimhelp.appspot.com/repeat.txt.html#packages)
  * `git clone https://github.com/jessfraz/openai.vim.git ~/.vim/pack/plugins/start/openai.vim`
* [Pathogen](https://github.com/tpope/vim-pathogen)
  * `git clone https://github.com/jessfraz/openai.vim.git ~/.vim/bundle/openai.vim`
* [vim-plug](https://github.com/junegunn/vim-plug)
  * `Plug 'jessfraz/openai.vim'`
* [Vundle](https://github.com/VundleVim/Vundle.vim)
  * `Plugin 'jessfraz/openai.vim'`

You must have `curl` and `jq` installed locally, as well as `OPENAI_API_KEY` set
in your environment.

## Usage

With your cursor on a line of text, or a selection of text in visual mode, 
`:OpenAIComplete` will send the line of text or selection to the OpenAI API and
append the result in the lines following.

Or you can use whatever your `<Leader>` key is + `o` to complete the selection
or line.

![demo](demo.gif)
