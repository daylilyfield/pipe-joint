pipe-joint
==========

you can pipe streams with a bit better notation to read.

How to Install
--------------

```sh
npm install pipe-joint
```

Usage Example
-------------

when we use streams, for example with [gulp](http://gulpjs.com/), we usually
write a build script like below.

```coffeescript
gulp = require 'gulp'
task = gulp.task.bind gulp
{src, dest, watch} = gulp

task 'script', ->
  src('lib/*.js')
    .pipe concat('index.js')
    .pipe dest('script')
    .pipe uglify()
    .pipe rename(folder + '.min.js')
    .pipe dest('script'))
```

pipe, pipe, pipe... i get tired of typing too much ``pipe``. by using
pipe-joint, you can write your build script like below.

```coffeescript
gulp = require 'gulp'
task = gulp.task.bind gulp
{src, dest, watch} = gulp

task 'script', -> pipe [
  src 'lib/*.js'
  concat 'index.js'
  dest 'script'
  uglify()
  rename 'index.min.js'
  dest 'script'
]
```

or, you can specify not only stream but factory which make stream.

```coffeescript
gulp = require 'gulp'
task = gulp.task.bind gulp
{src, dest, watch} = gulp

task 'script', -> pipe [
  -> src 'lib/*.js'
  -> concat 'index.js'
  -> dest 'script'
  -> uglify()
  -> rename 'index.min.js'
  -> dest 'script'
]
```

you can mix streams and factories in single pipe-joint.

API
---

``pipe(streamsOrStreamFactories)``

- streamsOrStreamFactories: Array<stream.Stream|Function>

  streams or stream factories which are chained by specified order.

License
-------

The MIT License (MIT)

Copyright (c) 2014 daylilyfield

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
