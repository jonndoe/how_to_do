# Installation instructions:
https://docs.anaconda.com/miniconda/install/#quick-command-line-install

# Download the package:
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# verify the hash:
sha256sum Miniconda3-latest-Linux-x86_64.sh

#The list of packages and hashes:
https://repo.anaconda.com/miniconda/

# When creating new conda env the following packages work with MiniCPM nn:

Pillow==10.1.0
torch==2.3.1
torchaudio==2.3.1
torchvision==0.18.1
transformers==4.44.2
librosa==0.9.0
soundfile==0.12.1
vector-quantize-pytorch==1.18.5
vocos==0.1.0
decord
moviepy==1.0.3
