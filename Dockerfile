# Use the latest Alpine Linux image as the base
FROM alpine:latest

# Define the arguments for UID and GID
ARG AQEDEV_UID=1000
ARG AQEDEV_GID=1000

# Use GID and UID as environment variables
ENV AQEDEV_UID=${AQEDEV_UID}
ENV AQEDEV_GID=${AQEDEV_GID}

# Create a group and user with the specified UID/GID
RUN addgroup -g ${AQEDEV_GID} aqedev && \
    adduser -u ${AQEDEV_UID} -G aqedev -s /bin/sh -D aqedev


# Install necessary packages
RUN apk add --no-cache sudo
#Setup bash script shell
RUN apk add --no-cache bash
RUN apk add --no-cache shadow


# Install necessary packages
RUN apk add --no-cache sudo \
    && apk add --no-cache nodejs npm git

# Install pnpm globally
RUN npm install -g pnpm


# Install pnpm
RUN npm install -g pnpm
#RUN pnpm install
RUN pnpm install express dotenv

# Set the working directory
WORKDIR /workspace/site

# Set the user
USER aqedev



# Add command to start a new terminal
RUN echo "code ." >> /home/aqedev/.profile
# CMD to start the application
CMD ["node", "app.js"]

# CMD to keep the container running
#CMD ["tail", "-f", "/dev/null"]