---
redirect_from: /ru/SshAgent.html

title: "ConEmu | SshAgent"

description: "Some hints about using ssh-agent in ConEmu consoles"

breadcrumbs:
 - url: TableOfContents.html#cygwin-and-msys
   title: Cygwin and Msys
---

# ConEmu, cygwin/msys and ssh-agent

When you ssh into remote computer you may use your ‘Public key’ for authentication.
Private and public keys are usually stored in the user's home directory and are
often encrypted with passphrase to be more secure.

Some tools may pick up public keys automatically, some others require special switch
to select key authentication mode. The example is shown below.

~~~
ssh -i $HOME/.ssh/id_rsa your.server.com
~~~

To avoid typing the passphrase each time you connect any remote system
you may run [ssh-agent](https://en.wikipedia.org/wiki/Ssh-agent)
which will ‘cache’ your keys in memory for use in the current session.

{% include in_article.html %}

By the way, if you need to run some command after logging into remote system
you may append it to `ssh` arguments. For example you may set startup (working)
directory for the remote ssh session as follows.

~~~
ssh your.server.com "cd /path/to/directory ; bash --login"
~~~

* [How ssh-agent works](#the-key)
  * [Answer 1: Export variables](#answer-export)
    * [My solution step-by-step](#step-by-step)
  * [Answer 2: Modify your bash profile](#answer-profile)
* [Some other links](#other-links)
  * [Tweet #1](#link-tweet-1)
  * [SuperUser answer](#link-su-141241)
  * [CygWin profile modification](#link-cygwin)



## How ssh-agent works   {#the-key}

When `ssh-agent` starts it defines two [environment](WindowsEnvironment.html) variables,
`SSH_AGENT_PID` and `SSH_AUTH_SOCK`, which must be exported to your
[shell](TerminalVsShell.html).

On Unix systems or in cygwin ssh-agent may be started as follows:

~~~
eval $(ssh-agent)   # Create agent and environment variables
~~~

That would be nice if you are working in the single-tab console environment,
but what about ConEmu and multi-tab environment?


### Answer 1: Export variables   {#answer-export}

Just [export these variables](ConEmuEnvironment.html#Export_variables)
to the ConEmu GUI and all running consoles
([Tabs](Tabs.html) and [Panes](Panes.html)).

~~~
eval $(ssh-agent)           # Create agent and environment variables
ConEmuC -export=ALL SSH_*   # Export variables to ConEmu and all its tabs
~~~

The only drawback is a [limitation](ConEmuEnvironment.html#Export_variables)
of the implemented export method - existing cygwin tabs will not get these variables,
only new cygwin consoles will get them.


#### My solution step-by-step  {#step-by-step}

1) Create the task `{Bash::ssh-agent}` which runs single batch `ssh-agent.cmd`.

~~~
"%USERPROFILE%\.ssh\ssh-agent.cmd" -cur_console:n
~~~

2) Create the task `{Helper::Startup}` containing two sub-tasks `{Bash::ssh-agent}`
   and another one with your favourite shell. I'm using `{Far}`.
   
~~~
>{ssh-agent}
{Far}
~~~

3) Select the task `{Helper::Startup}` on [Settings/Startup](SettingsStartup.html)
   page and set ‘Delay between consoles initialization’ to some suitable value.
   I'm using `1500` ms.
   
4) I've checked the [‘Kill ssh-agent with ConEmu’](SettingsFeatures.html#id3075).
   
5) Prepare your `ssh-agent.cmd`. The script must be located in writeable location.
   You have to change variables `ce_ssh_bin`, `ce_ssh_pvt` and name of ssh keys.
   In the example below it's `%ce_ssh_pvt%/id_rsa` for Key1.
   
~~~
@echo off

set "ce_ssh_bin=C:\Program Files\Git\usr\bin"
set ce_ssh_pvt=/c/Users/username/.ssh

if NOT defined SSH_AGENT_PID goto do_run

rem ssh-agent.exe may be already started, check if its PID equals to %SSH_AGENT_PID%
tasklist /FI "IMAGENAME eq ssh-agent.exe" 2>NUL | find /I /N " %SSH_AGENT_PID% ">NUL
if "%ERRORLEVEL%"=="0" (
  echo ssh-agent PID=%SSH_AGENT_PID% is running
  rem timeout /t 10
  goto fin
) else (
  call cecho "ssh-agent PID=%SSH_AGENT_PID% was terminated"
)

:do_run
rem We suppose our batch is located in write-enabled folder
set "SSH_AGENT_INFO=%~dp0ssh-agent-%ConEmuServerPID%"
"%ce_ssh_bin%\ssh-agent.exe" -c > "%SSH_AGENT_INFO%"
if errorlevel 1 (
  call cecho "ssh-agent failed"
  goto fin
)
FOR /F "eol=; tokens=2,3*" %%i in (%SSH_AGENT_INFO%) do (
  @rem echo `%%i` `%%j` `%%k`
  if "%%i" == "SSH_AUTH_SOCK" set "SSH_AUTH_SOCK=%%j"
  if "%%i" == "SSH_AGENT_PID" set "SSH_AGENT_PID=%%j"
)
set "SSH_AUTH_SOCK=%SSH_AUTH_SOCK:~0,-1%"
set "SSH_AGENT_PID=%SSH_AGENT_PID:~0,-1%"
del "%SSH_AGENT_INFO%"
set SSH_AGENT_INFO=
set SSH_
ConEmuC -export=ALL SSH_*

setlocal
rem ### Adding keys begin ###
set was_errors=

rem ### Key1 ###
"%ce_ssh_bin%\ssh-add.exe" %ce_ssh_pvt%/id_rsa
if errorlevel 1 set was_errors=1

rem You may add below more keys, by copying lines above
rem ### Key2 ###
rem ### Key3 ###

rem ### Adding keys end ###
if defined was_errors (
  ConEmuC -export=ALL SSH_*
  cmd /k
)
endlocal

timeout /T 5
:on_errors
ConEmuC -export=ALL SSH_*
:fin
~~~


**NB** If you are lazy and confident of your personal files, you may
bypass requirement to enter the passphrase. Just create the file
`ssh-key-pwd.cmd` near to `ssh-agent.cmd`.

~~~
@set TEMP_SSH_KEY=your_passphrase
~~~

And change the call to `ssh-add.exe`.

~~~
rem ### Key1 ###
call "%~dp0ssh-key-pwd.cmd"
ConEmuC -GuiMacro print("%TEMP_SSH_KEY%\n")
"%ce_ssh_bin%\ssh-add.exe" %ce_ssh_pvt%/id_rsa
if errorlevel 1 set was_errors=1
~~~


### Answer 2: Modify your bash profile   {#answer-profile}

GitHub documentation
[suggests](https://help.github.com/articles/working-with-ssh-key-passphrases/#auto-launching-ssh-agent-on-msysgit)
to change your bash profile, so your ssh-agent will be initialized properly
in any bash instance, regardless of the used terminal.

Also, [here](https://www.schoonology.com/technology/ssh-agent-windows/)
you may find slightly modified script, which adds ssh key files by mask.


## Some other links  {#other-links}

### <a href="https://twitter.com/rootpd/status/428600352229687296" rel="nofollow">Tweet #1</a>  {#link-tweet-1}

SSH agent working with @ConEmuMaximus5 and Git Bash. For multiple
tabs. Load your keys just once, use everywhere.


### <a href="http://superuser.com/a/141241/139371" rel="nofollow">SuperUser answer</a>  {#link-su-141241}

Using the [bash script](http://superuser.com/a/141241/139371) and an alias `sagent`.


### <a href="http://www.cygwin.com/ml/cygwin/2001-06/msg00537.html">CygWin profile modification</a>  {#link-cygwin}

This solution does not relates to ConEmu at first glance but may be useful anyway.



{% comment %}
You may want to use ssh-agent and ssh-add to load the key into memory.
ssh will try identities from ssh-agent automatically if it can find them.
Commands would be

eval $(ssh-agent) # Create agent and environment variables
ssh-add ~/.ssh/1234-identity
ssh-agent is a user daemon which holds unencrypted ssh keys in memory. ssh finds it based on environment variables which ssh-agent outputs when run. Using eval to evaluate this output creates the environment variables.  ssh-add is the command which manages the keys memory. The agent can be locked using ssh-add. A default lifetime for a key can be specified when ssh-agent is started, and or specified for a key when it is added.

You might also want to setup a ~/.ssh/config file to supply the port and key definition. (See `man ssh_config for more options.)

host 22.33.44.55
    IdentityFile ~/.ssh/1234-identity
    Port 1234
Single quoting the ssh command will prevent shell expansion which is needed for ~ or $HOME. You could use the full or relative path to the key in single quotes.
{% endcomment %}


{% comment %}

** without use of ssh-agent

   rsync -avz -e "ssh -p1234  -i $HOME/.ssh/1234-identity" ...
or full path to the key:

  rsync -avz -e "ssh -p1234  -i /home/username/.ssh/1234-identity" ...
Tested with rsync 3.0.9 on Ubuntu

{% endcomment %}


{% comment %}

# https://www.schoonology.com/technology/ssh-agent-windows/

# SSH Agent
# Note: ~/.ssh/environment should not be used, as it
#       already has a different purpose in SSH.

env=~/.ssh/agent.env

# Note: Don't bother checking SSH_AGENT_PID. It's not used
#       by SSH itself, and it might even be incorrect
#       (for example, when using agent-forwarding over SSH).

agent_is_running() {
  if [ "$SSH_AUTH_SOCK" ]; then
    # ssh-add returns:
    #   0 = agent running, has keys
    #   1 = agent running, no keys
    #   2 = agent not running
    ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
  else
    false
  fi
}

agent_has_keys() {
  ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
  . "$env" >/dev/null
}

agent_start() {
  (umask 077; ssh-agent >"$env")
  . "$env" >/dev/null
}

add_all_keys() {
  ls ~/.ssh | grep id_rsa[^.]*$ | sed "s:^:`echo ~`/.ssh/:" | xargs -n 1 ssh-add
}

if ! agent_is_running; then
  agent_load_env
fi

# if your keys are not stored in ~/.ssh/id_rsa.pub or ~/.ssh/id_dsa.pub, you'll need
# to paste the proper path after ssh-add
if ! agent_is_running; then
  agent_start
  add_all_keys
elif ! agent_has_keys; then
  add_all_keys
fi

echo `ssh-add -l | wc -l` SSH keys registered.

unset env

{% endcomment %}

{% comment %}

# https://help.github.com/articles/working-with-ssh-key-passphrases/#auto-launching-ssh-agent-on-msysgit

# # Note: ~/.ssh/environment should not be used, as it
#       already has a different purpose in SSH.

env=~/.ssh/agent.env

# Note: Don't bother checking SSH_AGENT_PID. It's not used
#       by SSH itself, and it might even be incorrect
#       (for example, when using agent-forwarding over SSH).

agent_is_running() {
    if [ "$SSH_AUTH_SOCK" ]; then
        # ssh-add returns:
        #   0 = agent running, has keys
        #   1 = agent running, no keys
        #   2 = agent not running
        ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
    else
        false
    fi
}

agent_has_keys() {
    ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
    . "$env" >/dev/null
}

agent_start() {
    (umask 077; ssh-agent >"$env")
    . "$env" >/dev/null
}

if ! agent_is_running; then
    agent_load_env
fi

# if your keys are not stored in ~/.ssh/id_rsa or ~/.ssh/id_dsa, you'll need
# to paste the proper path after ssh-add
if ! agent_is_running; then
    agent_start
    ssh-add
    # Tip: If your private keys are not stored in ~/.ssh/id_rsa or ~/.ssh/id_dsa,
    # you must add their paths with the ssh-add command so that your SSH authentication
    # agent knows where to find them. For example:
    # ssh-add ~/.my_other_ssh/id_rsa
elif ! agent_has_keys; then
    ssh-add
fi

unset env

{% endcomment %}
