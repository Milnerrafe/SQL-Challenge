# SQL-Challenge
A fun and educational way to learn SQL and solve an intriguing mystery about heroes and villains. Use your knowledge of SQL and Python, as well as your detective skills, to solve a mystery about a villainous incident, finding the villain’s hideout, and the heroes to stop them. This game uses SQL databases and tables to store information, that participants have to sort through to find out key details. Written in React, TypeScript, Flask, and Python. Open source under the MIT license. Feel free to play, host, or contribute in any way you wish.

Created by Rafe Milner ([Milnerrafe](milnerrafe.com)) and Adam Lowe ([cheesedoctor](https://github.com/cheesedoctor)) 



## Getting Started
Before starting, you must decide if you are going to host a SQL Challenge event or play in one. Even if you do not have a host, you can still play; just make sure not to look at the answers. 

### Host/Server Set Up

The First step, if you are hosting or playing without a host, is to download the needed host files from the [Releases](https://github.com/Milnerrafe/SQL-Challenge/releases) on the right-hand side of GitHub, click on the latest one and find the link for the server bundle and download it. You will also need a MySQL server with a network addressable IP and an account with all privileges to give to your users. If you need a guide to set up a MySQL server [this is a good one](https://dev.mysql.com/doc/mysql-getting-started/en/), and as always, ChatGPT is your best friend.

Once you have downloaded and unzipped the host release and set up your MySQL server. Go to the [UV download page](https://docs.astral.sh/uv/getting-started/installation/) and download UV for your os. You can then run the shell script for the folder that you unzipped; if you do not want to download UV or run a shell script, you can run main.py and install its dependencies, and it will work fine. (Please note you will need the MySQL client downloaded on the server computer, as it is needed for the server to work.)

Once you have started the server, all you will need to do is help your players by referring to the [Host Manual](github.com/test). Those who are playing on their own are advised not to look at the manual, as it has many spoilers and answers.

### Player Set Up

First, let's set up how you are going to use SQL. There are many ways, and as long as it can connect to MySQL, it will work. Therefore, for we suggest the use of MySQL Workbench,  you can learn how to set it up  [here]([github.com/test](https://github.com/Milnerrafe/SQL-Challenge/blob/main/Setting%20Up%20a%20MySQL%20Workbench%20and%20Server%20on%20Windows.pdf)); we also advise against using a SQL tool that just lets you look at the tables like Excel, as doing this, you may not learn as much SQL. For those who are not familiar with SQL, our guide [here]([github.com/test](https://github.com/Milnerrafe/SQL-Challenge/blob/main/SQL%20Guide.pdf)) will help.

Once you have SQL set up, we need to access the web app to get your detective tasks and check your answers. Go to https://sql-challenge.pages.dev/. First, you will need to enter your host's server URL in this format `http://serveripaddress:8000` do not include a trailing / at the end. 

Next, you will need to enter account details for your MySQL server. You can get these from your host, and they are the same used in MySQL Workbench from before; make sure that you have full privileges, or the server will not work 

Now the fun, follow the prompts in the web app and help the government recover from their disastrous Funko Pop spending decision.
