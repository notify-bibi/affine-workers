# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7

ARG NODE_VERSION=22

################################################################################
# Use node image for base image for all stages.
FROM node:${NODE_VERSION} AS base

# Install pnpm.
RUN npm install -g pnpm@latest
################################################################################
COPY . /app
WORKDIR /app

RUN pnpm install

# Run the application.
CMD ["pnpm", "run", "dev", "--ip", "0.0.0.0"]
