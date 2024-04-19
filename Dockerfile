FROM stereolabs/zed:4.1-devel-jetson-jp5.1.2

WORKDIR /app

COPY custom_detector/cpp/tensorrt_yolov5-v6-v8_onnx tensor_rt
COPY best.onnx /app
COPY best.pt /app


# zed_sdk_container