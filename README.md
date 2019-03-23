# goto
A tool logging server host for ssh to.

This tool will read all the ssh statements you've typed in the history and store them to `.server-list` file. 
You can use `goto.sh` to connect to the server you've connected by ssh. An alias is recommanded for this shell script.

You can add below into your .bashrc file or whatever other shell you are using currently.
> alias goto=[PATH_TO_THIS_REPO]/goto/goto.sh

After doing so, you can type *`goto [key-word]`* to connect to that server.
