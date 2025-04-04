{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}

{{- define "rendering.name" -}}
{{- default $.Chart.Name $.Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "rendering.fullname" -}}
{{- default $.Chart.Name $.Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the container image full name.
*/}}
{{- define "rendering.image" -}}
{{- required "Container image not specified." .Values.image -}}
{{- end -}}


{{/*
Geo Location.
*/}}
{{- define "rendering.location" -}}
{{- required "location not specified." .Values.location -}}
{{- end }}

{{/*
Generate Stack Version.
*/}}
{{- define "rendering.stackName" -}}
{{- printf "%s-%s" .Chart.Name .Values.stackVersion }}
{{- end }}

{{/*
Generate Stack Version.
*/}}
{{- define "rendering.stackNameJobsapi" -}}
{{- printf "jobsapi-%s-%s" .Chart.Name .Values.stackVersion }}
{{- end }}

{{/*
Content Manager.
*/}}
{{- define "rendering.cm" -}}
{{- printf "%s-cm" .Chart.Name}}
{{- end }}


{{/*
Image Version tag.
*/}}
{{- define "rendering.image_version_tag" -}}
{{(splitList ":" .Values.image) | last}}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rendering.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Define Container Annotations */}}
{{- define "rendering.annotations" -}}
Business_Service: {{ .Values.annotations.business_service }}
BusinessServiceName: {{ .Values.annotations.business_service_name }}
BusinessServiceID: {{ .Values.annotations.business_service_id }}
Country: {{ .Values.annotations.country }}
ApplicationName: {{ .Values.annotations.application_name }}
Environment: {{ .Values.annotations.environment }}
{{- end -}}

{{/* Define selector labels */}}
{{- define "rendering.selector.labels" -}}
name: {{ template "rendering.name" . }}
release: {{ .Release.Name }}
{{- end -}}


