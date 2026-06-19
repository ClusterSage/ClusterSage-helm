{{- define "clustersage.image" -}}
{{- $image := .image -}}
{{- $repository := required "image.repository is required" $image.repository -}}
{{- $digest := default "" $image.digest -}}
{{- $tag := default "" $image.tag -}}
{{- if $digest -}}
{{- printf "%s@%s" $repository $digest -}}
{{- else if $tag -}}
{{- printf "%s:%s" $repository $tag -}}
{{- else -}}
{{- fail "either image.digest or image.tag must be set" -}}
{{- end -}}
{{- end -}}
