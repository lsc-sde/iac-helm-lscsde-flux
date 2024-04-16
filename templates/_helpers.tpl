{{- define "flux.applier.binding.name" -}}
{{- printf "flux-applier-binding:%s" .namespace }}
{{- end }}

{{- define "config.name" -}}
{{- printf "%s-config" .Release.Name }}
{{- end }}
