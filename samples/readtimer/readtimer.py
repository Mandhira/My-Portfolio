#!/usr/bin/env python3
"""readtimer: estimate how long Markdown files take to read."""

import argparse
import json
import math
import re
import sys

DEFAULT_WPM = 200


def strip_markdown(text, skip_code):
    """Remove front matter and, optionally, fenced code blocks."""
    text = re.sub(r"\A---\n.*?\n---\n", "", text, flags=re.DOTALL)
    if skip_code:
        text = re.sub(r"^```.*?^```", "", text, flags=re.DOTALL | re.MULTILINE)
    return text


def count_words(text):
    return len(re.findall(r"\b[\w'-]+\b", text))


def minutes_for(words, wpm):
    """Round up to whole minutes, with a minimum of 1 minute."""
    return max(1, math.ceil(words / wpm))


def analyse(name, text, wpm, skip_code):
    words = count_words(strip_markdown(text, skip_code))
    return {"file": name, "words": words, "minutes": minutes_for(words, wpm)}


def main(argv=None):
    parser = argparse.ArgumentParser(
        prog="readtimer",
        description="Estimate how long Markdown files take to read.",
    )
    parser.add_argument("files", nargs="+", help="Markdown files to analyse. Use - to read from standard input.")
    parser.add_argument("--wpm", type=int, default=DEFAULT_WPM, help=f"reading speed in words per minute (default: {DEFAULT_WPM})")
    parser.add_argument("--skip-code", action="store_true", help="do not count words inside fenced code blocks")
    parser.add_argument("--total", action="store_true", help="also print the combined reading time")
    parser.add_argument("--json", action="store_true", help="print results as JSON")
    args = parser.parse_args(argv)

    if args.wpm < 1:
        parser.error("--wpm must be 1 or more")

    results = []
    status = 0
    for name in args.files:
        try:
            if name == "-":
                text = sys.stdin.read()
            else:
                with open(name, encoding="utf-8") as handle:
                    text = handle.read()
        except OSError as error:
            print(f"readtimer: cannot read '{name}': {error.strerror}", file=sys.stderr)
            status = 1
            continue
        results.append(analyse(name, text, args.wpm, args.skip_code))

    if args.total and results:
        words = sum(item["words"] for item in results)
        results_total = {"words": words, "minutes": minutes_for(words, args.wpm)}
    else:
        results_total = None

    if args.json:
        payload = {"files": results}
        if results_total:
            payload["total"] = results_total
        print(json.dumps(payload, indent=2))
    else:
        for item in results:
            print(f"{item['file']}: {item['minutes']} min read ({item['words']} words)")
        if results_total:
            print(f"total: {results_total['minutes']} min read ({results_total['words']} words)")
    return status


if __name__ == "__main__":
    sys.exit(main())
