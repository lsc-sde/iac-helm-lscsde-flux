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

{{- define "flux.secrets" -}}
{{- $secrets := list -}}
{{- range .Values.components -}}
{{- if hasKey . "repository" -}}
{{- if hasKey .repository "name" -}}
{{- if eq .state "enabled" -}}
{{- if hasKey .repository "secret" -}}

{{- if hasKey .repository.secret "usernameKey" -}}
{{- if ne .repository.secret.usernameKey "" -}}
{{- $secrets = .repository.secret.usernameKey | append $secrets -}}
{{- end -}}
{{- end -}}

{{- if hasKey .repository.secret "passwordKey" -}}
{{- if ne .repository.secret.passwordKey "" -}}
{{- $secrets = .repository.secret.passwordKey | append $secrets -}}
{{- end -}}
{{- end -}}

{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{ $secrets | uniq | toJson }}
{{- end -}}