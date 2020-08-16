import Danger

let danger = Danger()

// MARK: - Maybe add jira card id

let jiraIssueId = "IOS-"
let PRTitle = danger.github.pullRequest.title
let PRBody = danger.github.pullRequest.body ?? ""

if !PRTitle.contains(jiraIssueId) && !PRBody.contains(jiraIssueId) {
    warn("I noticed you didn't add a Jira card id in PR title and body")
}

let jiraDefaultId = "IOS-XXX"

if PRTitle.contains(jiraDefaultId) || PRBody.contains(jiraDefaultId) {
    warn("It looks like you forgot IOS-XXX 😬")
}

// MARK: - Warn when there is a big PR (both additions and deletion)

let minimalPRlimit = 800
let mediumPRlimit = 2000
let extremePRlimit = 5000
let additions = danger.github.pullRequest.additions ?? 0
let deletions = danger.github.pullRequest.deletions ?? 0
let changes = additions + deletions

switch changes {
case let c where c >= extremePRlimit:
    warn("You gotta be kinding me with this HUGE PR! Automatic review starting in 3, 2, 1...")
case let c where c >= mediumPRlimit:
    warn("Avoid big pull requests. Pixote's DODÔ HATES big PRs. Next time, try to break it out in multiple ones")
case let c where c >= minimalPRlimit:
    warn("Try to avoid big pull requests. In order to it make easier to read and review, you can break in multiple PRs")
default:
    break
}

// MARK: - Checklist warnings

let ranTests = "- [ ] ran tests"
let writeTests = "- [x] unit tests"

if PRBody.contains(ranTests) {
    warn("Why are you pushing code without run tests?")
}

if PRBody.contains(writeTests) {
    message("UNIT TESTS!!! That's why DODÔ loves you. Here's your reward: https://www.youtube.com/watch?v=WQyKuEsLpRY")
}

// MARK: - Linter changed files (${PODS_ROOT}/SwiftLint/swiftlint)

SwiftLint.lint(inline: true, swiftlintPath: "Pods/SwiftLint/swiftlint")
