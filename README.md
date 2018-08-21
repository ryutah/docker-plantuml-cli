# docker-plantuml-cli
PlantUML CLI environment.

Usefule for CI environment or share build environment to others.

It contains [Graphviz](https://www.graphviz.org/) and jar file of [PlantUML](http://plantuml.com/) and
pre installed [IPAexGothic](https://ipafont.ipa.go.jp/) for japanese.

## Usage
```console
$ docker run -v [PLANT_UML_TEXT_FILE_DIR]:/home \
    ryutah/plantuml-cli \
    [PLANT_UML_TEXT_FILE]
```

## Example
```console
$ docker run -v /usr/home/:/home \
    ryutah/plantuml-cli \
    diagram.txt
# diagram.png is out in /usr/home.
```
