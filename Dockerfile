FROM tensorflow/tensorflow:2.15.0-gpu

# Install basic tools and dependencies for matplotlib
RUN apt-get update && apt-get install -y \
    nano htop wget \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Upgrade pip and install required Python packages
RUN python -m pip install --upgrade pip && \
    python -m pip install --no-cache-dir \
        numpy \
        matplotlib \
        pandas \
        scikit-learn \
        ipykernel 
