FROM python:3.13.0b2-slim as build
WORKDIR /wheels
RUN apk add --no-cache \
    ncurses-dev \
    build-base
COPY docker_reqs.txt /opt/instainfo/requirements.txt
RUN pip3 wheel -r /opt/instainfo/requirements.txt


FROM python:3.13.0b2-slim
WORKDIR /home/instainfo
RUN adduser -D instainfo

COPY --from=build /wheels /wheels
COPY --chown=instainfo:instainfo requirements.txt /home/instainfo/
RUN pip3 install -r requirements.txt -f /wheels \
  && rm -rf /wheels \
  && rm -rf /root/.cache/pip/* \
  && rm requirements.txt

COPY --chown=instainfo:instainfo src/ /home/instainfo/src
COPY --chown=instainfo:instainfo instainfo.py /home/instainfo/
COPY --chown=instainfo:instainfo config/ /home/instainfo/config
USER instainfo

ENTRYPOINT ["python", "instainfo.py"]
