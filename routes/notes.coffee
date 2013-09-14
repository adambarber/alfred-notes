exports.index = (req, res) ->
  res.render 'notes/index'

exports.show = (req, res) ->
  res.render 'notes/show'

exports.create = (req, res) ->
  note = req.body
  console.log "adding wine: #{JSON.stringify(note)}"
  res.send('success!')