## version: 1.27
## method: post
## path: /services/{id}/update
## code: 200
## response: {"Warning":"unable to pin image doesnotexist:latest to digest: image library/doesnotexist:latest not found"}
NULL

## TODO: this is *clearly* incorect in the spec, but this persists
## right through to 1.33
list(warnings = character(0))
