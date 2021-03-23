**Kali 2020 PS1 (I like this one on my cb):**

```bash
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
```

**Tweaked Kali 2020 PS1 (I like this one on brighter panels but not all terminals might support it because it chooses from a bigger color pool):**

```bash
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[38;5;124m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
```

**Kali 2020.3+ PS1:**

```bash
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[1;34m\]\u@\h\[\033[00m\]:\[\033[1;32m\]\w\[\033[00m\]\$"
```

I have the color guide website downloaded in this folder if you'd like to tinker with it.

EZ gui generator: https://ezprompt.net