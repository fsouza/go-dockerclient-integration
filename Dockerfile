FROM debian

RUN useradd -m gopher
ADD . /home/gopher
RUN chown -R gopher:gopher /home/gopher
