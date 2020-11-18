Icecast to HLS Docker
===

This image aims to provide a proper and robust audio backend for streaming from an Icecast source.

I use it mainly as a way to stream audio from Traktor.

In conjunction with a Varnish server, or a GCP/AWS CDN, it can provide fragments to a wide audience.
Alternatively, fragments can be pushed to a S3 container.

## Environment Variables

`HTTP_PORT` - HTTP server port *(defaults to `80`)*  
// HTTP_PATH - HTTP server path *(defaults to `/`)*  ! not implemented yet  

`ICECAST_USERNAME` - Username to stream to icecast *(defaults to `'hackme'`)*  
`ICECAST_PASSWORD` - Password to stream to icecast *(defaults to `'hackme'`)*  
`ICECAST_PORT` - Port the icecast server should be listening to *(defaults to `$HTTP_PORT`)*  


  `S3_ACCESS_KEY` - S3 Access Key *(defaults to `'none'`)*  
  `S3_SECRET_KEY` - S3 Access Key *(defaults to `'none'`)*  
  `S3_ENDPOINT` - S3 Endpoint *(defaults to `'none'`)*  
  `S3_REGION` - S3 Region *(defaults to `'none'`)*  
  `S3_BUCKET` - Bucker where segments should be uploaded *(defaults to `'none'`)*  
  `S3_PATH` - Path inside the s3 bucket segments should be uploaded in *(defaults to `'none'`)*  

## Docker Compose

```yml
  icecast-to-hls:
    build: ./icecast-to-hls # no hosted image yet
    container_name: icecast-to-hls
    ports:
      - "80:80"
    environment:
      ICECAST_USERNAME: timlebrun
      ICECAST_PASSWORD: password123
```

## Roadmap
- [x] Output HLS from an Icecast stream
- [ ] Handle and server metadata as JSON
- [ ] Implement S3 upload
- [ ] (maybe) Implement playlist URL balancing ? 