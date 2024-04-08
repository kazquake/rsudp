# macOS Setup Guide for rsudp

## Step 1: Install Miniconda

### Using Homebrew:

If you haven't installed Homebrew yet, you can do so by running:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After installing Homebrew, use the following command to install Miniconda:

```bash
brew install --cask miniconda
```

## Step 2: Create Conda Environment and Install Dependencies

### Create a new conda environment from an environment.yml file:

```bash
conda env create -f environment.yml
```

### Initialize conda for zsh:

```bash
conda init zsh
```

### Reload your terminal:

Close and reopen your terminal or run:

```bash
source ~/.zshrc
```

### Activate the conda environment:

```bash
conda activate rsudp
```

## Step 3: Run the rsudp Client

### Navigate to the rsudp project directory:

```bash
cd path/to/rsudp
```

### Run the rsudp client:

```bash
python rsudp/client.py
```
