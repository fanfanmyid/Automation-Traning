# Robot Framework UI Automation — SauceDemo

[![CI](https://github.com/fanfanmyid/Automation-Traning/actions/workflows/ci.yml/badge.svg)](https://github.com/fanfanmyid/Automation-Traning/actions/workflows/ci.yml)

UI test automation for [SauceDemo](https://www.saucedemo.com) (Sauce Labs' public demo e-commerce site), built with **Robot Framework** and **SeleniumLibrary**. The suite covers login scenarios using a keyword-driven, page-object style architecture with BDD-flavored (Given/When/Then) test steps.

## Test Design

Tests are written in Gherkin-style plain language so each scenario reads like a specification:

```gherkin
Scenario: Standard user logs in successfully
    Given The user opens the Login Page
    When  The user sees the Login Page
    And   The user inputs username
    And   The user inputs password
    And   The user clicks the login button
    Then  The user should see the cart button
```

### Test Scenarios

| Suite | Test Case | User | Expected Result |
|---|---|---|---|
| `TC01-Login.robot` | User Login Successfully | `standard_user` | Login succeeds; shopping cart button is visible |
| `TC02-Login-Validation.robot` | Successful Login As Standard User | `standard_user` | Login succeeds; shopping cart container is visible |
| `TC02-Login-Validation.robot` | Locked Out User Login Shows Error | `locked_out_user` | Login is rejected; error message is displayed |

## Architecture

Keyword-driven design with a lightweight page-object layer — test cases contain only business-readable steps; all Selenium interaction lives in reusable keywords and locators:

```
.
├── TC01-Login.robot                  # BDD-style end-to-end login scenario
├── TC02-Login-Validation.robot       # Standard-user and locked-out-user login validation
├── resources/
│   ├── resource.robot                # Shared keyword: open login page and log in as a given user
│   ├── pages/
│   │   └── loginPage.robot           # Page object: login page keywords and defaults
│   └── locator/
│       └── loginLocator.py           # Centralized element locators (Python variable file)
├── requirements.txt
└── .github/workflows/ci.yml          # GitHub Actions CI (headless Chrome on Ubuntu)
```

- **Locators** are centralized in `resources/locator/loginLocator.py` and imported as Robot Framework variables, so UI changes only require edits in one place.
- **Browser options** are configurable via the `${BROWSER_OPTIONS}` variable (SeleniumLibrary evaluates it as a Selenium options expression), which enables headless execution without changing any test code.

## Prerequisites

- Python **3.11+**
- Google Chrome (Selenium 4.6+ ships **Selenium Manager**, which downloads a matching `chromedriver` automatically — no manual driver setup needed)

```bash
python3 -m venv .venv
source .venv/bin/activate        # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

## Running the Tests

Run the full suite (results are written to `results/`, which is git-ignored):

```bash
robot --outputdir results TC01-Login.robot TC02-Login-Validation.robot
```

Run a single suite:

```bash
robot --outputdir results TC01-Login.robot
```

Run headless (as CI does):

```bash
robot --outputdir results \
  --variable 'BROWSER_OPTIONS:add_argument("--headless=new");add_argument("--window-size=1920,1080")' \
  TC01-Login.robot TC02-Login-Validation.robot
```

After a run, open `results/report.html` for the summary and `results/log.html` for the detailed step-by-step execution log (with screenshots on failure).

## Continuous Integration

GitHub Actions (`.github/workflows/ci.yml`) runs the full suite on every push and pull request to `main`:

1. Ubuntu runner with Python 3.11 and Google Chrome (`browser-actions/setup-chrome`).
2. Dependencies installed from `requirements.txt`.
3. Robot Framework executes all suites in **headless Chrome** via the `BROWSER_OPTIONS` variable.
4. Test results (`output.xml`, `log.html`, `report.html`) are uploaded as a workflow artifact — **even when tests fail** — so failures can be debugged from the log.

## Notes

- SauceDemo credentials (`standard_user` / `locked_out_user`, password `secret_sauce`) are publicly documented demo credentials provided by Sauce Labs for practice — not real secrets.
- This is a compact demo portfolio project; the checkout flow is not yet automated.
