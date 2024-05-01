# Dockerfile for CRG Container

# Base image
FROM openjdk:latest

# Metadata
LABEL author-derby-name="Breadpool"
LABEL author-legal-name="Timothy Hull"
LABEL version="1.0"

# Install updates
RUN microdnf upgrade -y --nodocs
RUN microdnf clean all

# Set build arguments
ARG CRG_MOUNT_DIR=/${CRG_MOUNT_DIR}

# Set working directory
WORKDIR ${CRG_MOUNT_DIR}

# Advertise HTTP port
EXPOSE 8000/tcp
