# Get environment variables from Nushell.
output=$(/opt/homebrew/bin/nu --config ~/.config/nushell/config.nu --env-config ~/.config/nushell/env.nu -c "env")

# Iterate over each line of the output
while IFS= read -r line; do
    # Split the line into key and value using '=' as the delimiter
    key=${line%%=*}
    value=${line#*=}

    # Export the environment variable
    export "$key=$value"
done <<< "$output"
