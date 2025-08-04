#PROMPT="Count to 10"
#RESPONSE=$(curl http://localhost:11434/api/generate -d '{
#  "model": "everythinglm",
#  "format": "json",
#  "prompt": "Count to 10"
#}')

curl http://localhost:11434/api/generate -d '{
  "model": "codegemma",
  "format": "json",
  "prompt": "say hello"
}'

#ECHO "The prompt is: , $PROMPT"
#ECHO ""
#ECHO "The response is:, $RESPONSE"