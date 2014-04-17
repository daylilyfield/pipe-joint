require 'coffee-script/register'

gulp = require 'gulp'
task = gulp.task.bind gulp
{src, dest, watch} = gulp

coffee = require 'gulp-coffee'

pipe = require './lib/pipe-joint'

task 'coffee', -> pipe [
  src 'lib/*.coffee'
  coffee()
  dest 'lib/'
]

task 'watch', -> watch 'lib/*.coffee', ['coffee']

task 'default', ['coffee']
