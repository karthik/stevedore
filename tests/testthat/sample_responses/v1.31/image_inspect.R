## version: 1.31
## method: get
## path: /images/{name}/json
## code: 200
## response: {"Id":"sha256:85f05633ddc1c50679be2b16a0479ab6f7637f8884e0cfe0f4d20e1ebb3d6e7c","Container":"cb91e48a60d01f1e27028b4fc6819f4f290b3cf12496c8176ec714d0d390984a","Comment":"","Os":"linux","Architecture":"amd64","Parent":"sha256:91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c","ContainerConfig":{"Tty":false,"Hostname":"e611e15f9c9d","Domainname":"","AttachStdout":false,"PublishService":"","AttachStdin":false,"OpenStdin":false,"StdinOnce":false,"NetworkDisabled":false,"OnBuild":[],"Image":"91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c","User":"","WorkingDir":"","MacAddress":"","AttachStderr":false,"Labels":{"com.example.license":"GPL","com.example.version":"1.0","com.example.vendor":"Acme"},"Env":"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin","Cmd":["/bin/sh","-c","#(nop) LABEL com.example.vendor=Acme com.example.license=GPL com.example.version=1.0"]},"DockerVersion":"1.9.0-dev","VirtualSize":188359297,"Size":0,"Author":"","Created":"2015-09-10T08:30:53.26995814Z","GraphDriver":{"Name":"aufs","Data":{}},"RepoDigests":"localhost:5000/test/busybox/example@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf","RepoTags":["example:1.0","example:latest","example:stable"],"Config":{"Image":"91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c","NetworkDisabled":false,"OnBuild":[],"StdinOnce":false,"PublishService":"","AttachStdin":false,"OpenStdin":false,"Domainname":"","AttachStdout":false,"Tty":false,"Hostname":"e611e15f9c9d","Cmd":"/bin/bash","Env":"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin","Labels":{"com.example.vendor":"Acme","com.example.version":"1.0","com.example.license":"GPL"},"MacAddress":"","AttachStderr":false,"WorkingDir":"","User":""},"RootFS":{"Type":"layers","Layers":["sha256:1834950e52ce4d5a88a1bbd131c537f4d0e56d10ff0dd69e66be3b7dfa9df7e6","sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef"]}}
config <- list(
  hostname = "e611e15f9c9d",
  domainname = "",
  user = "",
  attach_stdin = FALSE,
  attach_stdout = FALSE,
  attach_stderr = FALSE,
  exposed_ports = NULL,
  tty = FALSE,
  open_stdin = FALSE,
  stdin_once = FALSE,
  env = "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
  cmd = "/bin/bash",
  healthcheck = NULL,
  args_escaped = NA,
  image = "91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c",
  volumes = NULL,
  working_dir = "",
  entrypoint = character(0),
  network_disabled = FALSE,
  mac_address = "",
  on_build = character(0),
  labels = c(
    com.example.vendor = "Acme",
    com.example.version = "1.0",
    com.example.license = "GPL"),
  stop_signal = NA_character_,
  stop_timeout = NA_integer_,
  shell = character(0))

container_config <- list(
  hostname = "e611e15f9c9d",
  domainname = "",
  user = "",
  attach_stdin = FALSE,
  attach_stdout = FALSE,
  attach_stderr = FALSE,
  exposed_ports = NULL,
  tty = FALSE,
  open_stdin = FALSE,
  stdin_once = FALSE,
  env = "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
  cmd = c(
    "/bin/sh",
    "-c",
    "#(nop) LABEL com.example.vendor=Acme com.example.license=GPL com.example.version=1.0"),
  healthcheck = NULL,
  args_escaped = NA,
  image = "91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c",
  volumes = NULL,
  working_dir = "",
  entrypoint = character(0),
  network_disabled = FALSE,
  mac_address = "",
  on_build = character(0),
  labels = c(
    com.example.license = "GPL",
    com.example.version = "1.0",
    com.example.vendor = "Acme"),
  stop_signal = NA_character_,
  stop_timeout = NA_integer_,
  shell = character(0))

graph_driver <- list(name = "aufs", data = character())

list(
  id =
    "sha256:85f05633ddc1c50679be2b16a0479ab6f7637f8884e0cfe0f4d20e1ebb3d6e7c",
  repo_tags = c("example:1.0", "example:latest", "example:stable"),
  repo_digests =
    "localhost:5000/test/busybox/example@sha256:cbbf2f9a99b47fc460d422812b6a5adff7dfee951d8fa2e4a98caa0382cfbdbf",
  parent =
    "sha256:91e54dfb11794fad694460162bf0cb0a4fa710cfa3f60979c177d920813e267c",
  comment = "",
  created = "2015-09-10T08:30:53.26995814Z",
  container =
    "cb91e48a60d01f1e27028b4fc6819f4f290b3cf12496c8176ec714d0d390984a",
  container_config = container_config,
  docker_version = "1.9.0-dev",
  author = "",
  config = config,
  architecture = "amd64",
  os = "linux",
  os_version = NA_character_,
  size = 0L,
  virtual_size = 188359297L,
  graph_driver = graph_driver,
  root_fs = list(
    type = "layers",
    layers = c(
      "sha256:1834950e52ce4d5a88a1bbd131c537f4d0e56d10ff0dd69e66be3b7dfa9df7e6",
      "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef"),
    base_layer = NA_character_),
  ## TODO: I think that this *should* be coming through as
  ##
  ##   metadata = list(last_lag_time = NA_character_)
  metadata = NULL)
