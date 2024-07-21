#!/bin/bash

# Function to print the commit message and execute the commit
gitCommitTeams() {
    local ticketNo="$1"
    local type="$2"
    local message="$3"

    if [[ -z "$ticketNo" ]]; then
        echo "⚠️  경고: 티켓 넘버가 필요합니다. 인자를 제공해주세요."
        return 1
    fi

    if [[ -z "$type" ]]; then
        echo "⚠️  경고: 커밋 타입이 필요합니다. 인자를 제공해주세요."
        return 1
    fi

    if [[ -z "$message" ]]; then
        echo "⚠️  경고: 커밋 메시지가 필요합니다. 인자를 제공해주세요."
        return 1
    fi

    git add . && git commit -m "[$ticketNo] $type: $message"
}

# Prompt for user input
read -p "티켓 넘버는? " ticketNo

echo "원하는 커밋 타입을 선택해주세요:"
select typeChoice in "⭐ feat" "⚙️  chore" "🐞 fix" "📖 docs" "💅 style" "♻️  refactor" "🚦 test" "🔴 red-test" "🔵 blue-test" "🟢 green-test" "📖 dev Specification" "🚀 CI/CD" "🔖 release" "🎉 init" "🛠️  config" "🦔 revert" "💥 conflict"
do
    case $typeChoice in
        "⭐ feat"|"⚙️  chore"|"🐞 fix"|"📖 docs"|"💅 style"|"♻️  refactor"|"🚦 test"|"🔴 red-test"|"🔵 blue-test"|"🟢 green-test"|"📖 dev Specification"|"🚀 CI/CD"|"🔖 release"|"🎉 init"|"🛠️  config"|"🦔 revert"|"💥 conflict")
            type=$typeChoice
            break
            ;;
        *)
            echo "⚠️  경고: 유효하지 않은 선택입니다."
            ;;
    esac
done

read -p "남기고 싶은 메시지는? " message

# Call the gitCommitTeams function with the user inputs
gitCommitTeams "$ticketNo" "$type" "$message"

