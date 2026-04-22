FLUTTER := $(shell command -v fvm >/dev/null 2>&1 && echo "fvm flutter" || echo "flutter")
DART    := $(shell command -v fvm >/dev/null 2>&1 && echo "fvm dart"    || echo "dart")

.PHONY: help setup pub_get gen gen_watch lang format analyze test coverage \
        integration run_chrome run_ios run_android build_web build_apk clean

help:  ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

setup: pub_get gen lang  ## pub_get + codegen + l10n

pub_get:  ## flutter pub get
	$(FLUTTER) pub get

gen:  ## Run build_runner once
	$(DART) run build_runner build --delete-conflicting-outputs

gen_watch:  ## Run build_runner in watch mode
	$(DART) run build_runner watch --delete-conflicting-outputs

lang:  ## Regenerate AppLocalizations from .arb files
	$(FLUTTER) gen-l10n

format:  ## dart format lib test integration_test
	$(DART) format lib test integration_test

analyze:  ## flutter analyze
	$(FLUTTER) analyze

test:  ## Run unit + widget tests
	$(FLUTTER) test

coverage:  ## Test with coverage and open lcov report
	$(FLUTTER) test --coverage && \
	  genhtml coverage/lcov.info -o coverage/html && \
	  open coverage/html/index.html

integration:  ## Run integration_test (defaults to chrome)
	$(FLUTTER) test integration_test -d chrome

run_chrome:  ## flutter run -d chrome
	$(FLUTTER) run -d chrome

run_ios:  ## flutter run -d ios
	$(FLUTTER) run -d ios

run_android:  ## flutter run -d android
	$(FLUTTER) run -d android

build_web:  ## Release build for web
	$(FLUTTER) build web --release

build_apk:  ## Release APK
	$(FLUTTER) build apk --release

clean:  ## flutter clean + pub get
	$(FLUTTER) clean && $(FLUTTER) pub get
