# Contributing to canteenmenu
First off, thank you for your interest in contributing to canteenmenu—we need all the help we can get! 

The following is a set of guidelines for contributing to canteenmenu. These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

## Important resources
- Documentation: [README.md](README.md) (we don’t have anything else at the moment)
- Issue tracker: [Issues](https://github.com/fsimphy/canteenmenu/issues)
- Communication: [![Join the chat at https://gitter.im/fsimphy/Lobby](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/fsimphy/Lobby)

## Building, running and testing
To find out about how to build, run and test the project, read the corresponding sections in [README.md](README.md).

## Ways of contributing

### Reporting bugs

This section guides you through submitting a bug report for canteenmenu. Following these guidelines helps maintainers and the community understand your report and reproduce the behavior.

#### Before submitting a bug report
- Make sure you are using the latest version of canteenmenu.
- Check the [README.md](README.md) which covers some common problems.
- Check if the problem has already been reported in our [issue tracker](https://github.com/fsimphy/canteenmenu/issues).

#### How to submit a (good) bug report
Bugs are tracked in our [issue tracker](https://github.com/fsimphy/canteenmenu/issues). When creating a bug report, please provide the following information by filling in the [template](.github/issue_template.md).

Explain the problem and include additional details to help maintainers reproduce the problem:

- **Use a clear and descriptive title** for the issue to identify the problem.
- **Provide a short summary describing the problem.**
- **Describe the exact steps which reproduce the problem** in as many details as possible. When listing steps, don’t just say what you did, but explain how you did it.
- **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
- **Explain which behavior you expected to see instead and why.**
- **If the problem was not triggered by a specific action**, describe what you were doing before the problem happened and share more information using the guidelines below.

Provide more context by answering these questions:

- **Did the problem start happening recently** (e.g. after updating to a new version of canteenmenu) or was this always a problem?
- If the problem started happening recently, **can you reproduce the problem in an older version of canteenmenu?** What is the most recent version in which the problem does not happen?
- **Can you reliably reproduce the issue?** If not, provide details about how often the problem happens and under which conditions it normally happens.

Include details about your configuration and environment:
- **Which version of canteenmenu are you using?**
- **What is the name and version of the OS you are using?**
- **What is the architecture of the system you are using?** (e.g. x86, x86_64 or armv7h)

### Suggesting enhacements

This section guides you through submitting an enhancement suggestion for canteenmenu, including completely new features and minor improvements to existing functionality. Following these guidelines helps maintainers and the community understand your suggestions.

#### Before submitting an enhancement suggestion
- Make sure you are using the latest version of canteenmenu. You might discover that the enhancement is already available.
- Check if the enhancement has already been suggested in our [issue tracker](https://github.com/fsimphy/canteenmenu/issues).

#### How to submit a (good) enhancement suggestion

Enhancement Suggestion are tracked in our [issue tracker](https://github.com/fsimphy/canteenmenu/issues). When creating an enhancement suggestion, please provide the following information by filling in the [template](.github/enhancement_template.md).

- **Use a clear and descriptive title** for the issue to identify the suggestion.
- **Provide a short summary describing the suggested enhancement.**
- **Provide a user story** in the format "As a ${role} I want to ${enhancement} so that ${purpose}".
- **Explain why this enhancement would be useful.**
- **List the acceptance criteria.**

### Your first contribution

If you are unsure where to start, you can look through issues tagged with `beginner` and `help wanted`:
- [Beginner issues](https://github.com/fsimphy/canteenmenu/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aopen+label%3A%22beginner%22) - issues which should only require a few lines of code, and a test or two.
- [Help wanted issues](https://github.com/fsimphy/canteenmenu/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22) - issues which should be a bit more involved than `beginner` issues.

### Pull requests

#### Branching model
We are using [gitflow](http://nvie.com/posts/a-successful-git-branching-model/) as our branching model. Additionally we require that all merges be done as pull requests and we also have a naming scheme for our feature branches:
```
<scope>-<issue_number>_short-description
```
Scope can be one of the following:
- `feature` - new features and enhancements to extisting features
- `bugfix` - bugfixes (obviously)
- `technical` - changes of the code that do not modify featues (e.g. refactoring, adding tests, updating dependencies etc.)
- `chore` - everything that does not touch the actual code (modifying README files, renaming files etc.)

The issue number must be given as 3 digits (e.g. 010 for issue #10).

#### Submitting pull requests
When creating a pull request, please provide the following information by filling in the [template](.github/pull_request_template.md).

- What issue does this pull request correspond to?
- What does this pull request implement?
- What changes are made in this pull request?

## Styleguides

### Git commit messages
Git commit messages must have the following format:
```
<scope>: short description
optionally some more descriptions in the following lines
```
Scope can be one of the following:
- `fix` - bugfixes
- `feat` - completed features
- `wip` - work in progress
- `test` - everything related to tests
- `refactor` - refactoring
- `technical` - everything else that is `technical` and does not belong to `test` or `refactor`
- `chore` - everything not touching the actual code

For the actual text in the commit message, here are some additional guidelines:

- Use the present tense ("add feature" not "added feature").
- Use the imperative mood ("move cursor to…" not "moves cursor to…").
- Limit the first line to 72 characters or less.
- Reference issues and pull requests liberally after the first line.

### D Styleguide
All D code must adhere to [The D Style](https://dlang.org/dstyle.html). We suggest using [dfmt](https://github.com/dlang-community/dfmt) to format the code accordingly.

### Imports

All imports should be selective, except for module-level imports using more than three specific import. These should import the whole corresponding module.
Each symbol should only be imported once, and with a scope as small as possible (i.e. function/scope level imports are preferred over module-level imports).

## Additional notes

### Issue labels

We use issue labels to categorize issues into groups. This makes finding issues belonging to a particular group very easy. 
Our tagging system is loosly based on Zach Dunn’s [Styleguide for issue tagging](https://robinpowered.com/blog/best-practice-system-for-organizing-and-tagging-github-issues/). Here is a list of all labels we currently use:

| Label name | Description |
| --- | --- |
| `bug` | Bugs. |
| `security` | Security related issues. |
| `production` | Issues concerning the version currently in production. |
| `chore` | Chores that do not require any changes to the code. |
| `design` | Design related issues. |
| `ux` | Issues related to the user experience. |
| `test` | Test related issues. |
| `discussion` | More a discussion than an actual issue. |
| `question` | More a question than an actual issue. |
| `enhancement` | Enhancements to existing features. |
| `optimization` | Optimization (e.g. performance). |
| `feature` | New features. |
| `in progress` | Issues that are currently in progress. |
| `watchlist` | Issues that we would like to proceed with, but need some action first (e.g. more clarification). |
| `invalid` | Invalid issues. |
| `wontfix` | Issues we have decided to not fix (for whatever reason). |
| `duplicate` | Issues that are duplicates of other issues. |
| `on hold` | Issues that we decided to not deal with right now, but might come back to later. |
| `beginner` | Issues that are a great start for new beginning contributers. |
| `help wanted` | Issues we would like new contributers to help us with. |

### Project board

We use a [project board](https://github.com/orgs/fsimphy/projects/1) to manage our current work. It is a great place to see what is currently being worked on and what is planned next.