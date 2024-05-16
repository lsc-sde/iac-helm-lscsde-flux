{{- define "flux.applier.binding.name" -}}
{{- printf "flux-applier-binding:%s" .namespace }}
{{- end }}

{{- define "config.name" -}}
{{- printf "%s-config%s" .Release.Name .Values.naming.suffix }}
{{- end }}

{{- define "flux.path" -}}
{{- if hasKey . "path" -}}
{{- printf "./%s" .path }}
{{- else -}}
{{- printf "./" }}
{{- end -}}
{{- end }}
