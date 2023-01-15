FROM rust:latest AS build

ENV CROSS_CONTAINER_IN_CONTAINER=true
VOLUME "/var/run/docker.sock"
COPY ./ ./
RUN cargo install cross
RUN cross build --release --target aarch64-unknown-linux-gnu


FROM rust:slim-buster

COPY --from=build ./target/release/dockery_thing ./
CMD ["./dockery_thing"]

# # when run from repository's root directory with
# #
# #$ docker build -t dockery_thing_aarch64 -f docker/aarch64_raspbian/Dockerfile .
# #
# # the build fails with the following error:
#
#  => ERROR [build 4/4] RUN cross build --release --target aarch64-unknown-linux-gnu                                 6.4s
# ------
#  > [build 4/4] RUN cross build --release --target aarch64-unknown-linux-gnu:
# #11 0.934 info: downloading component 'rust-std' for 'aarch64-unknown-linux-gnu'
# #11 2.851 info: installing component 'rust-std' for 'aarch64-unknown-linux-gnu'
# #11 6.389 Error:
# #11 6.389    0: no container engine found
# #11 6.389
# #11 6.389 Suggestion: is docker or podman installed?
# ------
# executor failed running [/bin/sh -c cross build --release --target aarch64-unknown-linux-gnu]: exit code: 1
