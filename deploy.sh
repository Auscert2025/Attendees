#!/bin/bash

function invoke_envsubst() {
    local input_file=""
    local output_file=""
    local variables=()
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            -i|--input)
                input_file="$2"
                shift 2
                ;;
            -o|--output)
                output_file="$2"
                shift 2
                ;;
            -v|--var)
                variables+=("$2")
                shift 2
                ;;
            *)
                echo "Unknown parameter: $1"
                return 1
                ;;
        esac
    done
    
    if [[ -z "$input_file" ]]; then
        echo "Error: Input file is required"
        return 1
    fi
    
    if [[ -z "$output_file" ]]; then
        output_file="$input_file"
    fi
    
    local content
    content=$(cat "$input_file")
    
    for var_assignment in "${variables[@]}"; do
        local key="${var_assignment%%=*}"
        local value="${var_assignment#*=}"
        
        content=$(echo "$content" | sed "s|\${$key}|$value|g")
    done
    
    echo "$content" > "$output_file"
}

invoke_envsubst --input "./k8s/deployment.yaml" --output "./k8s/deployment-updated.yaml" --var "NAMESPACE=<namespacenamehere>"

kubectl apply -f ./k8s/deployment-updated.yaml