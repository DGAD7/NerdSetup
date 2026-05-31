#!/usr/bin/env python3
import os
import re
import subprocess
import sys


def is_namespaces_ok():
    # 1. Ask Git for a list of staged C++ and header files (Added, Copied, or Modified)
    try:
        git_output = subprocess.check_output(
            [
                "git",
                "diff",
                "--cached",
                "--name-only",
                "--diff-filter=ACM",
                "--",
                "*.cpp",
                "*.h",
                "*.hpp",
            ]
        ).decode("utf-8")
    except subprocess.CalledProcessError:
        return 0

    files = [f for f in git_output.splitlines() if f.strip()]
    if not files:
        return 0

    # 2. Regex: Find 'namespace ... \n {' followed immediately by a line that isn't empty
    # ([^\n\s]) means the next line contains a visible character
    pattern_open = re.compile(r"(namespace[^\n]*\n[ \t]*\{)\n([ \t]*\S)")

    # Check for missing blank line BEFORE the last closing brace in the file
    pattern_close = re.compile(r"([^\n\s][ \t]*\n)([ \t]*\}[^}]*)$")
    failed_files = {}

    # 3. Check each file
    for filepath in files:
        if not os.path.exists(filepath):
            continue

        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()

        issues = []
        if pattern_open.search(content):
            issues.append("Missing blank line after opening namespace brace")
        if pattern_close.search(content):
            issues.append("Missing blank line before final closing brace")

        if issues:
            failed_files[filepath] = issues

    # 4. If any files failed, block the commit and print the errors
    if failed_files:
        print("\n❌ COMMIT BLOCKED: Namespace formatting issues found.")

        for filepath, issues in failed_files.items():
            print(f"   📄 {filepath}:")
            for issue in issues:
                print(f"      - {issue}")
        return False

    return True


def check_formatting():
    if not is_namespaces_ok():
        print("\nPlease fix the namespace formatting and run 'git add' again.\n")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(check_formatting())
