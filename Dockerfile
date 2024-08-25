FROM hugomods/hugo:0.133.0 AS build
COPY . /src
RUN hugo

FROM nginx:1.27-alpine AS runtime
COPY --from=build /src/public /usr/share/nginx/html
