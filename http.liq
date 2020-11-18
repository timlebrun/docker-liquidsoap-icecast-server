
# @see http://u.delta9.pl/k/liquidsoap/scripts/set_json_metadata.html

def http_serve_metadata(source, path, port) =
  meta = ref [];

  def update_metadata(m) = 
    title = m["title"]
    artist = m["artist"]
    print("Now playing: #{title} by #{artist}")

    m = metadata.export(m)
    recode = string.recode(out_enc="UTF-8")

    def f(x) =
      (recode(fst(x)),recode(snd(x))) 
    end
    
    meta := list.map(f, m)
  end


  def http_get_meta(~protocol,~data,~headers,uri) =
    m = !meta
    http_response(
      protocol=protocol,
      code=200,
      headers=[("Content-Type","application/json; charset=utf-8")],
      data=json_of(m)
    )
  end

  source = on_metadata(update_metadata, source)
  harbor.http.register(port=port, method="GET", path, http_get_meta)

  source
end
