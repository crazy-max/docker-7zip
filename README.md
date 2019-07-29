<p align="center"><a href="https://github.com/crazy-max/docker-7zip" target="_blank"><img height="128"src="https://raw.githubusercontent.com/crazy-max/docker-7zip/master/.res/docker-7zip.jpg"></a></p>

<p align="center">
  <a href="https://travis-ci.com/crazy-max/docker-7zip"><img src="https://img.shields.io/travis/com/crazy-max/docker-7zip/master.svg?style=flat-square" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/crazymax/7zip/"><img src="https://img.shields.io/docker/stars/crazymax/7zip.svg?style=flat-square" alt="Docker Stars"></a>
  <a href="https://hub.docker.com/r/crazymax/7zip/"><img src="https://img.shields.io/docker/pulls/crazymax/7zip.svg?style=flat-square" alt="Docker Pulls"></a>
  <a href="https://quay.io/repository/crazymax/7zip"><img src="https://quay.io/repository/crazymax/7zip/status?style=flat-square" alt="Docker Repository on Quay"></a>
  <a href="https://www.codacy.com/app/crazy-max/docker-7zip"><img src="https://img.shields.io/codacy/grade/221b1a2041514770af75a16d880148f9.svg?style=flat-square" alt="Code Quality"></a>
  <br /><a href="https://www.patreon.com/crazymax"><img src="https://img.shields.io/badge/donate-patreon-fb664e.svg?style=flat-square" alt="Support me on Patreon"></a>
  <a href="https://www.paypal.me/crazyws"><img src="https://img.shields.io/badge/donate-paypal-7057ff.svg?style=flat-square" alt="Donate Paypal"></a>
</p>

## About

🐳 [7-Zip](https://www.7-zip.org/) Docker image based on Alpine Linux.<br />
This image is built **every week**.<br />
If you are interested, [check out](https://hub.docker.com/r/crazymax/) my other 🐳 Docker images!

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

## How can I help ?

All kinds of contributions are welcome :raised_hands:!<br />
The most basic way to show your support is to star :star2: the project, or to raise issues :speech_balloon:<br />
But we're not gonna lie to each other, I'd rather you buy me a beer or two :beers:!

[![Support me on Patreon](.res/patreon.png)](https://www.patreon.com/crazymax) 
[![Paypal Donate](.res/paypal.png)](https://www.paypal.me/crazyws)

## License

MIT. See `LICENSE` for more details.<br />
Icon credit to [finfin](https://utopian.io/utopian-io/@finfin/new-logo-icon-proposal-for-7-zip).
