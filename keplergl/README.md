# Kepler.gl in Docker container

* [http://kepler.gl](http://kepler.gl)
* [https://github.com/keplergl/kepler.gl](https://github.com/keplergl/kepler.gl)

## Pull

```bash
docker pull ftopal/keplergl
```

## Run

Execute the run-kepler.gl.sh or run the command below. For `run-kepler.gl.sh` you must set `MapboxAccessToken` variable
in your environment. 

```bash
docker run  \
    --name keplergl \
    --rm \
    -p 8080:80 \
	-e MapboxAccessToken="yourMapboxAccessToken" \
    -d \
    ftopal/keplergl
```

Some modules need to be build at startup. Therefore, it will a take a minute until the container is ready to use
at [http://localhost:8080](http://localhost:8080).
