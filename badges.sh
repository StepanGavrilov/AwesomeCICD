flake8 src --exit-zero --format=html --statistics --tee --output-file reports/flake8/flake8stats.txt
coverage run -m pytest --junitxml=reports/junit/junit.xml tests/test.py -vv -p no:cacheprovider
coverage xml -o reports/coverage/coverage.xml
coverage report
