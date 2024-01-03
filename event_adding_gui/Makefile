.PHONY: test ci-test lint generate help run locale coverage

.DEFAULT_GOAL := help

help: ## show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

lint: ## lint and autoformat this project
	flutter analyze
	flutter format --set-exit-if-changed .

run: ## run the app with hot reload
	flutter run --target lib/main.dart --pid-file=${FLUTTER_PID_FILE} -d macos

generate: ## generate the models
	flutter pub run build_runner build --delete-conflicting-outputs
	dart format .

locale: ## generate locale files
	flutter gen-l10n

coverage: ## generate coverage report
	flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html
	open coverage/html/index.html
