Add to twiddlebug:

    deploy:
      resources:
        limits:
          cpus: '3.0'
          memory: 2048M
        # reservations:
        #   cpus: '0.25'
        #   memory: 256M


WARNING: The following deploy sub-keys are not supported and have been ignored: resources.reservations.cpus