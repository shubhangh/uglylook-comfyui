FROM runpod/worker-comfyui:5.8.5-sdxl

RUN cd /comfyui/custom_nodes && \
    git clone --depth 1 https://github.com/cubiq/ComfyUI_IPAdapter_plus.git && \
    cd ComfyUI_IPAdapter_plus && \
    if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi
