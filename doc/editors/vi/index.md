# vim notes

vim comes with most modern Linux and BSD distributions.

## Digraph characters

To add digraphs for each USV character, add

```
digraph us 9247 rs 9246 gs 9245 fs 9244 es 9243 eo 9220
```

to your `~/.vimrc`

Then when you want to type, for instance, the record separator character, in insert mode, type `<ctrl-k>rs`

## List hidden characters

To list hidden characters:

```
:set list
```

Later:

```
:set nolist
```
