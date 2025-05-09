## 📥 First-time install / future updates

```bash
bash <(curl -Ls https://raw.githubusercontent.com/mep-um/roo-persona-pack/main/scripts/update-personas.sh)
```

* `curl -Ls` streams the script from GitHub’s raw CDN without leaving a file behind ([Alex MacArthur][1]).
* The script creates a temp directory with `mktemp -d` ([Stack Overflow][2]), downloads `main.tar.gz`, strips GitHub’s wrapper folder (`--strip-components=1`) ([GitHub][3]), skips `LICENSE` and any `README*`, then mirrors the pack into your project root with an **include-file `rsync --delete`** so only pack files are touched ([Super User][4]).
* A manifest named **`.roo-persona-pack.manifest`** records every path the script manages; it is plain text, one relative path per line (directories end with `/`).
* Your custom modes remain intact because the script merges `.roomodes` with `jq`; the upstream array is placed first so its version replaces any duplicate `slug` in your file. `unique_by(.slug)` drops the older duplicate, exactly matching the “upstream always wins” rule ([Stack Overflow][5]).
* Rule folders shipped by the pack use the prefix **`rules-rpp-*`**, kept invisible in diffs by the line `/.roo/rules-rpp-* -diff` that the script adds once to `.gitattributes` ([Git SCM][6]).

---

## 🖇️ One-time alias (optional)

```bash
echo "alias update-personas='bash <(curl -Ls https://raw.githubusercontent.com/mep-um/roo-persona-pack/main/scripts/update-personas.sh)'" >> ~/.zshrc
source ~/.zshrc
```

*Add the line to `~/.bashrc` instead if you use Bash* ([The Linux Documentation Project][7]).

Now you can refresh the pack at any time:

```bash
update-personas
```

---

## 🗂️ What’s in `.roo-persona-pack.manifest`?

```
.roomodes
.roo/rules-rpp-cyclecoach/
.roo/rules-rpp-chef/
.roo/rules-rpp-devops/
```

* One relative path per line.
* Directories **must** end with `/`.
* The updater deletes only paths that (a) appear in **your existing manifest**, but (b) are **absent** from the new manifest—so anything you add yourself is safe.

---

## 🔬 Internals & references

1. `[[ -f file ]]` test is a Bash builtin for “file exists” ([The Linux Documentation Project][7]).
2. `jq -s` slurp loads both JSON arrays, and `unique_by` keeps the first duplicate ([Stack Overflow][8], [Stack Overflow][5]).
3. Array order swapped so upstream copy overwrites local duplicate (`.[1] + .[0]`) ([Stack Overflow][8]).
4. `rsync --include-from=FILE --delete` copies only listed files and removes stale ones ([Super User][4]).
5. `grep -Fxvf new old` gives the set difference of two line files (used to prune orphans) ([Unix & Linux Stack Exchange][9]).
6. `mv` on the same filesystem is atomic, preventing half-written `.roomodes` files ([Unix & Linux Stack Exchange][10]).

With these changes, **upstream updates flow cleanly**, your own additions are never lost, and each project stays lean and conflict-free.

[1]: https://macarthur.me/posts/curl-to-bash?utm_source=chatgpt.com "Hold a Healthy Sense of Caution Whenever Running a curl|bash ..."
[2]: https://stackoverflow.com/questions/4632028/how-to-create-a-temporary-directory?utm_source=chatgpt.com "How to create a temporary directory? - Stack Overflow"
[3]: https://github.com/jordansissel/fpm/issues/985?utm_source=chatgpt.com "Ability to strip components from tar #985 - jordansissel/fpm - GitHub"
[4]: https://superuser.com/questions/803212/understanding-rsyncs-include-exclude-patterns?utm_source=chatgpt.com "Understanding rsync's include / exclude patterns - linux - Super User"
[5]: https://stackoverflow.com/questions/69485161/how-to-get-output-with-unique-values-but-only-with-last-instance-of-a-duplicate?utm_source=chatgpt.com "How to get output with unique values but only with last instance of a ..."
[6]: https://git-scm.com/docs/gitattributes?utm_source=chatgpt.com "gitattributes Documentation - Git"
[7]: https://tldp.org/LDP/abs/html/testconstructs.html?utm_source=chatgpt.com "7.1. Test Constructs"
[8]: https://stackoverflow.com/questions/53420766/how-can-i-combine-a-sequence-of-json-with-jq-without-using-the-slurp-flag?utm_source=chatgpt.com "How can I combine a sequence of JSON with jq without using the ..."
[9]: https://unix.stackexchange.com/questions/248827/how-do-i-grep-two-patterns-from-one-file-and-direct-the-lines-to-different-outpu?utm_source=chatgpt.com "How do I grep two patterns from one file and direct the lines to ..."
[10]: https://unix.stackexchange.com/questions/452620/is-mv-atomic-operation-between-two-file-systems?utm_source=chatgpt.com "Is mv atomic operation between two file systems?"
