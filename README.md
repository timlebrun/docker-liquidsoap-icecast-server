Icecast to HLS Docker
===

This image aims to provide a proper and robust audio backend for streaming from an Icecast source.

I use it mainly as a way to stream audio from Traktor.

In conjunction with a Varnish server, or a GCP/AWS CDN, it can provide fragments to a wide audience.
Alternatively, fragments can be pushed to a S3 container.

## Environment Variables

`HTTP_PORT` - HTTP server port *(defaults to `80`)*  
`HTTP_PATH` - HTTP server path *(defaults to `/`)*

`ICECAST_USERNAME` - Username to stream to icecast *(defaults to `'hackme'`)*  
`ICECAST_PASSWORD` - Password to stream to icecast *(defaults to `'hackme'`)*  
`ICECAST_PATH` - Port the icecast server should be listening to *(defaults to `$HTTP_PATH`)*  
`ICECAST_PORT` - Path the icecast server should be listening at *(defaults to `$HTTP_PORT`)*  

`HLS_PATH` - Path where the HLS server should be serving playlist and segments *(defaults to `$HLS_PATH`)*  
`HLS_PORT` - Port the HLS server should be serving playlist and segments from *(defaults to `$HLS_PORT`)*  
`HLS_SEGMENTS_COUNT` -  Maximum number of segments in the playlist *(defaults to `10`)*  
`HLS_SEGMENTS_OVERHEAD` - Maximum number of segments kept after leaving playlist *(defaults to `5`)*  
`HLS_SEGMENTS_DURATION` - Duration in second of each segment *(defaults to `2.0`)*  

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
- [x] Handle and server metadata as JSON
- [x] Allow HLS configuration from ENV
- [ ] Implement S3 upload
- [ ] (maybe) Implement playlist URL balancing ? 