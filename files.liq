# Feel free to override this file to customize behavior on file change

def on_hls_file_change(~state, file) =
  print("Updated #{file} (#{state})")
  # @todo update some kind of CDN here, or upload to S3 ?

  # For S3, just upload with x lifetime
end