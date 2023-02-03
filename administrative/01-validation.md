@channel  Activity 01-Validation
Due:  Tuesday 16:59:59  (5PM)
--
Once you believe that you have successfully setup your environment
for COMP122, and have completed assignments 02- and 03-, execute the following commands.

Each command needs to be executed on the the command line, one at a time. (That 
is to say *DO NOT* cut-and-paste the following code block into the terminal.)

Then respond to this thread, via a code-snippet that contains the cut-and-paste of the commands you typed and the results associated with those commands.

The Professor will review the results to provide an associated grade.

```
echo $0
echo $HOME
cd ~/classes/comp122/
git pull
echo ~/.bash*
cat ~/.profile
which subl
java --version
which mars
cd ~/classes/comp122/deliverables/
git config --get user.name
git config --get user.email
ls ~/.ssh/id_ed25519.pub
ssh -T git@github.com
git -C 02-* config --get remote.origin.url
git -C 02-* log -n 1
git -C 03-* config --get remote.origin.url
git -C 03-* log -n 1
```







