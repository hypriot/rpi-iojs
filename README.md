# rpi-iojs

Raspberry Pi compatible Docker base image with [io.js](https://iojs.org).

## Details
- [Source Project Page](https://github.com/hypriot)
- [Source Repository](https://github.com/hypriot/rpi-iojs)
- [Dockerfile](https://github.com/hypriot/rpi-iojs/blob/master/Dockerfile)

## How to use this image

If you want to distribute your application on the docker registry, create a `Dockerfile` in the root of application directory:

```
FROM hypriot/rpi-iojs:onbuild

# Expose the ports that your app uses. For example:
EXPOSE 8080
```

Then simply run:

```bash
$ docker build -t rpi-iojs-app .
...
$ docker run --rm -it rpi-iojs-app
```

To run a single script, you can mount it in a volume under `/usr/src/app`. From the root of your application directory (assuming your script is named `index.js`):

```bash
$ docker run -v ${PWD}:/usr/src/app -w /usr/src/app -it --rm hypriot/rpi-iojs iojs index.js
```

## Contributing

Run all the commands from within the project root directory.

### Build the Docker Image
```bash
cd 1.6
make build
cd slim
make build
cd ../onbuild
make build
```

#### Run the Docker Image and get the version of the installed io.js
```bash
make version
```

#### Push the Docker Image to the Docker Hub
* First use a `docker login` with username, password and email address
* Second push the Docker Image to the official Docker Hub

```bash
make push
```

## License

View [license information](https://github.com/iojs/io.js/blob/master/LICENSE) for the software contained in this image.

### License for the Dockerfile

The MIT License (MIT)

Copyright (c) 2015 Hypriot

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
