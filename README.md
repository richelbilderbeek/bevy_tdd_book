# bevy_tdd_book

<!-- markdownlint-disable MD013 --><!-- Badges cannot be split up over lines, hence will break 80 characters per line -->

[![Check chapters](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_chapters.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_chapters.yaml)
[![Check links](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_links.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_links.yaml)
[![Check Markdown](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_markdown.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_markdown.yaml)
[![Check spelling](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_spelling.yaml/badge.svg?branch=master)](https://github.com/richelbilderbeek/bevy_tdd_book/actions/workflows/check_spelling.yaml)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.14567480.svg)](https://doi.org/10.5281/zenodo.14567480)

<!-- markdownlint-enable MD013 -->

Start of a book called 'Developing Bevy games using TDD'.
The goal is to demonstrate how to do Test-Driven Development with Bevy.

- [Go to the nicely rendered version](https://richelbilderbeek.github.io/bevy_tdd_book/)

## Files used by continuous integration scripts

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

Filename                                  |Descriptions
------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------
[`mlc_config.json`](mlc_config.json)        |Configuration of the link checker, use `markdown-link-check --config mlc_config.json --quiet docs/**/*.md` to do link checking locally
[`.spellcheck.yml`](.spellcheck.yml)        |Configuration of the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[`.wordlist.txt`](.wordlist.txt)            |Whitelisted words for the spell checker, use `pyspelling -c .spellcheck.yml` to do spellcheck locally
[`.markdownlint.jsonc`](.markdownlint.jsonc)|Configuration of the Markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.
[`.markdownlintignore`](.markdownlintignore)|Files ignored by the Markdown linter, use `markdownlint "**/*.md"` to do markdown linting locally. The name of this file is a default name.

<!-- markdownlint-enable MD013 -->
