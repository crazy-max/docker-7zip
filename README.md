<p align="center"><a href="https://github.com/crazy-max/docker-7zip" target="_blank"><img height="128" src="https://raw.githubusercontent.com/crazy-max/docker-7zip/master/.github/docker-7zip.jpg"></a></p>

<p align="center">
  <a href="https://hub.docker.com/r/crazymax/7zip/tags?page=1&ordering=last_updated"><img src="https://img.shields.io/github/v/tag/crazy-max/docker-7zip?label=version&style=flat-square" alt="Latest Version"></a>
  <a href="https://github.com/crazy-max/docker-7zip/actions?workflow=build"><img src="https://img.shields.io/github/actions/workflow/status/crazy-max/docker-7zip/build.yml?branch=master&label=build&logo=github&style=flat-square" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/crazymax/7zip/"><img src="https://img.shields.io/docker/stars/crazymax/7zip.svg?style=flat-square&logo=docker" alt="Docker Stars"></a>
  <a href="https://hub.docker.com/r/crazymax/7zip/"><img src="https://img.shields.io/docker/pulls/crazymax/7zip.svg?style=flat-square&logo=docker" alt="Docker Pulls"></a>
  <br /><a href="https://github.com/sponsors/crazy-max"><img src="https://img.shields.io/badge/sponsor-crazy--max-181717.svg?logo=github&style=flat-square" alt="Become a sponsor"></a>
  <a href="https://www.paypal.me/crazyws"><img src="https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square" alt="Donate Paypal"></a>
</p>

## About

Docker image for [7-Zip](https://www.7-zip.org/) built from sources.

> **Note**
> 
> Want to be notified of new releases? Check out 🔔 [Diun (Docker Image Update Notifier)](https://github.com/crazy-max/diun)
> project!

___

* [Build locally](#build-locally)
* [Image](#image)
* [Usage](#usage)
* [Contributing](#contributing)
* [License](#license)

## Build locally

```shell
git clone https://github.com/crazy-max/docker-7zip.git
cd docker-7zip

# Build image and output to docker (default)
docker buildx bake

# Build multi-platform image
docker buildx bake image-all
```

## Image

| Registry                                                                                         | Image                           |
|--------------------------------------------------------------------------------------------------|---------------------------------|
| [Docker Hub](https://hub.docker.com/r/crazymax/7zip/)                                            | `crazymax/7zip`                 |
| [GitHub Container Registry](https://github.com/users/crazy-max/packages/container/package/7zip)  | `ghcr.io/crazy-max/7zip`        |

Following platforms for this image are available:

```
$ docker run --rm mplatform/mquery crazymax/7zip:latest
Image: crazymax/7zip:latest
 * Manifest List: Yes
 * Supported platforms:
   - linux/386
   - linux/amd64
   - linux/arm/v6
   - linux/arm/v7
   - linux/arm64
   - linux/ppc64le
   - linux/s390x
```

## Usage

Compress the mounted folder `/root` to `root.7z` :

```bash
docker run --rm --workdir /data -it -v /root:/data crazymax/7zip 7za a root.7z .
```

Extract archive `root.7z` from the mounted folder `/root` :

```bash
docker run --rm --workdir /data -it -v /root:/data crazymax/7zip 7za x root.7z
```

Use tar if you want to preserve Unix ownership / permissions :

```bash
docker run --rm --workdir /data -it -v /root:/data crazymax/7zip sh -c 'tar cvf - * | 7za a -si root.tar.7z'
```

## Contributing

Want to contribute? Awesome! The most basic way to show your support is to star
the project, or to raise issues. You can also support this project by [**becoming a sponsor on GitHub**](https://github.com/sponsors/crazy-max)
or by making a [PayPal donation](https://www.paypal.me/crazyws) to ensure this
journey continues indefinitely!

Thanks again for your support, it is much appreciated! :pray:

## License

MIT. See `LICENSE` for more details.<br />
Icon credit to [finfin](https://utopian.io/utopian-io/@finfin/new-logo-icon-proposal-for-7-zip).
