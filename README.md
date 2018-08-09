# kubernetes contribution tools 

This repo holds tools for kubernetes contributors, it is intended to be used in
kubernetes (related) repos ranging from [k/k repo](github.com/kubernetes/kubernetes)
to [kubernetes-sigs repos](github.com/kubernetes-sigs).

## Using, Installation

This repo is intended to be used as a submodule or vendored into the target repository via
any other means.

## Tools

### `boilerplate`

#### Install

Create a link from your reop's `hack` (or any other) directory to this repo's
`verify-boilerplate.sh`/`ensure-boilerplate.sh`. The links themselves also
need to be named `verify-boilerplate.sh`/`ensure-boilerplate.sh`.

#### Use

- `verify-boilerplate.sh`  
  Checks all applicable files in the repo for their license/copyright header,
  and warns if the header is missing for a file.

- `ensure-boilerplate.sh`  
  Will add a license/copyright header for files which don't have one yet. It
  will not update existing headers.

The scripts assume the root of the repo to be the parent of the directory you
placed the links into -- if you placed the links into `hack`, the repo's root
is assumed to be at `hack/..`.

If this is not the case, you can configure the root of the reop by
either setting `REPO_ROOT` or by calling the scripts with `--root-dir=<root>`.

You can put a config file into the root of your repo named `boilerplate.json`. The config can look something like this:
```json
{
  "dirs_to_skip" : [
    "vendor",
    "tools/contrib"
  ],
  "not_generated_files_to_skip" : [
    "some/file",
    "some/other/file.something"
  ]
}
```
Currently supported settings are
- `dirs_to_skip`  
  A list of directories which is excluded when checking or adding the headers
- `not_generated_files_to_skip`  
  A list of all the files contain 'DO NOT EDIT', but are not generated

All other settings will be ignored.

## Tests

You can run the tests for all the tools in this repo by running `./test.sh`.
