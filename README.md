# Gammu SMSD

This container runs the [Gammu SMSD](https://wammu.eu/smsd/).

## Usage

## Config USB 
```
ls -l /dev/serial/by-id/
```
```
lrwxrwxrwx 1 root root 13 dez 30 18:41 usb-HUAWEI_HUAWEI_Mobile-if00-port0 -> ../../ttyUSB0
lrwxrwxrwx 1 root root 13 dez 30 18:41 usb-HUAWEI_HUAWEI_Mobile-if02-port0 -> ../../ttyUSB1
lrwxrwxrwx 1 root root 13 dez 30 18:41 usb-HUAWEI_HUAWEI_Mobile-if03-port0 -> ../../ttyUSB2
```
```
 ls -l /dev/ttyUSB*
```
```
crw-rw---- 1 root dialout 188, 0 dez 30 18:41 /dev/ttyUSB0
crw-rw---- 1 root dialout 188, 1 dez 30 18:41 /dev/ttyUSB1
crw-rw---- 1 root dialout 188, 2 dez 30 18:41 /dev/ttyUSB2
```

- Create link host USB inside container

```
 */1 *   * * *   root    mkdir -p  /dev/docker/gammu 2>/dev/null; for i in $(find /dev/serial/by-id/ -maxdepth 1 -mindepth 1 -type l -name "usb-ZTE-if*"); do /bin/cp -afu $(readlink -f $i) /dev/docker/gammu/$(basename $i) 2>/dev/null; done
```

## Iniciar container
new
```
    docker-compose up -d
```
    
old
```
docker run --restart always --device /dev/ttyUSB0:/dev/modem gammusmsd
```

## Referencias
https://hub.docker.com/r/distahl/gammu-smsd
