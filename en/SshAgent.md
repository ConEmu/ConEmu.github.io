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

By the way, if you need to run some command after logging into remote system
you may append it to `ssh` arguments. For example you may set startup (working)
directory for the remote ssh session as follows.

~~~
ssh your.server.com "cd /path/to/directory ; bash --login"
~~~

* [How ssh-agent works](#the-key)
  * [Answer 1: Export variables](#answer-export)
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
