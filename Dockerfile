FROM runpod/worker-comfyui:5.8.5-sdxl

# Install IP-Adapter custom node
RUN cd /comfyui/custom_nodes && \
    git clone --depth 1 https://github.com/cubiq/ComfyUI_IPAdapter_plus.git && \
    cd ComfyUI_IPAdapter_plus && \
    if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

# Download IP-Adapter model
RUN mkdir -p /comfyui/models/ipadapter && \
    wget -q -O /comfyui/models/ipadapter/ip-adapter-plus_sdxl_vit-h.safetensors \
    "https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors"

# Download CLIP Vision model
RUN mkdir -p /comfyui/models/clip_vision && \
    wget -q -O /comfyui/models/clip_vision/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors \
    "https://huggingface.co/h94/IP-Adapter/resolve/main/models/image_encoder/model.safetensors"
