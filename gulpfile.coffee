gulp = require 'gulp'
task = gulp.task.bind gulp
{src, dest, watch} = gulp
coffee = require 'gulp-coffee'

task 'coffee', ->
  src 'lib/*.coffee'
    .pipe coffee()
    .pipe dest 'lib/'

task 'watch', -> watch 'lib/*.coffee', ['coffee']

task 'default', ['coffee']
