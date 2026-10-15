# readtimer

Estimate how long your Markdown files take to read.

> **Sample project.** I wrote this small tool and its README to show how I
> document a developer tool. Every command and result below was run and checked.
> The code is in [`readtimer.py`](readtimer.py).

`readtimer` counts the words in one or more Markdown files and tells you the
reading time in whole minutes. Use it to add a "5 min read" label to articles,
or to check that a guide is not getting too long.

## Features

- Reads one or more Markdown files, or text from standard input.
- Ignores front matter, and can ignore code blocks.
- Lets you set the reading speed.
- Prints plain text or JSON, so you can use it in scripts.

## Requirements

- Python 3.9 or later. Check your version with `python3 --version`.
- No other packages are needed.

## Install

1. Download [`readtimer.py`](readtimer.py), or clone this repository.
2. Open a terminal in the folder that contains the file.

There is nothing else to install.

## Quick start

Run `readtimer` on the example guide in this repository:

```bash
python3 readtimer.py examples/guide.md
```

You should see:

```text
examples/guide.md: 1 min read (106 words)
```

The result shows the file name, the estimated reading time and the word count.

## Usage

```text
python3 readtimer.py [options] FILE [FILE ...]
```

Pass one or more file names. Pass `-` to read from standard input.

### Options

| Option | Description | Default |
| --- | --- | --- |
| `--wpm NUMBER` | Reading speed in words per minute. Must be 1 or more. | `200` |
| `--skip-code` | Do not count words inside fenced code blocks. | Code is counted |
| `--total` | Also print the combined reading time for all files. | Off |
| `--json` | Print the results as JSON. | Plain text |
| `-h`, `--help` | Show the help message and exit. | |

## Examples

### Check several files and get a total

```bash
python3 readtimer.py examples/guide.md examples/release-checklist.md --total
```

```text
examples/guide.md: 1 min read (106 words)
examples/release-checklist.md: 2 min read (214 words)
total: 2 min read (320 words)
```

The total is calculated from the combined word count, so it is not always the
sum of the individual times.

### Leave out code blocks

Readers skim code, so you may want to count only the prose:

```bash
python3 readtimer.py examples/release-checklist.md --skip-code
```

```text
examples/release-checklist.md: 1 min read (196 words)
```

Without `--skip-code`, the same file counts 214 words and takes 2 minutes.

### Use a slower reading speed

Technical content is often read more slowly than a news article. This example
uses 100 words per minute:

```bash
python3 readtimer.py examples/release-checklist.md --wpm 100
```

```text
examples/release-checklist.md: 3 min read (214 words)
```

### Get JSON output

```bash
python3 readtimer.py examples/guide.md --json
```

```json
{
  "files": [
    {
      "file": "examples/guide.md",
      "words": 106,
      "minutes": 1
    }
  ]
}
```

When you use `--total`, the JSON also contains a `total` object with `words`
and `minutes`.

### Read from standard input

```bash
cat examples/guide.md | python3 readtimer.py -
```

```text
-: 1 min read (106 words)
```

## How it counts

- A word is a run of letters, numbers, underscores, apostrophes or hyphens.
- Front matter (the block between `---` lines at the top of a file) is not counted.
- Reading time is rounded **up** to the next whole minute, with a minimum of 1 minute.

## Exit codes

| Code | Meaning |
| --- | --- |
| `0` | All files were read successfully. |
| `1` | At least one file could not be read. The other files are still processed. |
| `2` | The command was not used correctly, for example `--wpm 0`. |

## Troubleshooting

### `readtimer: cannot read 'file.md': No such file or directory`

The file name is wrong or the file is in a different folder. Check the spelling
and run the command from the folder that contains the file, or give the full
path to the file.

### `readtimer: error: --wpm must be 1 or more`

You gave a reading speed of 0 or less. Use a positive number, for example
`--wpm 150`.

### `python3: command not found`

Python is not installed, or it is installed under a different name. On Windows,
try `python readtimer.py` or `py readtimer.py` instead.

## Contributing

Found a mistake or have an idea? Open an issue that describes what you expected
and what happened. Include the command you ran and the output you saw.
