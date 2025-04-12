{{- define "simple-server.name" -}}
simple-server
{{- end }}

{{- define "simple-server.fullname" -}}
{{ include "simple-server.name" . }}
{{- end }}