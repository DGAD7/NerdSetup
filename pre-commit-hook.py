#!/usr/bin/env python3
import os
import re
import subprocess
import sys


def get_clean_content(content):
    """Replaces contents of strings and comments with spaces, preserving newlines."""
    result = list(content)
    i = 0
    n = len(content)
    in_string = in_char = in_line_comment = in_block_comment = False

    while i < n:
        if in_string:
            if content[i] == "\\":
                result[i] = " "
                i += 1
                if i < n:
                    result[i] = " "
            elif content[i] == '"':
                in_string = False
                result[i] = " "
            elif result[i] != "\n":
                result[i] = " "
        elif in_char:
            if content[i] == "\\":
                result[i] = " "
                i += 1
                if i < n:
                    result[i] = " "
            elif content[i] == "'":
                in_char = False
                result[i] = " "
            elif result[i] != "\n":
                result[i] = " "
        elif in_line_comment:
            if content[i] == "\n":
                in_line_comment = False
            else:
                result[i] = " "
        elif in_block_comment:
            if content[i] == "*" and i + 1 < n and content[i + 1] == "/":
                result[i] = " "
                result[i + 1] = " "
                i += 1
                in_block_comment = False
            elif result[i] != "\n":
                result[i] = " "
        else:
            if content[i] == '"':
                in_string = True
                result[i] = " "
            elif content[i] == "'":
                in_char = True
                result[i] = " "
            elif content[i] == "/" and i + 1 < n and content[i + 1] == "/":
                in_line_comment = True
                result[i] = " "
                result[i + 1] = " "
                i += 1
            elif content[i] == "/" and i + 1 < n and content[i + 1] == "*":
                in_block_comment = True
                result[i] = " "
                result[i + 1] = " "
                i += 1
        i += 1
    return "".join(result)


def get_staged_cpp_files():
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
        return []

    return [f for f in git_output.splitlines() if f.strip()]


def check_namespaces(files):
    failed_files = {}

    for filepath in files:
        if not os.path.exists(filepath):
            continue

        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()

        issues_set = set()
        clean_content = get_clean_content(content)

        for match in re.finditer(r"\bnamespace\b[^{;]*\{", clean_content):
            start_brace_idx = match.end() - 1

            after_brace = content[start_brace_idx + 1 :]
            m_after = re.match(r"\s*", after_brace)
            if m_after and m_after.group(0).count("\n") < 2:
                line_num = content.count("\n", 0, start_brace_idx) + 1
                issues_set.add(
                    (
                        line_num,
                        f"Line {line_num}: Missing blank line after opening namespace brace",
                    )
                )

            depth = 1
            end_brace_idx = -1
            for i in range(start_brace_idx + 1, len(clean_content)):
                if clean_content[i] == "{":
                    depth += 1
                elif clean_content[i] == "}":
                    depth -= 1
                    if depth == 0:
                        end_brace_idx = i
                        break

            if end_brace_idx != -1:
                before_brace = content[:end_brace_idx]
                m_before = re.search(r"\s*$", before_brace)
                if m_before and m_before.group(0).count("\n") < 2:
                    line_num = content.count("\n", 0, end_brace_idx) + 1
                    issues_set.add(
                        (
                            line_num,
                            f"Line {line_num}: Missing blank line before namespace closing brace",
                        )
                    )

        if issues_set:
            failed_files[filepath] = [msg for _, msg in sorted(list(issues_set))]

    if failed_files:
        print("\n❌ COMMIT BLOCKED: Namespace formatting issues found.")
        for filepath, issues in failed_files.items():
            print(f"   📄 {filepath}:")
            for issue in issues:
                print(f"      - {issue}")
        return False
    return True


def check_enumerations(files):
    failed_files = {}

    for filepath in files:
        if not os.path.exists(filepath):
            continue

        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()

        issues_set = set()
        clean_content = get_clean_content(content)

        for match in re.finditer(r"\benum\b([^{;]*)\{", clean_content):
            enum_decl = match.group(1)
            start_brace_idx = match.end() - 1

            depth = 1
            end_brace_idx = -1
            for i in range(start_brace_idx + 1, len(clean_content)):
                if clean_content[i] == "{":
                    depth += 1
                elif clean_content[i] == "}":
                    depth -= 1
                    if depth == 0:
                        end_brace_idx = i
                        break

            if end_brace_idx != -1:
                # Check enum name and declaration line
                for m in re.finditer(r"\b[A-Za-z_]\w*\b", enum_decl):
                    word = m.group(0)
                    if word not in ["class", "struct"] and any(
                        c.isupper() for c in word
                    ):
                        line_num = (
                            content.count("\n", 0, match.start(1) + m.start()) + 1
                        )
                        issues_set.add(
                            (
                                line_num,
                                f"Line {line_num}: Enumeration name/type '{word}' must be lower case",
                            )
                        )

                # Check enum body (the actual members)
                enum_body = clean_content[start_brace_idx + 1 : end_brace_idx]
                for m in re.finditer(r"\b[A-Za-z_]\w*\b", enum_body):
                    ident = m.group(0)
                    if any(c.isupper() for c in ident):
                        line_num = (
                            content.count("\n", 0, start_brace_idx + 1 + m.start()) + 1
                        )
                        issues_set.add(
                            (
                                line_num,
                                f"Line {line_num}: Enumeration member '{ident}' must be lower case",
                            )
                        )

        if issues_set:
            failed_files[filepath] = [msg for _, msg in sorted(list(issues_set))]

    if failed_files:
        print("\n❌ COMMIT BLOCKED: Enumeration formatting issues found.")
        for filepath, issues in failed_files.items():
            print(f"   📄 {filepath}:")
            for issue in issues:
                print(f"      - {issue}")
        return False
    return True


def check_formatting():
    files = get_staged_cpp_files()
    if not files:
        return 0

    namespaces_ok = check_namespaces(files)
    enums_ok = check_enumerations(files)

    if not namespaces_ok or not enums_ok:
        print("\nPlease fix the code formatting issues and run 'git add' again.\n")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(check_formatting())
