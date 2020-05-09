#!/bin/sh
docker run -p 8080:80 \
	-d \
	-e MapboxAccessToken=${MapboxAccessToken} \
	--name keplergl \
	--rm \
	ftopal/keplergl

