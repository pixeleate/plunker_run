module.exports.middleware = (config = {}) ->
  (req, res, next) ->
    # Just send the headers all the time. That way we won't miss the right request ;-)
    # Other CORS middleware just wouldn't work for me
    # TODO: Minimize these headers to only those needed at the right time

    res.set("Access-Control-Allow-Origin", req.headers.origin or "*")
    res.set("Access-Control-Allow-Methods", "OPTIONS,GET,PUT,POST,DELETE")
    res.set("Access-Control-Allow-Headers", "Authorization, User-Agent, Referer, SourceMap, X-Requested-With, Proxy-Authorization, Proxy-Connection, Accept-Language, Accept-Encoding, Accept-Charset, Connection, Content-Length, Host, Origin, Pragma, Accept-Charset, Cache-Control, Accept, Content-Type")
    res.set("Access-Control-Expose-Headers", "Link")
    res.set("Access-Control-Max-Age", "60")

    if "OPTIONS" == req.method then res.send(200)
    else next()