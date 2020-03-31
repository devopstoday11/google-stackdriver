if [[ -z "${BPL_GOOGLE_STACKDRIVER_MODULE+x}" ]]; then
    MODULE="default-module"
else
	MODULE=${BPL_GOOGLE_STACKDRIVER_MODULE}
fi

if [[ -z "${BPL_GOOGLE_STACKDRIVER_VERSION+x}" ]]; then
	VERSION=""
else
	VERSION=${BPL_GOOGLE_STACKDRIVER_VERSION}
fi

printf "Google Stackdriver Profiler enabled for %s" "${MODULE}"
AGENT="-agentpath:{{.agentpath}}=-logtostderr=1,-cprof_service=${MODULE}"

if [[ "${VERSION}" != "" ]]; then
	printf ":%s" "${VERSION}"
	AGENT="${AGENT},-cprof_service_version=${VERSION}"
fi

printf "\n"
export JAVA_OPTS="${JAVA_OPTS} ${AGENT}"