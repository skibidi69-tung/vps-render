# Sử dụng baseimage nhẹ từ Alpine với hỗ trợ GUI/VNC/noVNC tích hợp
FROM jlesage/baseimage-gui:alpine-3.19-v4

# Cài đặt XFCE (GUI nhẹ, mượt, tiêu tốn ít RAM/CPU) và các công cụ cơ bản
RUN add-pkg \
        dbus \
        dbus-x11 \
        xfce4 \
        xfce4-terminal \
        xfce4-taskmanager \
        xfce4-screenshooter \
        thunar \
        mousepad \
        firefox \
        && \
    # Xóa cache để giữ image nhẹ
    rm -rf /tmp/* /var/cache/apk/*

# Copy script khởi động
COPY startapp.sh /startapp.sh

# Làm script có thể chạy
RUN chmod +x /startapp.sh

# Đặt tên app
RUN set-cont-env APP_NAME "Lightweight XFCE GUI"
