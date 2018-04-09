for i in "$@" ; do
  if [[ $i == "--json" ]]; then
    json=true
    break
  fi
done

if [[ $json ]]; then
  output="$(trufflehog --regex --rules /trufflehog/regex.rules.json file:///git "$@" | jq -C .)"
else
  output="$(trufflehog --regex --rules /trufflehog/regex.rules.json file:///git "$@")"
fi

if [ "${output}" != "" ]; then
  echo "${output}"
  exit 1
else
  exit 0
fi
