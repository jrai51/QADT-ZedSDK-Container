FROM stereolabs/zed:4.1-devel-jetson-jp5.1.2

WORKDIR /app

COPY custom_detector/cpp/tensorrt_yolov5-v6-v8_onnx tensor_rt
COPY best.pt /app
# COPY best.onnx /app

# Change directory to tensor_rt and execute subsequent commands
RUN cd tensor_rt \
    && mkdir build \
    && cd build 
    #&& cmake ..



RUN apt-get update \
    && apt-get install -y \
        cmake \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && sudo apt-get install -y libglew-dev

#RUN sudo apt-get install libglew-dev


# zed_sdk_container