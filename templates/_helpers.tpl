{{- define "flux.applier.binding.name" -}}
{{- printf "flux-applier-binding:%s" .namespace }}
{{- end }}

{{- define "config.name" -}}
{{- printf "%s-config%s" .Release.Name .Values.naming.suffix }}
{{- end }}
