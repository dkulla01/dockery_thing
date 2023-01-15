FROM rust:latest AS build

COPY ./ ./
RUN cargo build --release


FROM rust:slim-buster

COPY --from=build ./target/release/dockery_thing ./
CMD ["./dockery_thing"]

# # from the repository's root directory, run this with
# # $ docker build -t dockery_thing_x86 -f docker/x86_macos/Dockerfile .
# # the build completes without errors, and can be run with
# # docker run --rm dockery_thing_x86
