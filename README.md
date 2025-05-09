````markdown
## Roo Persona Pack

A collection of ready-to-use **custom RooCode modes** plus the helper rules that power them.  
One command pulls the latest modes into any workspace and keeps them up to date—your own
additions remain untouched.

---

## 🚀 Quick-start

```bash
bash <(curl -Ls https://raw.githubusercontent.com/mep-um/roo-persona-pack/main/scripts/update-personas.sh)
````

Run that in the **root** of any project:

1. Downloads the newest pack.
2. Merges its modes into `.roomodes` (upstream changes overwrite earlier copies).
3. Copies/updates every `rules-rpp-*` folder under `.roo/`.
4. Cleans out files that were removed upstream.
5. Adds two “no-diff” lines to `.gitattributes` so auto-generated content stays out of PR noise.

> **First time & future updates** use the exact same command.

---

## 🖇️ Handy one-word alias (optional)

```bash
echo "alias update-personas='bash <(curl -Ls https://raw.githubusercontent.com/mep-um/roo-persona-pack/main/scripts/update-personas.sh)'" >> ~/.zshrc   # or ~/.bashrc
source ~/.zshrc
```

Now refresh whenever you like:

```bash
update-personas
```

---

## 📦 What’s inside?

| Type          | Location           | Purpose                                                                                                |
| ------------- | ------------------ | ------------------------------------------------------------------------------------------------------ |
| Modes list    | `.roomodes`        | JSON entries RooCode reads on start-up.                                                                |
| Rules folders | `.roo/rules-rpp-*` | Per-mode prompt & toolchain rules. Namespaced with **rpp-** so they never clash with your own folders. |

---

## 🙋‍♀️ Customising

* Add your own modes to `.roomodes` or extra `rules-my-*` folders—**the updater never touches anything that doesn’t start with `rules-rpp-`**.
* If you delete or rename one of your own modes, just update your local `.roomodes`; the next run won’t re-create it.

---

## 🔄 Typical flow

1. Clone or open a repo.
2. Run the quick-start command (or `update-personas`).
3. Use RooCode with the new personas.
4. Edit or add your own modes freely; re-run the updater whenever you want fresh pack updates.

---

## 🧹 Uninstall

Simply remove these paths if you no longer want the pack:

```bash
rm -rf .roomodes .roo/rules-rpp-* .roo-persona-pack.manifest
```

Delete the two lines referencing them in `.gitattributes`, and you’re clean.

---

### Requirements

`curl`, `tar`, `jq`, and `rsync`—all pre-installed on macOS/Linux; Windows users can run through Git-for-Windows Bash or WSL.
