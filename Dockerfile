FROM hugomods/hugo:0.154.5 AS build
COPY . /src
RUN cd themes \
 && rm -rf hugo-profile \
 && git clone https://github.com/gurusabarish/hugo-profile.git \
 && cd hugo-profile \
 && git checkout v4.052 \
 && cd ../../ \
 && hugo

FROM nginx:1.29-alpine AS runtime
COPY --from=build /src/public /usr/share/nginx/html
