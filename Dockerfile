FROM hugomods/hugo:0.133.0 AS build
COPY . /src
RUN cd themes \
 && rm -rf hugo-profile \
 && git clone https://github.com/gurusabarish/hugo-profile.git \
 && cd hugo-profile \
 && git checkout v4.051 \
 && cd ../../ \
 && hugo

FROM nginx:1.27-alpine AS runtime
COPY --from=build /src/public /usr/share/nginx/html
