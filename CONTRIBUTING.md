# 🤝 Contributing to Go Web App

Thank you for your interest in contributing to this project! We welcome contributions from everyone. This document provides guidelines and instructions for contributing.

## 📋 Table of Contents

- [Code of Conduct](#-code-of-conduct)
- [Getting Started](#-getting-started)
- [How to Contribute](#-how-to-contribute)
- [Development Setup](#-development-setup)
- [Making Changes](#-making-changes)
- [Submitting Changes](#-submitting-changes)
- [Style Guide](#-style-guide)
- [Reporting Bugs](#-reporting-bugs)
- [Requesting Features](#-requesting-features)

---

## 📜 Code of Conduct

### Our Pledge

In the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to making participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Our Standards

Examples of behavior that contributes to creating a positive environment include:

- Using welcoming and inclusive language
- Being respectful of differing opinions, viewpoints, and experiences
- Gracefully accepting constructive criticism
- Focusing on what is best for the community
- Showing empathy towards other community members

---

## 🚀 Getting Started

### 1. Fork the Repository

Click the **Fork** button on the GitHub repository page to create your own copy.

### 2. Clone Your Fork

```bash
git clone https://github.com/<your-username>/go-web-app.git
cd go-web-app
```

### 3. Add Upstream Remote

```bash
git remote add upstream https://github.com/Application-Dev-Lab-cell/go-web-app.git
```

### 4. Create a Feature Branch

```bash
git checkout -b feature/your-feature-name
```

Use descriptive branch names:
- `feature/add-login-page` ✅
- `bugfix/fix-database-connection` ✅
- `docs/update-readme` ✅
- `test/add-unit-tests` ✅

---

## 💻 How to Contribute

### Types of Contributions

1. **Bug Fixes** - Fix existing issues
2. **Features** - Add new functionality
3. **Documentation** - Improve README, comments, or guides
4. **Tests** - Add or improve test coverage
5. **Performance** - Optimize code and improve efficiency
6. **Refactoring** - Improve code structure and maintainability

---

## 🛠️ Development Setup

### Prerequisites

- Go 1.21+ [Download](https://go.dev/dl/)
- Git [Download](https://git-scm.com/download/win)
- Docker (optional) [Download](https://www.docker.com/products/docker-desktop)

### Local Setup

```bash
# Navigate to project directory
cd go-web-app

# Download dependencies
go mod download

# Verify setup
go run main.go
```

The application should start on `http://localhost:8080`.

---

## 📝 Making Changes

### Step 1: Sync with Upstream

```bash
git fetch upstream
git rebase upstream/main
```

### Step 2: Make Your Changes

Edit files and implement your feature or fix:

```bash
# View changes
git status
git diff

# Stage changes
git add .

# Commit changes
git commit -m "feat: add new feature" -m "Description of changes"
```

### Step 3: Run Tests

```bash
# Run all tests
go test -v

# Run with coverage
go test -cover

# Run specific test
go test -run TestName -v
```

### Step 4: Format Code

```bash
# Format code
go fmt ./...

# Run linter (if installed)
golangci-lint run
```

---

## 🔄 Submitting Changes

### 1. Push to Your Fork

```bash
git push origin feature/your-feature-name
```

### 2. Create a Pull Request

- Go to the original repository
- Click **New Pull Request**
- Select your branch
- Fill in the PR template

### 3. PR Checklist

Before submitting, ensure:

- ✅ Your code follows the style guide
- ✅ You've added/updated tests
- ✅ All tests pass (`go test -v`)
- ✅ You've updated documentation
- ✅ Commit messages are clear and descriptive
- ✅ No merge conflicts
- ✅ Code is formatted (`go fmt ./...`)

### 4. PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Test addition

## Testing
Describe how to test your changes

## Screenshots (if applicable)
Add images for UI changes

## Checklist
- [ ] Tests pass locally
- [ ] Code follows style guide
- [ ] Documentation updated
```

---

## 🎨 Style Guide

### Go Code Style

Follow [Effective Go](https://golang.org/doc/effective_go) guidelines:

```go
// Function naming: camelCase for unexported, PascalCase for exported
func handleRequest(w http.ResponseWriter, r *http.Request) {
    // Implementation
}

// Variable naming: be descriptive
var (
    maxRetries = 3
    timeout    = 30 * time.Second
)

// Comments: explain WHY, not WHAT
// Convert timestamp to UTC for consistency
t := time.Now().UTC()
```

### Commit Message Format

```
<type>: <subject>

<body>

<footer>
```

**Types:**
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation
- `style` - Code style changes (formatting, semicolons, etc.)
- `refactor` - Code refactoring
- `perf` - Performance improvements
- `test` - Adding tests
- `chore` - Maintenance tasks

**Example:**

```
feat: add user authentication

Implement JWT-based authentication for API endpoints.
- Add JWT middleware
- Create login endpoint
- Add token validation

Closes #123
```

---

## 🐛 Reporting Bugs

### Before Reporting

- Check if the bug already exists in [Issues](https://github.com/Application-Dev-Lab-cell/go-web-app/issues)
- Verify the bug with the latest version

### Bug Report Template

```markdown
## Description
Clear description of the bug

## Steps to Reproduce
1. Step 1
2. Step 2
3. Step 3

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Environment
- OS: Windows 11
- Go Version: 1.21
- Docker Version: (if applicable)

## Error Logs
```
paste error logs here
```

## Screenshots
Attach screenshots if applicable
```

---

## ✨ Requesting Features

### Feature Request Template

```markdown
## Description
Clear description of the feature

## Use Case
Why do you need this feature?

## Proposed Solution
Your idea for implementation

## Alternatives Considered
Other possible solutions

## Additional Context
Any other context
```

---

## 📚 Documentation

### When to Update Docs

- Adding a new feature → Update README.md
- Changing behavior → Update relevant documentation
- Adding deployment method → Update DEPLOYMENT section
- New tools/dependencies → Update prerequisites

### Documentation Checklist

- [ ] README.md updated
- [ ] Comments added to complex code
- [ ] Examples provided for new features
- [ ] Links are working

---

## 🎯 Review Process

### What to Expect

1. **Review** - Maintainers will review your PR
2. **Feedback** - May request changes
3. **Discussion** - Clarify any questions
4. **Approval** - Once approved, maintainer will merge
5. **Celebration** - Your contribution is live! 🎉

### Tips for Faster Review

- Keep PRs focused and small
- Write clear commit messages
- Include tests and documentation
- Respond promptly to feedback
- Be open to suggestions

---

## 🏆 Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Project credits

---

## 💬 Questions or Need Help?

- 📖 Check the [README.md](README.md)
- 🔍 Search existing [Issues](https://github.com/Application-Dev-Lab-cell/go-web-app/issues)
- 💭 Open a [Discussion](https://github.com/Application-Dev-Lab-cell/go-web-app/discussions)
- 📧 Contact maintainers

---

## 📜 License

By contributing, you agree that your contributions will be licensed under the same license as the project (MIT License).

---

<div align="center">

**Thank you for contributing! 🙏**

Your efforts help make this project better for everyone.

</div>
