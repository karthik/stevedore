## version: 1.25
## method: get
## path: /images/{name}/history
## code: 200
## response: [{"Id":"3db9c44f45209632d6050b35958829c3a2aa256d81b9a7be45b362ff85c54710","Created":1398108230,"CreatedBy":"/bin/sh -c #(nop) ADD file:eb15dbd63394e063b805a3c32ca7bf0266ef64676d5a6fab4801f2e81e2a5148 in /","Tags":["ubuntu:lucid","ubuntu:10.04"],"Size":182964289,"Comment":""},{"Id":"6cfa4d1f33fb861d4d114f43b25abd0ac737509268065cdfd69d544a59c85ab8","Created":1398108222,"CreatedBy":"/bin/sh -c #(nop) MAINTAINER Tianon Gravi <admwiggin@gmail.com> - mkimage-debootstrap.sh -i iproute,iputils-ping,ubuntu-minimal -t lucid.tar.xz lucid http://archive.ubuntu.com/ubuntu/","Tags":[],"Size":0,"Comment":""},{"Id":"511136ea3c5a64f264b78b5433614aec563103b4d4702f3ba7d4d2698e22c158","Created":1371157430,"CreatedBy":"","Tags":["scratch12:latest","scratch:latest"],"Size":0,"Comment":"Imported from -"}]
data.frame(
  id = c("3db9c44f45209632d6050b35958829c3a2aa256d81b9a7be45b362ff85c54710",
         "6cfa4d1f33fb861d4d114f43b25abd0ac737509268065cdfd69d544a59c85ab8",
         "511136ea3c5a64f264b78b5433614aec563103b4d4702f3ba7d4d2698e22c158"),
  created = c(1398108230L, 1398108222L, 1371157430L),
  created_by =
    c("/bin/sh -c #(nop) ADD file:eb15dbd63394e063b805a3c32ca7bf0266ef64676d5a6fab4801f2e81e2a5148 in /",
      "/bin/sh -c #(nop) MAINTAINER Tianon Gravi <admwiggin@gmail.com> - mkimage-debootstrap.sh -i iproute,iputils-ping,ubuntu-minimal -t lucid.tar.xz lucid http://archive.ubuntu.com/ubuntu/",
      ""),
  tags = I(list(c("ubuntu:lucid", "ubuntu:10.04"),
                character(),
                c("scratch12:latest", "scratch:latest"))),
  size = c(182964289L, 0L, 0L),
  comment = c("", "", "Imported from -"),
  stringsAsFactors = FALSE)
