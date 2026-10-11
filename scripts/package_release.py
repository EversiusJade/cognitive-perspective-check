#!/usr/bin/env python3
"""Create the two public release archives using only the Python standard library."""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path
import re
import stat
import sys
import zipfile


SKILL_NAME = "cognitive-perspective-check"
REPOSITORY_URL = "https://github.com/EversiusJade/cognitive-perspective-check"
ZIP_TIMESTAMP = (1980, 1, 1, 0, 0, 0)
INSTALLER_FILES = (
    "LICENSE",
    "INSTALL.md",
    "install.ps1",
    "install-copilot.cmd",
    "install-shared.cmd",
)


def read_version(skill_file: Path) -> str:
    """Read the simple metadata.version scalar without a YAML dependency."""
    document = skill_file.read_text(encoding="utf-8-sig")
    frontmatter = re.match(
        r"\A---[ \t]*\r?\n(.*?)\r?\n---[ \t]*(?:\r?\n|\Z)",
        document,
        flags=re.DOTALL,
    )
    if frontmatter is None:
        raise ValueError(f"Missing YAML frontmatter: {skill_file}")

    lines = frontmatter.group(1).splitlines()
    metadata_lines = [index for index, line in enumerate(lines) if line == "metadata:"]
    if len(metadata_lines) != 1:
        raise ValueError("SKILL.md must contain exactly one metadata mapping")

    version_lines = []
    for line in lines[metadata_lines[0] + 1 :]:
        if line and not line[0].isspace():
            break
        match = re.fullmatch(r"  version:[ \t]*(.*?)[ \t]*", line)
        if match is not None:
            version_lines.append(match.group(1))
    if len(version_lines) != 1:
        raise ValueError("SKILL.md metadata must contain exactly one version scalar")

    version = version_lines[0]
    if len(version) >= 2 and version[0] in "\"'" and version[-1] == version[0]:
        version = version[1:-1]
    if re.fullmatch(r"[0-9]+\.[0-9]+\.[0-9]+(?:-[0-9A-Za-z]+(?:[.-][0-9A-Za-z]+)*)?", version) is None:
        raise ValueError(f"Unsupported metadata.version: {version!r}")
    return version


def read_source_file(path: Path) -> bytes:
    """Read regular source files without following file symlinks."""
    if path.is_symlink() or not path.is_file():
        raise ValueError(f"Expected a regular source file: {path}")
    return path.read_bytes()


def collect_skill_files(skill_directory: Path) -> dict[str, bytes]:
    files = {}
    for path in sorted(skill_directory.rglob("*")):
        if path.is_symlink():
            raise ValueError(f"Skill directory must not contain symlinks: {path}")
        if path.is_file():
            files[path.relative_to(skill_directory).as_posix()] = read_source_file(path)
    if "SKILL.md" not in files:
        raise ValueError(f"Missing SKILL.md in {skill_directory}")
    if "README.md" in files:
        raise ValueError("The generated README.md would overwrite a source skill file")
    return files


def write_zip(destination: Path, entries: dict[str, bytes]) -> None:
    """Write stable entry order, timestamps, permissions, and compression settings."""
    with zipfile.ZipFile(destination, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
        for name, contents in sorted(entries.items()):
            entry = zipfile.ZipInfo(name, date_time=ZIP_TIMESTAMP)
            entry.create_system = 3
            entry.external_attr = (stat.S_IFREG | 0o644) << 16
            entry.compress_type = zipfile.ZIP_DEFLATED
            archive.writestr(entry, contents, compresslevel=9)


def package_release(source: Path, output: Path) -> tuple[Path, Path, Path]:
    source = source.resolve(strict=True)
    if not source.is_dir():
        raise ValueError(f"Source must be a repository directory: {source}")
    skill_directory = source / "skills" / SKILL_NAME
    if (source / "skills").is_symlink() or skill_directory.is_symlink():
        raise ValueError("The source skill directory must not be a symlink")
    skill_directory = skill_directory.resolve(strict=True)
    if not skill_directory.is_dir():
        raise ValueError(f"Missing skill directory: {skill_directory}")

    output = output.resolve()
    if output == source or output == skill_directory or skill_directory in output.parents:
        raise ValueError("Output must be a separate build directory outside the skill directory")

    skill_files = collect_skill_files(skill_directory)
    version = read_version(skill_directory / "SKILL.md")
    tag = f"v{version}"
    release_url = f"{REPOSITORY_URL}/releases/tag/{tag}"
    install_url = f"{REPOSITORY_URL}/blob/{tag}/INSTALL.md"

    installer_root = f"{SKILL_NAME}-installer"
    installer_entries = {
        f"{installer_root}/{name}": read_source_file(source / name)
        for name in INSTALLER_FILES
    }
    installer_entries.update({
        f"{installer_root}/skills/{SKILL_NAME}/{name}": contents
        for name, contents in skill_files.items()
    })
    installer_entries[f"{installer_root}/README.md"] = (
        f"# 问题框架校准器 {version} · Windows 安装包\n\n"
        "先完整解压这个压缩包，再运行安装入口。\n\n"
        "GitHub Copilot 用户双击 `install-copilot.cmd`；"
        "Codex 与 Copilot 共用时双击 `install-shared.cmd`。两种位置选一种。"
        "无需管理员权限、Python、Node 或 GitHub 凭证。具体选项与更新方法见 INSTALL.md。\n\n"
        f"- [完整安装说明]({install_url})\n"
        f"- [本版本下载页]({release_url})\n"
        f"- [源码与介绍]({REPOSITORY_URL})\n"
    ).encode("utf-8")

    skill_entries = {f"{SKILL_NAME}/{name}": contents for name, contents in skill_files.items()}
    skill_entries[f"{SKILL_NAME}/README.md"] = (
        f"# 问题框架校准器 {version} · 手动安装\n\n"
        f"解压后将整个 `{SKILL_NAME}` 文件夹复制到客户端支持的 skills 目录，"
        "保留内部文件和子目录。个人目录可选 `~/.copilot/skills/` 或 Copilot / Codex "
        "共用的 `~/.agents/skills/`，选一种即可。最终路径应为 "
        f"`skills/{SKILL_NAME}/SKILL.md`。\n\n"
        f"- [完整安装说明与支持的目录]({install_url})\n"
        f"- [本版本下载页]({release_url})\n"
        f"- [源码与介绍]({REPOSITORY_URL})\n"
    ).encode("utf-8")

    names = (f"{SKILL_NAME}-{tag}-windows.zip", f"{SKILL_NAME}.zip", "SHA256SUMS.txt")
    destinations = tuple(output / name for name in names)
    for destination in destinations:
        if destination.is_symlink():
            raise ValueError(f"Refusing to overwrite a symlink: {destination}")
        if destination.exists() and not destination.is_file():
            raise ValueError(f"Output path is not a regular file: {destination}")
    output.mkdir(parents=True, exist_ok=True)

    write_zip(destinations[0], installer_entries)
    write_zip(destinations[1], skill_entries)
    checksums = "".join(
        f"{hashlib.sha256(path.read_bytes()).hexdigest()}  {path.name}\n"
        for path in destinations[:2]
    )
    destinations[2].write_bytes(checksums.encode("ascii"))
    return destinations


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", required=True, type=Path, help="Repository root directory")
    parser.add_argument("--output", required=True, type=Path, help="Build output directory")
    arguments = parser.parse_args()
    try:
        artifacts = package_release(arguments.source, arguments.output)
    except (OSError, ValueError, zipfile.BadZipFile) as error:
        parser.exit(1, f"error: {error}\n")
    for artifact in artifacts:
        print(artifact)
    return 0


if __name__ == "__main__":
    sys.exit(main())
