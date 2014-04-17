module.exports = (streams = []) ->
  streams.map (stream) ->
    makeStreamFrom stream
  .reduce (left, right) ->
    left.pipe right

makeStreamFrom = (stream) ->
  if typeof stream.pipe is 'function'
    stream
  else if typeof stream is 'function'
    makeStreamFrom stream()
  else
    raise 'cannot create stream'

raise = (message) -> throw new Error message
