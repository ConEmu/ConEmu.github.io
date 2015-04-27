---
redirect_from: /ru/SshAgent.html

title: "ConEmu | SshAgent"

description: "Some hints about using ssh-agent in ConEmu consoles"

breadcrumbs:
 - url: TableOfContents.html#tips-and-tweaks
   title: Tips and Tweaks
---

# ConEmu, cygwin/msys and ssh-agent

Article is under construction, you may find following links useful.

* <a href="https://twitter.com/rootpd/status/428600352229687296" rel="nofollow">Tweet #1</a>
* <a href="http://superuser.com/a/230872/234747" rel="nofollow">SuperUser answer</a>
* <a href="https://twitter.com/factormystic/status/428610122001432576" rel="nofollow">Tweet #2</a>
* [Exporting environment variables](ConEmuEnvironment.html#Export_variables)



{% comment %}
SSH agent working with @ConEmuMaximus5 and Git Bash. For multiple
tabs. Load your keys just once, use everywhere.
http://superuser.com/a/230872/234747
{% endcomment %}

{% comment %}
Here's a pretty nice one that works in Cygwin as well:
SSH_ENV=$HOME/.ssh/environment

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
     echo succeeded
     chmod 600 ${SSH_ENV}
     . ${SSH_ENV} > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -efp ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi


Add it to your .bash_profile or .bashrc

Source: http://www.cygwin.com/ml/cygwin/2001-06/msg00537.html
{% endcomment %}


{% comment %}
@rootpd @ConEmuMaximus5 or tell git to use plink, then use pageant.
{% endcomment %}
