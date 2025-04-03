.PHONY: clean clean_linux clean_windows install install-dev build publish

# Install package
install:
	pip install .

# Install package in development mode
install-dev:
	pip install -e .
	pip install -r requirements.txt

# Build the package
build: clean
	python -m pip install --upgrade build
	python -m build

# Publish to PyPI
publish: build
	python -m pip install --upgrade twine
	python -m twine upload dist/*

# Clean build artifacts on Linux/macOS
clean_linux:
	@echo "Cleaning build artifacts on Linux/macOS..."
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	find repotree -type d -name __pycache__ -exec rm -rf {} +
	find repotree -type f -name "*.pyc" -delete
	find repotree -type f -name "*.pyo" -delete
	find repotree -type f -name "*.pyd" -delete

# Clean build artifacts on Windows
clean_windows:
	@echo "Cleaning build artifacts on Windows..."
	@if exist build rmdir /s /q build
	@if exist dist rmdir /s /q dist
	@for /d %%i in (*egg-info) do @if exist "%%i" rmdir /s /q "%%i"
	@echo "Removing __pycache__ directories in repotree..."
	@for /d /r repotree %%d in (__pycache__) do @if exist "%%d" rmdir /s /q "%%d"
	@echo "Removing compiled Python files in repotree..."
	@del /s /q repotree\*.pyc 2>nul || echo No .pyc files found
	@del /s /q repotree\*.pyo 2>nul || echo No .pyo files found
	@del /s /q repotree\*.pyd 2>nul || echo No .pyd files found
	@echo "Clean completed successfully!"

# Main clean command that detects OS
ifeq ($(OS),Windows_NT)
clean:
	@echo "Detected Windows environment"
	@$(MAKE) clean_windows
else
clean:
	@echo "Detected Unix-like environment"
	@$(MAKE) clean_linux
endif
