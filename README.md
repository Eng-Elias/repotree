# RepoTree

A command-line tool for displaying files tree with Git integration. This tool helps you visualize your project's file structure with support for Git-tracked files and .gitignore rules.

## Features

- Display files tree structure
- Git integration (show only tracked files)
- Respect .gitignore rules
- Show/hide hidden files
- Custom ignore patterns
- Configurable depth limit

## Installation

```bash
pip install repotree
```

## Usage

```bash
repotree [OPTIONS] [DIRECTORY]
```

### Options

- `-d, --depth DEPTH`: Maximum depth of the tree (default: 0 for unlimited)
- `-a, --all`: Show hidden files
- `-g, --git-only`: Show only Git tracked files
- `--respect-gitignore`: Respect .gitignore rules (default: True)
- `--no-respect-gitignore`: Don't respect .gitignore rules
- `-i, --ignore PATTERN`: Ignore files/directories matching pattern

### Examples

Display tree for current directory:

```bash
repotree
```

Show tree with hidden files:

```bash
repotree -a
```

Show only Git tracked files:

```bash
repotree -g
```

Limit tree depth to 2 levels:

```bash
repotree -d 2
```

Ignore specific patterns:

```bash
repotree -i node_modules -i "*.pyc"
```

## Development

1. Clone the repository:

```bash
git clone https://github.com/Eng-Elias/repotree.git
cd repotree
```

2. Create a virtual environment:

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install development dependencies:

```bash
make install-dev
```

4. Build the package:

```bash
make build
```

5. Clean build artifacts:

```bash
make clean  # Automatically detects your OS
```

6. Publish to PyPI:

```bash
make publish
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
