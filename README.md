<p align="center"><a href="https://github.com/crazy-max/docker-7zip" target="_blank"><img height="128" src="https://raw.githubusercontent.com/crazy-max/docker-7zip/master/.res/docker-7zip.jpg"></a></p>

<p align="center">
  <a href="https://github.com/crazy-max/docker-7zip/actions?workflow=build"><img src="https://img.shields.io/github/workflow/status/crazy-max/docker-7zip/build?label=build&logo=github&style=flat-square" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/crazymax/7zip/"><img src="https://img.shields.io/docker/stars/crazymax/7zip.svg?style=flat-square&logo=docker" alt="Docker Stars"></a>
  <a href="https://hub.docker.com/r/crazymax/7zip/"><img src="https://img.shields.io/docker/pulls/crazymax/7zip.svg?style=flat-square&logo=docker" alt="Docker Pulls"></a>
  <a href="https://github.com/users/crazy-max/packages/container/package/7zip"><img src="https://img.shields.io/badge/github-registry-blue?style=flat-square&logo=github" alt="GitHub Registry"></a>
  <br /><a href="https://github.com/sponsors/crazy-max"><img src="https://img.shields.io/badge/sponsor-crazy--max-181717.svg?logo=github&style=flat-square" alt="Become a sponsor"></a>
  <a href="https://www.paypal.me/crazyws"><img src="https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square" alt="Donate Paypal"></a>
</p>

## About

[7-Zip](https://www.7-zip.org/) Docker image based on Alpine Linux.<br />
This image is built **every day**.<br />
If you are interested, [check out](https://hub.docker.com/r/crazymax/) my other Docker images!

💡 Want to be notified of new releases? Check out 🔔 [Diun (Docker Image Update Notifier)](https://github.com/crazy-max/diun) project!

___

* [Docker image](#docker-image)
* [Usage](#usage)
* [How can I help?](#how-can-i-help)
* [License](#license)

## Docker image

Docker image is available on [Docker Hub](https://hub.docker.com/r/crazymax/7zip/) and [GitHub Container Registry](https://github.com/users/crazy-max/packages/container/package/7zip)
for the following platforms:

```
$ docker run --rm mplatform/mquery crazymax/7zip:latest
Image: crazymax/7zip:latest
 * Manifest List: Yes
 * Supported platforms:
   - linux/amd64
   - linux/arm/v6
   - linux/arm/v7
   - linux/arm64
   - linux/386
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

## How can I help?

All kinds of contributions are welcome :raised_hands:! The most basic way to show your support is to star :star2: the project, or to raise issues :speech_balloon: You can also support this project by [**becoming a sponsor on GitHub**](https://github.com/sponsors/crazy-max) :clap: or by making a [Paypal donation](https://www.paypal.me/crazyws) to ensure this journey continues indefinitely! :rocket:

Thanks again for your support, it is much appreciated! :pray:

## License

MIT. See `LICENSE` for more details.<br />
Icon credit to [finfin](https://utopian.io/utopian-io/@finfin/new-logo-icon-proposal-for-7-zip).
