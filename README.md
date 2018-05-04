## [Dasing](http://dashing.io/)/[Smashing](https://smashing.github.io/) tutorial.

The purpose of this tutorial to show queue of steps for creating simple dasboard. This dashboard should have 2 wiether widgets with Temperature, the data should be requered via `JOB` but HTTP request. And 1 widget that get information using `API` call. I'm using `Windows 8` and `Ruby 2.3.3.`.

### 1. Install Smashing.  
Take a look for a little bit I made decision to use [Smashing](https://smashing.github.io) because it's looks exactly the same in documentation. But the code is newer.

- `$ gem install smashing`  
- `$ smashin new dashing-tutorial` Create new `dashing-tutorial` folder where put all necessary files.
- `$ cd dashing-tutorial` 
- `$ bundle` this istall all required gems for running dashing.
- `$ smashing start` boom Error **`rescue in create_default_data_source': No source of timezone data could be found. (TZInfo::DataSourceNotFound)**

#### It was very predicatble that it's big problem to run something on windows. Going to try Ubuntu.

### 1.5. Comming back to Linux (this is my just for log). 
Because it's as usually failed to fire something a slightly serious using Windows and Ruby. I came back to my virtual UBUNTU. First I need to chech what servers are runing.
- `$ sudo netstat -plunt` and if I found that some servers run I going to turn them off.
- `$ sudo systemctl status nginx` and `$ sudo systemctl status apache2` or `$ sudo systemctl -all | grep -E 'apache|nginx'` find what is working.
- `$ sudo systemctl stop apache2`  stop apache service.
- `$ sudo netstat -plunt` to check that the ports dose not listen any more.

### 1.6 Manipulations with Git (`ssh-add -l`, `git config`, `git clone`)
Hey it's nice I already have SSH keys installed both on github and my VM vare version. But if you need to do it, [you can check it here](https://vjuh-developer.livejournal.com/1266.html 2 Use multiple accounts at the bitbucket).
- check `$ git --config user.name; git --config user.email`
- chage `$ vim .gitconfig`
- Now in windows I got the name of this repo `git remote -v`
- And clone this repo address into linux ssh cli, this would be great.  
`git clone git@github.com:lbvf50mobile/dashing-tutorial.git`

Nice now I have this repo at the Linux virtual machine. 