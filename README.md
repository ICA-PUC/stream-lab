# Stream Lab

Under the Sea streaming lab for codec simulations. The goal here is to experiment and measure the performance of video transmission over a simulated network.

Currently there are two Docker containers composed to communicate via rtmp protocol using ffmpeg and nginx.

## Installation instructions

Before building the images, please add a .yuv file to the data folder, this is the file that will be streamed. Update filenames in the `docker-entrypoint.sh` and the streamer `Dockerfile`, after that simply run `sh build_all.sh` in order to fetch and build the images.

## Running instructions

To test the application, run `docker compose up` and check for any errors in the containers outputs.

If no errors have been reported, the next step is to check for the container IP address (this can change between runs and builds).

```bash
$ docker inspect   -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' stream-lab-rtmp-server-1
172.22.0.3
```

With the IP at hand, open a rtmp client such as VLC to add and view the streaming feed.

### Opening stream with VLC

1. Click the "Media" menu
2. Click in "Open Network Stream"
3. Enter the container ip such as `rtmp://172.22.0.3/live/test`
4. Click "Play" and wait
