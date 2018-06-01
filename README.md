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

#### 2.4 Now write class that going to send Request to a Weather server
- first I create the file `$ touch WEATHER_TOKEN` this file will not be in git ignore to avoid saving tokins in github.
- I create the file that going to save put `WEATHER_TOKEN` into the env `WEATHER_TOKEN`, and this file is `weather.sh`
- **Incorrect** Now to push tocket into ENV need to fire `$ ./weather.sh` 
- **!!! IMPORTANT** after run `.wather.sh` all things works in context of bach file, but dose not work in laiter called ruby file. Need to insert manually content of `$ ./weather.sh` and after manual insert it's works.
- [Now I need to know how to delte variable](https://www.digitalocean.com/community/tutorials/how-to-read-and-set-environmental-and-shell-variables-on-a-linux-vps) `$ export -n WEAHTER_TOKEN`.
- Need to use `source weather.sh`

#### 2.5 Use rbenv-vars to save environment variable.
When in Linux it's better to use [rbenv-var](https://github.com/rbenv/rbenv-vars)

- I going to check to the Environment variable set `$ printenv WEATHER_TOKEN`
- Then I going to delete it if it's exists `$ export -n WEATHER_TOKEN' and check again do it exists `$ printenv WEATHER_TOKEN`
- Next I'll create `.rbenv-vars` file by `$ touch .rbenv-vars` and put data from `WEATHER_TOKEN` file to this new created file `$ cat WEATHER_TOKEN > .rbenv-vars` and add `WEATHER_TOKEN=` prefix.
- `$ echo "WEATHER_TOKEN="$(cat 'WEATHER_TOKEN') > .rbenv-vars` feels great.
- `$ ruby test/weather_test.rb` works fine. but `$ printenv WATHER_TOKEN` is empty. Great and Neat.
- Now start the the `$ smashing start` work.

### 3 Using API
- I created new `data-view="Number"` widget with `data-id="api"` at the `dashboard/sample.rb`.
```
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
      <div data-id="api" data-view="Number" data-title="Send data Using API"  ></div>
</li>
```
- at the `config.ru` I add token `LETTESTALONGLONGTOKEN`
```
  set :auth_token, 'LETTESTALONGLONGTOKEN'
```
- and prepare `api.sh`, take a look on similarities http://localhost:3030/widgets/**api**  and data-id="**api**", also on set of json vaules.
```
curl -d '{ "auth_token": "LETTESTALONGLONGTOKEN", "current": "100", "last": "50" }' http://localhost:3030/widgets/api
```
- Upload data to the liniux, fire `source api.sh` and data transfered to the widget.

### 4 Creating my new Widget.

- Now I know what to do in term of Coffie Script, and main thing I need to find path how to `complie`.
- I going to create widget called `num` to show just one number. It going to have 2 elements `title` and `num` where I going to place number.
- I create new `num` dir for the new widget: `$ mkdir widgets/num; [ -d widgets/num ] && echo "The dir is created" || echo "The dir is not created"`
- Next I'll create `num.html` file: `$ touch widgets/num/num.html; [ -f widgets/num/num.html ] && echo "file ok" || echo "file fail"`
- In this file I going to have only 3 things: `title`, `num` and `num10` the multiplication num*10 to test some scripts action.
- So here I created simple `widgets/num/num.html` contet, three lines with `b` tag and `data-bind` attribute for each field:
```
title: <b data-bind="title"></b><br/>
num: <b data-bind="num"></b><br/>
num10: <b data-bind="num10"></b><br/>
```
- It's time for coffie script: `$ touch widgets/num/num.coffee; [ -f widgets/num/num.coffee ] && echo "c ok" || echo "c fail"`
- When file is created, I going add programm code to it.
```
class Dashing.Num extends Dashing.Widget
    @accessor 'num', Dashing.AnimatedValue
    @accessor 'num10', ->
        num10 = @get('num') * 10
        "#{num10}"
```
- It's time to create styles for newly create widget: and I going to copy this from the `number` widged, and then change it a little bit.
- Copy and check: `$ cp widgets/number/number.scss widgets/num/num.scss; [ -f widgets/num/num.scss ] && echo "copy ok" || echo "copy fail"`
- and add slight change, `number` subsitute with `num`
- Inserting newly created widget into the dashboard: I going to open the `dashboards/sample.erb` and add new `li` element there; with `data-id="n" data-view="Num" data-title="new Widget"`  
`data-id="n"`  
`data-view="Num"`  
`data-title="new Widget"`  
- new `li` added to the `dashboards/sample.erb`
```
<li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
      <div data-id="n" data-view="Num" data-title="new Widget"></div>
</li>
```
- Now going to chage `api.sh` file and add curl to send data to the `n` instance of the `Number` windget.
```
curl -d '{ "auth_token": "LETTESTALONGLONGTOKEN", "num": "77"}' http://localhost:3030/widgets/n
```
The `data-id="n"` stored into the `http://localhost:3030/widgets/n`
- and Test time, I fire the server with `smashing start` 
- and in new terminal window fire `source api.sh`
- **IT works!**

### 5 Read data from Google Sheets
- Docs here [gist](https://gist.github.com/lbvf50mobile/8a6115152e71fe2b8886cc6bf92b5b52), [youtube PY](https://youtu.be/vISRn5qFrkM), [youtube Ruby](https://youtu.be/TU1znISrAGg "Ruby")
- My First step is to add dependencies into the `Gemfile`: `gem 'google-api-client'`, `gem 'google_drive'`  
`$ echo "gem 'google_drive'" >> Gemfile; echo "gem 'google-api-client'" >> Gemfile; bundle`   
**THIS TOOK 5-10 minutes. `google-api-client` took some time**

#### 5.1 Create Keys. 
- go to [google console](https://code.google.com/apis/console) and click `Create Project`  
![Create Project](https://raw.githubusercontent.com/lbvf50mobile/dashing-tutorial/master/img/001.png)
- I'll call it `widgetgoogle`  
![I call this project widgetgoogle](https://raw.githubusercontent.com/lbvf50mobile/dashing-tutorial/master/img/002new.png)
- Then click on this project name `widgetgoogle`  
![click on project name](https://raw.githubusercontent.com/lbvf50mobile/dashing-tutorial/master/img/003new.png)
- Then click on big google API's when this project is selected.  
![select API's](https://raw.githubusercontent.com/lbvf50mobile/dashing-tutorial/master/img/004new.png)
- click enable API's and Services  
![click on Enable Api's and services](https://raw.githubusercontent.com/lbvf50mobile/dashing-tutorial/master/img/005new.png)
- select `Drive` and enable it.
![Select Dirve and Enbale it](https://raw.githubusercontent.com/lbvf50mobile/dashing-tutorial/master/img/006.png)
- copy widget here wg.json

#### 5.2 Create Widget.
- create Directory for a new widget. I'll do it using `google_widget.sh` just because it faster.
- Add data to the `dashboards/sample.erb`
```
<li data-row="2" data-col="1" data-sizex="1" data-sizey="1">
  <div data-id="google_spreadsheet" data-view="GoogleSpreadsheet" data-title="Google Spreadsheet Cells Value"></div>
</li>
```


#### 6 OpenSSh
- `sudo systemctl status ssh`
- `sudo cat /etc/ssh/sshd_config`
- `[ -f /etc/ssh/sshd_config ] && echo "yes this is file" || echo "no problem"`
- `git clone https://github.com/lbvf50mobile/dashing-tutorial.git`
- `cd dashing-tutorial`
- `source sh/01check`

#### 7 Working on RPI
- First I need to make copy of `.bashrc`, and I going to check correct name `ls -alF | grep bash`, `cat .bashrc`, from `~` fire `source dashing-tutorial/sh/03bashrc.sh`
- Now I need to create ssh using keys.  adding 3 new lines to the `/etc/ssh/sshd_config`, I add this data there `source dashing-tutorial/sh/04chssh.sh` again run from  the `~`  
- I add scrit `sh/05restoressh.sh` to restore `/etc/ssh/sshd_config` in case of acceidend.
- `sudo systemctl status ssh`
- `sudo systemctl restart ssh`
- Just created new key called rpi, and again
- `sudo systemctl status ssh`
- `sudo systemctl restart ssh`
- now connection to rpi works like this `ssh -p PORT -i ~/.ssh/rpi pi@IP`
- create script to install rbenv this script will be at the `sh/06rbenv.sh`
- no I going to install rbenv vars and it will be by the script `sh/07vars.sh`
- `$ rbenv install 2.3.1`
- `$ scp -p PORT -i ~/.ssh/rpi wg.json pi@IP:~/dashing-tutorial/wg.json` **not work, impemented by VI, and .rbenv-vars too**
- `$ gem install bundler`
- `sudo gem install bundler`

