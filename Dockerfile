FROM rust:latest

COPY ./ ./

RUN dpkg --add-architecture arm64 && apt update && apt install -y libssl-dev:arm64

ENV CROSS_CONTAINER_IN_CONTAINER=true
RUN cargo install cross
RUN cross build --target aarch64-unknown-linux-gnu --release
CMD ["sleep 1200"]
