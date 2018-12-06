{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "postgresql.fullname" -}}
{{- printf "%s-%s" .Release.Name "postgresql" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "redis.fullname" -}}
{{- printf "%s-%s" .Release.Name "redis" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "smtp.fullname" -}}
{{- printf "%s-%s" .Release.Name "smtp" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Set postgres host
*/}}
{{- define "postgresql.host" -}}
{{- if .Values.postgresql.enabled -}}
{{- template "postgresql.fullname" . -}}
{{- else -}}
{{- .Values.postgresql.host | quote -}}
{{- end -}}
{{- end -}}
 {{/*
Set postgres secret
*/}}
{{- define "postgresql.secret" -}}
{{- if .Values.postgresql.enabled -}}
{{- template "postgresql.fullname" . -}}
{{- else -}}
{{- template "fullname" . -}}
{{- end -}}
{{- end -}}
 {{/*
Set postgres port
*/}}
{{- define "postgresql.port" -}}
{{- if .Values.postgresql.enabled -}}
    "5432"
{{- else -}}
{{- default "5432" .Values.postgresql.port | quote -}}
{{- end -}}
{{- end -}}

{{/*
Set redis host
*/}}
{{- define "redis.host" -}}
{{- if .Values.redis.enabled -}}
{{- template "redis.fullname" . -}}
{{- else -}}
{{- .Values.redis.host | quote -}}
{{- end -}}
{{- end -}}
 {{/*
Set postgres secret
*/}}
{{- define "redis.secret" -}}
{{- if .Values.redis.enabled -}}
{{- template "redis.fullname" . -}}
{{- else -}}
{{- template "fullname" . -}}
{{- end -}}
{{- end -}}
 {{/*
Set postgres port
*/}}
{{- define "redis.port" -}}
{{- if .Values.redis.enabled -}}
    "5432"
{{- else -}}
{{- default "5432" .Values.redis.port | quote -}}
{{- end -}}
{{- end -}}
