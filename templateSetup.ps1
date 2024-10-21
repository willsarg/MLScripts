'''
Copyright 2024 WillSarg

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
'''
#Created By WillSarg
#MIT License Applies
$projectName = "MyProject"

# Create the directory structure
New-Item -ItemType Directory -Path .vscode, $projectName

# Create a requirements.txt file and pre-populate it with common libraries
$requirementsFilePath = "requirements.txt"
$defaultLibraries = @"
flask
requests
numpy
pandas
pytest
torch
torchvision
matplotlib
scipy
scikit-learn
Pillow
tqdm
opencv-python
albumentations
seaborn
pyyaml
huggingface-hub
transformers
accelerate
"@

# Write the default libraries to requirements.txt
$defaultLibraries | Out-File -FilePath $requirementsFilePath -Encoding utf8



# Create a virtual environment
$venvString = "." + $projectName + "_venv"
python -m venv $venvString

$venvPath = "$venvString\\Scripts\\python.exe"
$settingsFilePath = ".\.vscode\settings.json"

# Define the content for the settings.json file with the virtual environment path
$vscodeSettingsJSON = @"
{
    "python.defaultInterpreterPath": "$venvPath"
}
"@

# Write the JSON content to the settings.json file
$vscodeSettingsJSON | Out-File -FilePath $settingsFilePath -Encoding utf8

# Install dependencies
& .\$venvString\Scripts\pip install --upgrade pip
& .\$venvString\Scripts\pip install -r requirements.txt