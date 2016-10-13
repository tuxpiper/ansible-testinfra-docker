# docker-compose old style (<1.6)

        docker-compose -f docker-compose.1.yaml run --rm cc
        ... clean up target container ...
        docker-compose -f docker-compose.1.yaml stop
        docker-compose -f docker-compose.1.yaml rm -f

# docker-compose new style (>=1.6)

        docker-compose run --rm cc
        ... clean up target container ...
        docker-compose stop
        docker-compose rm -f
