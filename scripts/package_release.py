#!/usr/bin/env python3
"""Package the skill folder and its checksum; no installer is required."""

import argparse
import hashlib
from pathlib import Path
import re
import zipfile

NAME = "cognitive-perspective-check"
REPO = "https://github.com/EversiusJade/cognitive-perspective-check"


def package_release(source, output):
    skill = source / "skills" / NAME
    document = (skill / "SKILL.md").read_text(encoding="utf-8-sig")
    match = re.search(r'^  version: "([0-9A-Za-z.-]+)"$', document, re.MULTILINE)
    if match is None:
        raise ValueError("Missing skill version")
    version = match.group(1)
    entries = {}
    for path in sorted(skill.rglob("*")):
        if path.is_symlink():
            raise ValueError(f"Unsupported symlink: {path}")
        if path.is_file():
            entries[f"{NAME}/{path.relative_to(skill).as_posix()}"] = path.read_bytes()
    entries[f"{NAME}/README.md"] = (
        f"# 认知视角检查器 {version}\n\n"
        f"将整个 `{NAME}` 文件夹放进客户端的技能目录，保留子目录。"
        "无需运行安装脚本。\n\n"
        f"[安装说明]({REPO}/blob/v{version}/INSTALL.md)\n"
    ).encode("utf-8")
    output.mkdir(parents=True, exist_ok=True)
    archive = output / f"{NAME}.zip"
    with zipfile.ZipFile(archive, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as bundle:
        for name, data in sorted(entries.items()):
            info = zipfile.ZipInfo(name, date_time=(1980, 1, 1, 0, 0, 0))
            info.create_system = 3
            info.external_attr = 0o100644 << 16
            info.compress_type = zipfile.ZIP_DEFLATED
            bundle.writestr(info, data, compresslevel=9)
    checksum = output / "SHA256SUMS.txt"
    checksum.write_text(f"{hashlib.sha256(archive.read_bytes()).hexdigest()}  {archive.name}\n", encoding="ascii")
    return archive, checksum


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    for artifact in package_release(args.source, args.output):
        print(artifact)
