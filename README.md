Beachbody Training
===

Introduction to Grunt
---

**GRUNT!  What's that!?**

In one word: automation. The less work you have to do when performing repetitive tasks like minification, compilation, unit testing, linting, etc, the easier your job becomes. After you've configured it, a task runner can do most of that mundane work for you—and your team—with basically zero effort.

Examples of automated tasks:

* SASS Compiling and mini-fication to CSS  (.css or .min.css)
* JS File mini-fication for production  (.min.js)
* Building file structure for new project, which keeps the organization of files dummy proof
 * Creating theme files for SASS
 * Pre-developed module structure

All this can be acheived with simple terminal commands using "grunt <*task*>"

**RESOURCE:** <http://gruntjs.com/>


Let's get started
---
First We must setup you local environment for this training. We are going to use a friendly developers github to pull files from:

**Create A New file folder in your finder (file structure) and clone the repository below:

**Clone:**

    https://github.com/designgawd/training.git
        or
    git@github.com:designgawd/training.git

Pull from **master**

Create a new branch
    "**git checkout -b <*branch*>**"
add your branch to the repository
    "**git push origin <*branch*>**"


Your branch can be used to play with grunt, make changes and explore grunt!  In future training you will be using this branch.


package.json
----

Package.json is a file that tells node all the dependencies that are needed for your app/server to run. The more information that you put into it, the more node "knows". *It also helps other developers know what you are building, as well as gives them a base to expand.*

Example:

    {
        "name":"Beachbody",
        "version":"0.1.0",
        "author": {
            "name": "Beachbody Web Development",
            "email": "webdevelopers@beachbody.com",
            "url": "http://www.beachbody.com"
        },
        "engines": {
            "node": "0.8.x"
        },
        "dependencies": {
            "handlebars": "~1.1.2",
            "grunt-lib-contrib": "~0.5.1"
        },
        "devDependencies":{
            "grunt":"~0.4.1",
            "grunt-contrib-watch":"~0.3.1",
            "grunt-contrib-compass":"~0.7.2",
            "grunt-contrib-uglify": "~0.2.2"
        },
        "peerDependencies": {
            "grunt": "~0.4.0"
        }
    }


npm Install
-----
**Do you have node.js installed?**

We are about to find out. In your command line, type "*node*".  If you get a *command not found* error, then node is not on your machine. Goto: **<http://nodejs.org/>** and follow the directions.

Once you have node install (or verified that it is installed), type ***npm Install*** in your terminal command line.  If you get an error about permissions, then run ***sudo npm Install*** and enter your login password you use to login to your computer daily.

- NPM stands for (node package management), it is the equivalent to a Ruby Gem

- Node is a javascript server that is based on Chromes Javascript Runtime (V8)

At this point, grunt has been installed into your local file structure.

There is a way to install an individual module of grunt with ***npm install <module> --save-dev***, and this will be added to the package.json, but this will be explained later.

**You can remove the following sections - I just find them fascinating**

NOTE
-----

- If any of your NPM installs fail due to a gym-rebuild error, make sure that you have a C compiler _easiest way to make sure this doesn't happen is to install **Xcode** and have all the tools enabled - this adds a C compiler_


Resources for Learning Node
-----

- <http://howtonode.org/>
- <http://nodetuts.com/>
- <http://www.nodebeginner.org/>


Setting Up Gruntfile.js
-----

This file is named **Gruntfile.js** and is used to configure or define tasks and load Grunt plugins. The **package.json** file belongs in the root directory of your project, next to the Gruntfile.js , and should be committed with your project source.

You can use javascript throughout this file to support your tasks. Lets take a look at a basic Gruntfile.js ***grunt.initConfig*** setup.

    module.exports = function(grunt){
        "use strict";

        // Grunt Configurations
        grunt.initConfig({
            compass: {
                dist: {
                    options: {
                        sassDir: 'sass/',
                        cssDir: 'css/',
                        specify: 'scss/**/*.scss',
                        banner: '/*! \n<%= pkg.name %> \nLast Updated: <%= grunt.template.today("yyyy-mm-dd") %> */\n',
                        outputStyle: 'compressed'
                    }
                }
            },
            watch: {
                css: {
                    files: '**/*.scss',
                    tasks: ['compass']
                }
            }
        });

        grunt.loadNpmTasks('grunt-contrib-watch');
        grunt.loadNpmTasks('grunt-contrib-compass');

        grunt.registerTask('default',['compass']);
    };

To run this task in your terminal, just type ***grunt***.  If you have other registered tasks you can call them out individually by running ***grunt [task]***.

For example: Lets run the watch task by typing ***grunt watch*** in your command line.  Notice how your terminal stays in watch mode.  The way the watch task is configured, it tells grunt every time you make a change to any SASS file, to compile it compressed to the CSS directory.