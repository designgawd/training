module.exports = function(grunt){
    "use strict";

    //Project Configuration
    grunt.initConfig({
        pkg:grunt.file.readJSON('package.json'),
        compass: {
            compile: {
                options: {
                    sassDir: '',
                    cssDir: '',
                    outputStyle: 'compressed'
                }
            }
        },
        uglify: {
            options: {
                banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
            },
            build: {
                src: 'text/modules/source/**/*.js',
                dest: 'text/modules/release/**/**.min.js'
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
    grunt.loadNpmTasks('grunt-contrib-uglify');

    grunt.registerTask('default',['compass']);


};