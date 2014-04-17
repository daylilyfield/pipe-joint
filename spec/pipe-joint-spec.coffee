stream = require('stream')
pipe = require '../lib/pipe-joint'

describe 'pipe-joint', ->

  class First extends stream.Readable

    constructor: ->
      super()
      @max = 10
      @index = 0

    _read: ->
      if @max > @index++
        @push "#{@index}"
      else
        @push null

  class Second extends stream.Transform

    _transform: (chunk, encoding, done) ->
      @push chunk
      done()

  class Third extends stream.Writable

    constructor: ->
      super()
      @total = 0

    _write: (chunk, encoding, done) ->
      @total += parseInt(chunk.toString('utf8'))
      done()

  proceed = (seq) -> seq()

  it 'should chain stream created by factory function', ->
    first = new First
    second = new Second
    third = new Third

    proceed -> pipe [
      -> first
      -> second
      -> third
    ]

    third.on 'end', -> expect(third.total).toBe 55

  it 'should chain stream itself', ->
    first = new First
    second = new Second
    third = new Third

    proceed -> pipe [
      first
      second
      third
    ]

    third.on 'end', -> expect(third.total).toBe 55

  it 'should chain stream and factory function', ->
    first = new First
    second = new Second
    third = new Third

    proceed -> pipe [
      first
      -> second
      third
    ]

    third.on 'end', -> expect(third.total).toBe 55


  it 'should chain stream and nested factory function', ->
    first = new First
    second = new Second
    third = new Third

    proceed -> pipe [
      -> first
      -> -> second
      -> -> -> third
    ]

    third.on 'end', -> expect(third.total).toBe 55
