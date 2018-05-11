## [Dasing](http://dashing.io/)/[Smashing](https://smashing.github.io/) tutorial.

The purpose of this tutorial to show queue of steps for creating simple dasboard. This dashboard should have 2 wiether widgets with Temperature, the data should be requered via `JOB` but HTTP request. And 1 widget that get information using `API` call. I'm using `Windows 8` and `Ruby 2.3.3.`.

### 1. Install Smashing.  
Take a look for a little bit I made decision to use [Smashing](https://smashing.github.io) because it's looks exactly the same in documentation. But the code is newer.

- `$ gem install smashing`  
- `$ smashin new dashing-tutorial` Create new `dashing-tutorial` folder where put all necessary files.
- `$ cd dashing-tutorial` 
- `$ bundle` this istall all required gems for running dashing.
- `$ smashing start` boom Error **`rescue in create_default_data_source': No source of timezone data could be found. (TZInfo::DataSourceNotFound)**

**It was very predicatble that it's big problem to run something on windows. Going to try Ubuntu.**

#### 1.5. Comming back to Linux (this is my just for log). 
Because it's as usually failed to fire something a slightly serious using Windows and Ruby. I came back to my virtual UBUNTU. First I need to chech what servers are runing.
- `$ sudo netstat -plunt` and if I found that some servers run I going to turn them off.
- `$ sudo systemctl status nginx` and `$ sudo systemctl status apache2` or `$ sudo systemctl -all | grep -E 'apache|nginx'` find what is working.
- `$ sudo systemctl stop apache2`  stop apache service.
- `$ sudo netstat -plunt` to check that the ports dose not listen any more.

#### 1.6 Manipulations with Git (`ssh-add -l`, `git config`, `git clone`)
Hey it's nice I already have SSH keys installed both on github and my VM vare version. But if you need to do it, [you can check it here](https://vjuh-developer.livejournal.com/1266.html).
- check `$ git --config user.name; git --config user.email`
- chage `$ vim .gitconfig`
- Now in windows I got the name of this repo `git remote -v`
- And clone this repo address into linux ssh cli, this would be great.  
`git clone git@github.com:lbvf50mobile/dashing-tutorial.git`

Nice now I have this repo at the Linux virtual machine. 

#### 1.7 Start dashboard on linux and make it visible on Windows browser. 
- To make thigs working faster I have an aliases in `.bashrc`
```
alias pu='git push'
alias pl='git pull'
alias s='git status'
```
So getting new verison of my code from Windows, I need just print `$ pl`.  
- Ok. Fire `$ bundle`
- `$ smahing start` it works. And it's listing for `0.0.0.0:3030` this meand it's going to listen for all interfaces.
- `ifconfig -a` get my local IP.
-  `http://192.168.1.39:3030/sample` in wondows browser and it's works fine. Iable to see this dashboard at the Linux Virtual machine, from my Windows workstaton.
**Success the dashboard available**

#### 1.7.1 Running smashing in BACKGROUND (be Able to close the SSH connettion with Linux Virtual Machine)
- First I need to find what process is listing `0.0.0.0:3030` and I going to use `$ sudo netstat -plunt` and `$ ps -aux | grep {pid_or_name}`
- PID/Program name is `11337/thin -R confi`
- and when I'm colsing the ssh conection with Virtual machine it's disapears. I cannot connect to it.
- `$ smashing start &`to start program and be able to close terminal. And after this call it going to show the PID of process something like this `11912`
- but it's intersting after `sudo netstat -plunt` I see the name/pid `11929/thin -R confi`. I'll try to `kill 11912` and check what happens. Nothng happes
- killing via `sudo netstat -plunt` and `kill` PID I found listining `0.0.0.0:3030`

## Creating 2 Widgets updated with JOB.
- At `/dashboards/sample.rb` I create two widjets with `data-view="Number"` and two different **data-id**: `data-id="wiether_salt"` and  `data-id="wiether_nsk"`.
- `data-view="Number"` - it's a type of widget.  
```
    <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
      <div data-id="wiether_salt" data-view="Number" data-title="Weather in Salt Lake City"  "></div>
    </li>
     <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
      <div data-id="wiether_nsk" data-view="Number" data-title="Weather in Novosibirsk"  ></div>
    </li>
```
- **data-id**: `data-id="wiether_sault"` and  `data-id="wiether_nsk"` these are addresses of widgets. On this adreses I going to send information.
- At the `jobs\sample.rb` I add two evetns that going to send infromation on newly created widgets using it's adresses. `data-id="wiether_salt"` and  `data-id="wiether_nsk"
```
  send_event('wiether_salt',   { current: current_wiether_salt, last: last_wiether_salt })
  send_event('wiether_nsk',   { current: current_wiether_nsk, last: last_wiether_nsk})
```
### 2.1 Create class to use if fot getting data from 3rd party server.

#### 2.2 Using minitest.
- First add minitest to a gemfile.
- And start `$ bundle` now we have a `minitest` installed and able to create classes that going to be used by **Smashing**
- Create folder for test and file: `$ mkdir test`, `$ touch test/test_helper.rb` 
- Create file `test/wether_test.rb` in this file I going to test the class for delivering data to data widget.
- When file is created it's possbile to fire test with `ruby test/weater_test.rb` and **use all power of TDD, in reach for success in the application**
- I added a new class `DashApp::Weather` into the `lib` folder, and it's automatically loaded into the `jobs/sample.rb` when I start smashing.


#### 2.3 Set token variable to store in file and than to be achieve from the script.
- Create variable `$ VARNAME=15`
- Read variable `echo $TESTA`
- Export var to envirotnmen `$ export TESTA`
- Read variable from ruby script: `$ ruby -e "p ENV['TESTA']`
- Create file for tocken `$ touch tmp`, save data tocken data in the `tmp` file, `$ echo "MyTocken" > tmp`
- Save token valule from file to a `TESTA` variable. `$ TESTA=$(cat 'tmp')` and check `echo $TESTA`
- Greate. no need to use `export` it's already in environment: `$ ruby -e "p ENV['TESTA']`
- Wonderfull now We able to have Tokens in files, and do not include this files in git, by inclusing them into the `.gitignore`.
