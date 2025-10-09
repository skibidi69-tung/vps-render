# Base image nhẹ từ Alpine với GUI/VNC/noVNC tích hợp sẵn
FROM jlesage/baseimage-gui:alpine-3.19-v4

# Cài đặt XFCE (GUI nhẹ, mượt) và công cụ cơ bản, thêm Firefox ESR
RUN add-pkg \
        dbus \
        dbus-x11 \
        xfce4 \
        xfce4-terminal \
        xfce4-taskmanager \
        xfce4-screenshooter \
        thunar \
        mousepad \
        firefox-esr \
        && \
    # Xóa cache để image nhẹ (~500MB)
    rm -rf /tmp/* /var/cache/apk/*

# Copy script khởi động GUI
COPY startapp.sh /startapp.sh

# Làm script executable
RUN chmod +x /startapp.sh

# Đặt tên app cho noVNC interface
RUN set-cont-env APP_NAME "Lightweight XFCE GUI with Firefox"
